import sensor
import image
import utime
import lcd
import uos
from fpioa_manager import *
from Maix import GPIO
import KPU as kpu
import ulab as np


# Init LEDs
fm.register(board_info.LED_R, fm.fpioa.GPIO0)
led_r = GPIO(GPIO.GPIO0, GPIO.OUT)
led_r.value(1)  # 0 : ON, 1: OFF

fm.register(board_info.LED_G, fm.fpioa.GPIO1)
led_g = GPIO(GPIO.GPIO1, GPIO.OUT)
led_g.value(1)  # 0 : ON, 1: OFF

fm.register(board_info.LED_B, fm.fpioa.GPIO2)
led_b = GPIO(GPIO.GPIO2, GPIO.OUT)
led_b.value(1)  # 0 : ON, 1: OFF

fm.register(board_info.LED_W, fm.fpioa.GPIO3)
led_w = GPIO(GPIO.GPIO3, GPIO.OUT)
led_w.value(1)  # 0 : ON, 1: OFF

# Init Button
fm.register(board_info.BUTTON_A, fm.fpioa.GPIO4)
button_a = GPIO(GPIO.GPIO4, GPIO.PULL_UP)

# Init LCD
print("init LCD")
lcd.init(type=3, freq=40000000)
lcd.rotation(2)
sensor.reset(dual_buff=True)

# Init camera
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.skip_frames(100)
sensor.run(1)

# Find /SD
if uos.getcwd() != "/sd":
    sd_flag = False
else:
    sd_flag = True

clock = utime.clock()
img_cnt = 0

while True:
    # Transfer a frame to PC
    led_r.value(0)
    fbuffer = sensor.get_fb()
    img = sensor.snapshot()
    fbuffer = img
    led_r.value(1)

    # Display img to LCD
    led_g.value(0)
    lcd.display(img)
    led_g.value(1)

    # Write img to SD
    led_b.value(0)
    if button_a.value() == 0:
        if sd_flag is True:
            file_name = "img_" + str(img_cnt) + ".jpg"
            lcd.draw_string(10, 10, file_name + " is taken!")
            img_cnt += 1
            img_jpg = img.compress(quality=50)
            img_jpg.save("/sd/" + file_name)
            utime.sleep_ms(1000)
        else:
            lcd.draw_string(10, 10, "SD card was not found!")
            utime.sleep_ms(1000)
    led_b.value(1)


lcd.clear((30, 111, 150))
led_r.value(1)
led_g.value(1)
led_b.value(1)
led_w.value(1)
