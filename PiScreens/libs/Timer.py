import threading
from datetime import timedelta
from enum import Enum
from typing import Optional


class TimerType(Enum):
    CountDown = 1
    CountUp = 2


class Timer:
    def __init__(self, *args):
        self._type: TimerType = TimerType.CountDown
        self._duration_a: timedelta = timedelta()
        self._duration_b: timedelta = timedelta()
        self._remaining_a: timedelta = timedelta()
        self._remaining_b: timedelta = timedelta()
        self._timer: Optional[threading.Timer] = None
        self.Active: bool = False

        if len(args) == 3 and isinstance(args[0], TimerType):
            self._type = args[0]
            self._duration_a = args[1]
            self._duration_b = args[2]
        elif len(args) == 1:
            if isinstance(args[0], TimerType):
                self._type = args[0]
            else:  # Assume ShipDetails
                self._type = TimerType.CountDown
                self.refresh(args[0])

        self._schedule_tick()

    def _schedule_tick(self):
        if self._timer:
            self._timer.cancel()
        self._timer = threading.Timer(1.0, self._timer_elapsed)
        if self.Active:
            self._timer.start()

    def refresh(self, ship):
        self._duration_a = ship.expedite
        self._duration_b = ship.claim
        self._remaining_a = self._duration_a
        self._remaining_b = self._duration_b
        self._schedule_tick()

    def _timer_elapsed(self):
        if self._type == TimerType.CountDown:
            if self._remaining_a.total_seconds() > 0:
                self._remaining_a -= timedelta(seconds=1)
                if self._remaining_a.total_seconds() <= 0 and self._remaining_b.total_seconds() <= 0:
                    self.Active = False
                    return  # stop scheduling further

            if self._remaining_b.total_seconds() > 0:
                self._remaining_b -= timedelta(seconds=1)

        else:  # CountUp
            self._remaining_a += timedelta(seconds=1)

        self._schedule_tick()

    def start(self):
        self._remaining_a = self._duration_a
        self._remaining_b = self._duration_b
        self.Active = True
        print ("Timer Started")
        self._schedule_tick()

    def stop(self, reset=False):
        if self._timer:
            self._timer.cancel()
        self.Active = False
        if reset:
            self._remaining_a = timedelta()

    def a_display(self) -> str:
        if self._type == TimerType.CountDown:
            minutes = int(self._remaining_a.total_seconds() // 60)
            seconds = int(self._remaining_a.total_seconds() % 60)
            return f"{minutes:02d}:{seconds:02d}"
        else:
            hours = int(self._remaining_a.total_seconds() // 3600)
            minutes = int((self._remaining_a.total_seconds() % 3600) // 60)
            seconds = int(self._remaining_a.total_seconds() % 60)
            return f"{hours:02d}:{minutes:02d}:{seconds:02d}"

    def b_display(self) -> str:
        minutes = int(self._remaining_b.total_seconds() // 60)
        seconds = int(self._remaining_b.total_seconds() % 60)
        return f"{minutes:02d}:{seconds:02d}"
