import itertools
import random
import time
import pyautogui

# Tuning
START_DELAY = 5.0
MEAN_KEY_DELAY = 0.08  # ~12.5 chars/sec
JITTER = 0.04          # +/- jitter
BACKSPACES = 5


def human_delay():
    # Clamp to a small positive delay
    d = random.gauss(MEAN_KEY_DELAY, JITTER)
    return max(0.01, d)


def type_with_delay(text: str):
    for ch in text:
        pyautogui.write(ch)
        time.sleep(human_delay())


def main():
    s = input("Enter string: ")
    if not s:
        print("Empty string; nothing to do.")
        return

    print(f"Starting in {START_DELAY} seconds...")
    time.sleep(START_DELAY)

    # Generate unique permutations (handles repeated characters)
    seen = set()
    for perm in itertools.permutations(s):
        if perm in seen:
            continue
        seen.add(perm)
        text = "".join(perm)

        type_with_delay(text)
        pyautogui.press("enter")
        time.sleep(human_delay())
        for _ in range(BACKSPACES):
            pyautogui.press("backspace")
            time.sleep(human_delay())

    print("Done.")


if __name__ == "__main__":
    main()
