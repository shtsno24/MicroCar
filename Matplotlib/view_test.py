import numpy as np
import matplotlib.pyplot as plt


class BaseAgent:

    ax = 0.0
    ay = 0.0
    ar = 0.0
    vx = 0.0
    vy = 0.0
    vr = 0.0
    px = 0.0
    py = 0.0
    pr = 0.0

    def __init__(self, ax=0.0, ay=0.0, ar=0.0, vx=0.0, vy=0.0, vr=0.0, px=0.0, py=0.0, pr=0.0):
        self.ax = ax
        self.ay = ay
        self.ar = ar
        self.vx = vx
        self.vy = vy
        self.vr = vr
        self.px = px
        self.py = py
        self.pr = pr


class SteerAgent(BaseAgent):

    steer_angle = 0.0

    def __init__(self, steer_angle=0.0, ax=0.0, ay=0.0, ar=0.0, vx=0.0, vy=0.0, vr=0.0, px=0.0, py=0.0, pr=0.0):
        super().__init__(ax, ay, ar, vx, vy, vr, px, py, pr)
        self.steer_angle = steer_angle
