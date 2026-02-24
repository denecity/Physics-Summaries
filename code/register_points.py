import time
import pyautogui  # library for continuous mouse control
from pynput import mouse

time.sleep(5)

NUM_POINTS = 10

points = []

def on_click(x, y, button, pressed):
    if pressed:
        points.append((x, y))
        print(f"Point {len(points)}: ({x}, {y})")
        if len(points) >= NUM_POINTS:
            return False

print(f"Click {NUM_POINTS} points... (pressing will register)")
with mouse.Listener(on_click=on_click) as listener:
    listener.join()

print("Registered points:", points)
