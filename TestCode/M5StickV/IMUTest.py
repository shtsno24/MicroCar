import image
import utime
import lcd
import uos
import math
from machine import I2C
from fpioa_manager import *
from Maix import GPIO


# Init Button
fm.register(board_info.BUTTON_A, fm.fpioa.GPIO4)
button_a = GPIO(GPIO.GPIO4, GPIO.PULL_UP)

# Init LCD
print("init LCD")
lcd.init(type=3, freq=400000)
lcd.clear()
lcd.rotation(2)

# Find /SD
if uos.getcwd() != "/sd":
    sd_flag = False
else:
    sd_flag = True
print("sd : ", sd_flag)

# Init IMU
fm.register(25, fm.fpioa.GPIO5)
i2c_cs = GPIO(GPIO.GPIO5, GPIO.OUT)
i2c_cs.value(1)
fm.register(24, fm.fpioa.GPIO6)
imu_ad0 = GPIO(GPIO.GPIO6, GPIO.OUT)
imu_ad0.value(0)
i2c = I2C(I2C.I2C0, freq=400000, scl=26, sda=27)
devices = i2c.scan()
print("IC2:", devices)
utime.sleep_ms(300)

MPU6886_ADDRESS = 0x68
MPU6886_WHOAMI = 0x75
MPU6886_ACCEL_INTEL_CTRL = 0x69
MPU6886_SMPLRT_DIV = 0x19
MPU6886_INT_PIN_CFG = 0x37
MPU6886_INT_ENABLE = 0x38
MPU6886_ACCEL_XOUT_H = 0x3B
MPU6886_TEMP_OUT_H = 0x41
MPU6886_GYRO_XOUT_H = 0x43
MPU6886_USER_CTRL = 0x6A
MPU6886_PWR_MGMT_1 = 0x6B
MPU6886_PWR_MGMT_2 = 0x6C
MPU6886_CONFIG = 0x1A
MPU6886_GYRO_CONFIG = 0x1B
MPU6886_ACCEL_CONFIG = 0x1C
MPU6886_ACCEL_CONFIG2 = 0x1D
MPU6886_FIFO_EN = 0x23
MPU6886_DATA = [0.0 for x in range(7)]


def write_i2c(address, value):
    i2c.writeto_mem(MPU6886_ADDRESS, address, bytearray([value]))
    utime.sleep_ms(100)


def MPU6886_init():
    print(i2c.readfrom_mem(MPU6886_ADDRESS, MPU6886_WHOAMI, 1))
    write_i2c(MPU6886_PWR_MGMT_1, 0x00)
    write_i2c(MPU6886_PWR_MGMT_1, 0x01 << 7)
    write_i2c(MPU6886_PWR_MGMT_1, 0x01 << 0)
    write_i2c(MPU6886_ACCEL_CONFIG, 0x10)  # pm8G
    write_i2c(MPU6886_GYRO_CONFIG, 0x10)  # pm1000dps
    write_i2c(MPU6886_CONFIG, 0x01)
    write_i2c(MPU6886_SMPLRT_DIV, 0x05)
    write_i2c(MPU6886_INT_ENABLE, 0x00)
    write_i2c(MPU6886_ACCEL_CONFIG2, 0x00)
    write_i2c(MPU6886_USER_CTRL, 0x00)
    write_i2c(MPU6886_FIFO_EN, 0x00)
    write_i2c(MPU6886_INT_PIN_CFG, 0x22)
    write_i2c(MPU6886_INT_ENABLE, 0x01)


def MPU6886_read():
    data = i2c.readfrom_mem(MPU6886_ADDRESS, MPU6886_ACCEL_XOUT_H, 14)
    for i in range(7):
        buff = (data[i * 2] << 8 | data[i * 2 + 1])
        if buff > 32768:
            buff -= 65536

        if i < 3:
            MPU6886_DATA[i] = buff * 8.0 / 32768.0
        elif i == 3:
            MPU6886_DATA[i] = buff / 326.8 + 25.0
        else:
            MPU6886_DATA[i] = buff * 1000.0 / 32768.0


MPU6886_init()

# Init graph
graph = image.Image()
graph.draw_rectangle(20, 15, 200, 100, (150, 150, 150), 1, False)
graph.draw_line(10, 65, 230, 65, (100, 100, 100))


def write_graph(graph, data, graph_x_origin=20, graph_y_origin=115, x_offset=0, y_offset=0, color=(30, 111, 150)):
    for t in range(len(data)):
        graph.set_pixel(t + graph_x_origin + x_offset, graph_y_origin - data[t] - y_offset, color)


test_data = list(map(lambda x: int(math.sin(x / 20) * 40), range(0, 200)))

write_graph(graph, test_data, y_offset=50)
lcd.display(graph)

graph_data_queue = [0 for x in range(200)]
graph_data_queue2 = [0 for x in range(200)]
clock = utime.clock()
img_cnt = 0

while True:
    if button_a.value() == 1:
        MPU6886_read()
        # print("\n" * 5)

        for _ in range(200):
            graph_data_queue.pop(0)
            graph_data_queue.append(int(MPU6886_DATA[4] * 10))
            graph_data_frac = graph_data_queue[-101:-1]
            mean_offset = sum(graph_data_frac) / len(graph_data_frac) / 10
            graph_data_queue2.pop(0)
            graph_data_queue2.append(int((MPU6886_DATA[4] - mean_offset) * 10))

        # print(MPU6886_DATA[4], MPU6886_DATA[4] - mean_offset)

        graph.draw_rectangle(21, 16, 199, 99, (0, 0, 0), 1, True)
        graph.draw_rectangle(20, 15, 200, 100, (150, 150, 150), 1, False)
        graph.draw_line(10, 65, 230, 65, (100, 100, 100))
        write_graph(graph, graph_data_queue, y_offset=50)
        write_graph(graph, graph_data_queue2, y_offset=50, color=(150, 30, 110))
        lcd.display(graph)

        while button_a.value() == 1:
            pass
        file_name = "img_" + str(img_cnt) + ".bmp"
        lcd.draw_string(10, 10, file_name + " is taken!")
        img_cnt += 1
        graph.save("/sd/" + file_name)
    else:
        if sd_flag is True:
            file_name = "img_" + str(img_cnt) + ".bmp"
            lcd.draw_string(10, 10, file_name + " is taken!")
            img_cnt += 1
            graph.save("/sd/" + file_name)
        else:
            lcd.draw_string(10, 10, "SD card was not found!")

    utime.sleep_ms(1000)

lcd.clear((30, 111, 150))
