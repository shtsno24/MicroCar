import numpy as np
import matplotlib.pyplot as plt

import base_agent
import plotter


class SteerAgent(base_agent.BaseAgent):
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
        ufunc = np.frompyfunc(func, 3, 1)
        self.pvec = ufunc(self.vvec, self.vvec_old, self.pvec)
        self.vvec_old = np.copy(self.vvec)

    def update_vel(self, func):
        ufunc = np.frompyfunc(func, 3, 1)
        self.vvec = ufunc(self.avec, self.avec_old, self.vvec)
        self.avec_old = np.copy(self.avec)

    def update_acc(self, func):
        ufunc = np.frompyfunc(func, 3, 1)
        self.avec = ufunc(self.jvec, self.jvec_old, self.avec)
        self.jvec_old = np.copy(self.jvec)

    def update_jerk(self, jvec=np.zeros(3, dtype=np.float32)):
        self.jvec = jvec


if __name__ == "__main__":
    fig = plt.figure()
    pos_ax = fig.add_subplot(2, 1, 1)
    line_ax = fig.add_subplot(2, 1, 2)
    plot_view = plotter.Scatter(fig, pos_ax, plot_area=(200.0, 200.0), len_points=200, show_icon=True, icon_radius=10.0)
    line_view = plotter.Line(fig, line_ax, plot_area=(12000, 1), len_points=12000)
    agent = SteerAgent()
    update_func = lambda x, y, z: z + (x + y) * agent.ts / 2.0

    input(">>")
    for i in range(12000):
        agent.update_jerk(np.array([np.cos(i / 4000.0),
                                    np.sin(i / 4000.0),
                                    np.sin(i / 4000.0)]))
        agent.update_acc(update_func)
        agent.update_vel(update_func)
        agent.update_pos(update_func)
        plot_view.plot(agent.pvec[:2], agent.pvec[2])
        line_view.plot(agent.avec[0])
    input(">>")
