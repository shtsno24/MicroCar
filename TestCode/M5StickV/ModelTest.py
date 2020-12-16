import sensor
import image
import time
import lcd
import _thread
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
load_state = kpu.set_outputs(task, 0, 1, 1, 20)
lcd.draw_string(150, 50, ("Done" if load_state is True else "None"))

lcd.draw_string(10, 65, "throttle")
load_state = kpu.set_outputs(task, 1, 1, 1, 16)
lcd.draw_string(150, 65, ("Done" if load_state is True else "None"))

kpu.memtest()
lcd.draw_string(170, 35, "Done")

print("Done")
time.sleep_ms(1000)
lcd.draw_string(170, 5, "Done     ")
time.sleep_ms(500)
lcd.draw_string(60, 119, "Setup Done! :)")


img = sensor.snapshot()
kpu_img = img.copy((0, 60, 160, 60))
a = lcd.display(kpu_img)


def run_kpu():
    while True:
        print("KPU : fetch data from Camera")
        img = sensor.snapshot()
        kpu_img = img.copy((0, 60, 160, 60))
        print("KPU : run kpu")
        a = kpu.forward(task, kpu_img)
        print("KPU : fetch data from kpu")
        output_steer = kpu.get_output(task, 0)
        output_throttle = kpu.get_output(task, 1)
        print("KPU : Data", output_steer, output_throttle)
        time.sleep_ms(1)


def run_lcd():
    while True:
        print("LCD : fetch data from Camera")
        img = sensor.snapshot()
        kpu_img = img.copy((0, 60, 160, 60))
        a = lcd.display(kpu_img)
        time.sleep_ms(1)


_thread.start_new_thread(run_kpu, ())
_thread.start_new_thread(run_lcd, ())

while True:
    time.sleep_ms(1)

lcd.clear((30, 111, 150))
