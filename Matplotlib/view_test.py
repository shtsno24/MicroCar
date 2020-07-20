import numpy as np
import matplotlib.pyplot as plt
import time


class BaseAgent:

    # jvec = None
    # avec = None
    # vvec = None
    # pvec = None

    # jvec_old = None
    # avec_old = None
    # vvec_old = None
    # pvec_old = None

    # ts = None  # [s]

    def __init__(self,
                 jvec=np.zeros(3, dtype=np.float32),
                 avec=np.zeros(3, dtype=np.float32),
                 vvec=np.zeros(3, dtype=np.float32),
                 pvec=np.zeros(3, dtype=np.float32),
                 ts=0.001):

        self.jvec = jvec
        self.avec = avec
        self.vvec = vvec
        self.pvec = pvec
        self.ts = ts
        self.jvec_old = np.copy(self.jvec)
        self.avec_old = np.copy(self.avec)
        self.vvec_old = np.copy(self.vvec)
        self.pvec_old = np.copy(self.pvec)


class SteerAgent(BaseAgent):

    # steer_angle = None

    def __init__(self,
                 steer_angle=0.0,
                 jvec=np.zeros(3, dtype=np.float32),
                 avec=np.zeros(3, dtype=np.float32),
                 vvec=np.zeros(3, dtype=np.float32),
                 pvec=np.zeros(3, dtype=np.float32),
                 ts=0.001):

        super().__init__(jvec, avec, vvec, pvec, ts)
        self.steer_angle = steer_angle

    def update_pos(self, func):
        ufunc = np.frompyfunc(func, 2, 1)
        self.pvec = ufunc(self.vvec, self.vvec_old)
        self.vvec_old = np.copy(self.vvec)

    def update_vel(self, func):
        ufunc = np.frompyfunc(func, 2, 1)
        self.vvec = ufunc(self.avec, self.avec_old)
        self.avec_old = np.copy(self.avec)

    def update_acc(self, func):
        ufunc = np.frompyfunc(func, 2, 1)
        self.avec = ufunc(self.jvec, self.jvec_old)
        self.jvec_old = np.copy(self.jvec)

    def update_jvec(self, jvec=np.zeros(3, dtype=np.float32)):
        self.jvec = jvec


class view_agent:

    def __init__(self):
        self.fig = plt.figure()

        self.pos_ax = self.fig.add_subplot(1, 1, 1)
        self.pos_ax.set_xlim(0, 1000)
        self.pos_ax.set_ylim(0, 1000)
        self.pos_points = self.pos_ax.scatter([], [])

        self.xy = []
        self.pos_bg = self.fig.canvas.copy_from_bbox(self.pos_ax.bbox)

        self.fig.canvas.draw()
        self.fig.show()

    def update_pos(self, points):
        self.fig.canvas.restore_region(self.pos_bg)
        self.xy.append(points)
        self.pos_points.set_offsets(self.xy)
        self.pos_ax.draw_artist(self.pos_points)
        self.fig.canvas.blit(self.pos_ax.bbox)

    def plot(self, points):
        self.update_pos(points)
        self.fig.canvas.flush_events()


if __name__ == "__main__":
    plot_view = view_agent()
    sum_time = 0.0
    input(">>")
    for i in range(1000):
        rand_array = np.random.randint(0, 1000, 2)
        start = time.perf_counter_ns()
        plot_view.plot(rand_array)
        while True:
            end = time.perf_counter_ns()
            if ((end - start) * 1.0e-9) > 0.01:
                break
        sum_time += end - start
    print("Done : " + str(1000.0 / sum_time / 1.0e-9) + " [fps]")