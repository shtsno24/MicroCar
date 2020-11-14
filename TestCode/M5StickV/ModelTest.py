import sensor
import image
import time
import lcd
import KPU as kpu
import ulab as np


# Init LCD
print("init LCD")
lcd.init(type=3, freq=40000000)
lcd.rotation(2)  # Rotate the lcd 180deg
sensor.reset(dual_buff=True)

sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QQVGA)  # 160 x 120
sensor.skip_frames(100)
sensor.run(1)

# Init KPU
print("init KPU")
lcd.draw_string(10, 5, "init kpu")
lcd.draw_string(170, 5, "Running")

lcd.draw_string(10, 20, "load kmodel")
kpu.memtest()
task = kpu.load(0x600000)
lcd.draw_string(170, 20, "Done")

lcd.draw_string(10, 35, "set outputs")

lcd.draw_string(10, 50, "steer")
load_state = kpu.set_outputs(task, 0, 1, 1, 1)
lcd.draw_string(150, 50, ("Done" if load_state is True else "None"))

lcd.draw_string(10, 65, "throttle")
load_state = kpu.set_outputs(task, 1, 1, 1, 1)
lcd.draw_string(150, 65, ("Done" if load_state is True else "None"))

kpu.memtest()
lcd.draw_string(170, 35, "Done")

print("Done")
time.sleep_ms(1000)
lcd.draw_string(170, 5, "Done     ")
time.sleep_ms(500)
lcd.draw_string(60, 119, "Setup Done! :)")

#clock = time.clock()

while True:
    print("\n\ntake a snapshot")
    img = sensor.snapshot()
    a = lcd.display(img)
    print("run kpu")
    a = kpu.forward(task, img)
    print("fetch data from kpu")
    output_steer = kpu.get_output(task, 0)
    output_throttle = kpu.get_output(task, 1)
    print("Data", output_steer, output_throttle)

lcd.clear((30, 111, 150))
