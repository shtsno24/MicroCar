import numpy as np
import matplotlib.pyplot as plt
import time

import view_agent

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
    plot_view = view_agent.ViewAgent(limit=200.0, len_points=1000, icon_radius=10.0)
    agent = SteerAgent()

    input(">>")
    for i in range(12000):
        agent.update_jerk(np.array([np.cos(i / 4000.0) + (np.random.randn() / 50.0),
                                    np.sin(i / 4000.0) + (np.random.randn() / 50.0),
                                    np.sin(i / 4000.0)]))
        agent.update_acc(lambda x, y, z: z + (x + y) * agent.ts / 2.0)
        agent.update_vel(lambda x, y, z: z + (x + y) * agent.ts / 2.0)
        agent.update_pos(lambda x, y, z: z + (x + y) * agent.ts / 2.0)
        plot_view.plot(agent.pvec[:2], agent.pvec[2])
    input(">>")
