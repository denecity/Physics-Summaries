import time
import pyautogui

# Speed settings
pyautogui.PAUSE = 0
pyautogui.MINIMUM_DURATION = 0
pyautogui.MINIMUM_SLEEP = 0

START_DELAY = 5.0
MEAN_CLICK_DELAY = 0.12  # fast human
JITTER = 0.05

POINTS = [
    (1734, 715),
    (2096, 703),
    (2444, 710),
    (2458, 1089),
    (2124, 1071),
    (1739, 1081),
    (1742, 1477),
    (2102, 1443),
    (2449, 1437),
    (2535, 1717),  # confirm
]

CONFIRM = POINTS[-1]
BITS = POINTS[:-1]


def human_delay():
    import random
    d = random.gauss(MEAN_CLICK_DELAY, JITTER)
    return max(0.03, d)


def click_point(pt):
    x, y = pt
    pyautogui.click(x, y)
    time.sleep(human_delay())


def main():
    print(f"Starting in {START_DELAY} seconds...")
    time.sleep(START_DELAY)

    # initial state is all 0
    prev = [0] * len(BITS)

    # iterate all configurations 0..2^9-1
    for n in range(2 ** len(BITS)):
        curr = [(n >> i) & 1 for i in range(len(BITS))]

        # click only bits that change
        for i, (p, c) in enumerate(zip(prev, curr)):
            if p != c:
                click_point(BITS[i])

        # confirm
        click_point(CONFIRM)

        prev = curr

    print("Done.")


if __name__ == "__main__":
    main()
