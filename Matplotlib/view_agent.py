import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import time


class ViewAgent:

    def __init__(self, limit=1000, len_points=10, icon_radius=100):
        self.fig = plt.figure()
        self.limit = limit

        # self.agent_icon = mpatches.Circle(xy=(0, 0), radius=icon_radius, ec="r", fill=False)
        self.agent_icon = mpatches.RegularPolygon(xy=(0, 0), numVertices=4, radius=icon_radius, orientation=0.0, ec="r", fill=False)

        self.pos_ax = self.fig.add_subplot(1, 1, 1)
        self.pos_bg = self.fig.canvas.copy_from_bbox(self.pos_ax.bbox)
        self.pos_ax.set_xlim(-limit, limit)
        self.pos_ax.set_ylim(-limit, limit)
        self.pos_points = self.pos_ax.scatter([], [])
        self.xy = [[0.0, 0.0] for x in range(len_points)]
        self.pos_ax.add_patch(self.agent_icon)
        self.fig.canvas.draw()
        self.fig.show()

    def update_pos(self, points, orientation=0.0):
        self.xy.append(points)
        self.xy.pop(0)
        self.pos_ax.draw_artist(self.pos_ax.patch)  # draw background with white
        self.pos_points.set_offsets(self.xy)
        self.agent_icon.xy = points
        self.agent_icon.orientation = orientation
        self.pos_ax.draw_artist(self.agent_icon)
        self.pos_ax.draw_artist(self.pos_points)
        self.fig.canvas.blit(self.pos_ax.bbox)

    def plot(self, points, orientation=0.0):
        self.update_pos(points, orientation)
        self.fig.canvas.flush_events()


if __name__ == "__main__":
    plot_view = ViewAgent()

    sum_time = 0.0
    input(">>")
    for i in range(1000):
        rand_array = np.random.randint(0, 1000, 2)
        start = time.perf_counter_ns()
        plot_view.plot(rand_array)
        while True:
            end = time.perf_counter_ns()
            if ((end - start) * 1.0e-9) > 0.001:
                break
        sum_time += end - start
    print("Done : " + str(1000.0 / sum_time / 1.0e-9) + " [fps]")
