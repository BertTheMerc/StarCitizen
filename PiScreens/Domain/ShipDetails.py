from datetime import timedelta


class ShipDetails:
    def __init__(self, name: str, claim: timedelta, expedite: timedelta, cost: int):
        self.id = 0
        self.name = name
        self.claim = claim
        self.expedite = expedite
        self.cost = cost

    @property
    def claim_display(self) -> str:
        minutes = int(self.claim.total_seconds() // 60)
        seconds = int(self.claim.total_seconds() % 60)
        return f"{minutes:02d}:{seconds:02d}"

    @property
    def expedite_display(self) -> str:
        minutes = int(self.expedite.total_seconds() // 60)
        seconds = int(self.expedite.total_seconds() % 60)
        return f"{minutes:02d}:{seconds:02d}"


