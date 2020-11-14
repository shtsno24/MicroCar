import numpy as np


class BaseAgent:

    # jvec/jvec_old : [m/s^3]
    # avec/avec_old : [m/s^2]
    # vvec/vvec_old : [m/s]
    # pvec/pvec_old : [m]
    # ts : [s]

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
