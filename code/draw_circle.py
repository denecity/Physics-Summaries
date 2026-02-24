import math
import time
import pyautogui

# Speed overrides for pyautogui
pyautogui.PAUSE = 0
pyautogui.MINIMUM_DURATION = 0
pyautogui.MINIMUM_SLEEP = 0

# Points from user
CENTER = (2101, 686)
EDGE = (2101, 475)

WAIT_SECONDS = 5
DRAW_SECONDS = 3
STEPS = 360  # smooth enough for a "perfect" circle


def main():
    cx, cy = CENTER
    ex, ey = EDGE

    # Compute radius and start angle based on the edge point
    dx = ex - cx
    dy = ey - cy
    radius = math.hypot(dx, dy)
    if radius == 0:
        raise ValueError("Center and edge points are identical; radius is zero.")

    start_angle = math.atan2(dy, dx)

    print(f"Waiting {WAIT_SECONDS} seconds...")
    time.sleep(WAIT_SECONDS)

    # Move to the edge point and start drawing
    pyautogui.moveTo(ex, ey, duration=0)
    pyautogui.mouseDown(button="left")

    start_time = time.perf_counter()
    for i in range(STEPS + 1):
        angle = start_angle + (2 * math.pi * i / STEPS)
        x = cx + radius * math.cos(angle)
        y = cy + radius * math.sin(angle)
        pyautogui.moveTo(x, y, duration=0)

        # Keep total duration close to DRAW_SECONDS
        target = start_time + (DRAW_SECONDS * i / STEPS)
        remaining = target - time.perf_counter()
        if remaining > 0:
            time.sleep(remaining)

    pyautogui.mouseUp(button="left")
    print("Done.")


if __name__ == "__main__":
    main()
