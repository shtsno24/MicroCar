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
sensor.set_framesize(sensor.QVGA)
sensor.skip_frames(100)
sensor.run(1)

# Init KPU
print("init KPU")
lcd.draw_string(10, 5, "init kpu")
lcd.draw_string(170, 5, "Running")

lcd.draw_string(10, 20, "load kmodel")
kpu.memtest()
task = kpu.load(0x500000)
lcd.draw_string(170, 20, "Done")

lcd.draw_string(10, 35, "set outputs")

lcd.draw_string(10, 50, "heatmaps")
load_state = kpu.set_outputs(task, 0, 17, 20, 15)
lcd.draw_string(150, 50, ("Done" if load_state is True else "None"))

lcd.draw_string(10, 65, "offsets")
load_state = kpu.set_outputs(task, 1, 34, 20, 15)
lcd.draw_string(150, 65, ("Done" if load_state is True else "None"))

lcd.draw_string(10, 80, "part_heatmaps")
load_state = kpu.set_outputs(task, 2, 24, 20, 15)
lcd.draw_string(150, 80, ("Done" if load_state is True else "None"))

lcd.draw_string(10, 95, "segments")
load_state = kpu.set_outputs(task, 3, 1, 20, 15)
lcd.draw_string(150, 95, ("Done" if load_state is True else "None"))

kpu.memtest()
lcd.draw_string(170, 35, "Done")

print("Done")
time.sleep_ms(1000)
lcd.draw_string(170, 5, "Done     ")
time.sleep_ms(500)
lcd.draw_string(60, 119, "Setup Done! :)")

clock = time.clock()
seg_img = image.Image()
lcd_img = image.Image()
Scale = 4

while True:
    print("\n\n\n\ntake a snapshot")
    img = sensor.snapshot()
    time.sleep_ms(10)
    a = lcd_img.draw_image(img, 0, 0, 0.4, 0.4)
    print("run kpu")
    a = kpu.forward(task, img)
    print("fetch data from kpu")
    #output_heatmaps = kpu.get_output(task, 0)
    #print(output_heatmaps)
    #output_offsets = kpu.get_output(task, 1)
    #print(output_offsets)
    #output_part_heatmaps = kpu.get_output(task, 2)
    #print(output_part_heatmaps)
    output_segments = kpu.get_output(task, 3)
    print(output_segments)
    #a = lcd.display(img)

    data = np.array(output_segments[:])
    #data = sigmoid_vec(data)
    #for i in range(len(data)):
        #data[i] = 255.0 if data[i] > 0.7 else 0.0
    print(np.max(data) * 255)

    for i in range(len(data)):
        _w = int(i / 20)
        _h = i % 15
        a = seg_img.set_pixel(_w, _h, (int(sigmoid(data[i]) * 255), 50, 50))
    a = lcd_img.draw_image(seg_img, 150, 70, Scale, Scale)
    lcd.display(lcd_img)

lcd.clear((30, 111, 150))
