from typing import List, Optional
from Domain import ShipDetails
from libs import Timer

class Fleet:
    def __init__(self):
        self._ships: List[ShipDetails.ShipDetails] = []
        self._timers: List[Timer.Timer] = []
    
    @property
    def ships(self) -> List[ShipDetails.ShipDetails]:
        return self._ships

    def add(self, ship_details: ShipDetails.ShipDetails):
        self._ships.append(ship_details)
        self._timers.append(Timer.Timer(ship_details))
            
    def get_ship(self, key) -> Optional[ShipDetails.ShipDetails]:
        if isinstance(key, str):
            for ship in self._ships:
                if ship.name == key:
                    return ship
            return None
        elif isinstance(key, int):
            if 0 <= key < len(self._ships):
                return self._ships[key]
            return None
        else:
            raise TypeError("Key must be a string (name) or integer (index)")

    def get_timer(self, key) -> Optional[Timer.Timer]:
        idx = 0
        if isinstance(key, str):
            for ship in self._ships:
                if ship.name == key:
                    return self._timers[idx]
                idx += 1
            
            print("Ship timer not found")
            return None
        else:
            raise TypeError("Key must be a string (name)")

    @property
    def count(self) -> int:
        return len(self._ships)
