from dataclasses import dataclass
from typing import List, Optional
from Domain import MultiListBase

@dataclass
class ShipDetails(MultiListBase.Base):
    id: int
    vehicleName: str
    manufacturer: str
    vehicleRole: str
    career: str
    size: str
    crewSizeMin: int
    crewSizeMax: int
    scmSpeed: int
    scmBoostForward: int
    scmBoostBackward: int
    navMax: int
    pitch: int
    yaw: int
    roll: int
    boostedPitch: int
    boostedYaw: int
    boostedRoll: int
    powerConsumption: int
    cmDecoyCount: int
    cmNoiseCount: int
    hitPoints: int
    cargoSize: int
    vehicleLength: int
    vehicleWidth: int
    vehicleHeight: int
    vehicleMass: int
    hydrogenTank: int
    quantiumTank: float
    claimTimeInSeconds: int
    expediteTimeInSeconds: int
    expediteCost: int
    pledged: bool
    inGame: bool


    @staticmethod
    def from_json(data):
        return ShipDetails(
            id = data["id"],
            vehicleName = data["vehicleName"],
            manufacturer= data["manufacturer"],
            vehicleRole = data["vehicleRole"],
            career = data["career"],
            size = data["size"],
            crewSizeMin = data["crewSizeMin"],
            crewSizeMax = data["crewSizeMax"],
            scmSpeed = data["scmSpeed"],
            scmBoostForward = data["scmBoostForward"],
            scmBoostBackward = data["scmBoostBackward"],
            navMax = data["navMax"],
            pitch = data["pitch"],
            yaw = data["yaw"],
            roll = data["roll"],
            boostedPitch = data["boostedPitch"],
            boostedYaw = data["boostedYaw"],
            boostedRoll = data["boostedRoll"],
            powerConsumption = data["powerConsumption"],
            cmDecoyCount = data["cmDecoyCount"],
            cmNoiseCount = data["cmNoiseCount"],
            hitPoints = data["hitPoints"],
            cargoSize = data["cargoSize"],
            vehicleLength = data["vehicleLength"],
            vehicleWidth = data["vehicleWidth"],
            vehicleHeight = data["vehicleHeight"],
            vehicleMass = data["vehicleMass"],
            hydrogenTank = data["hydrogenTank"],
            quantiumTank = data["quantiumTank"],
            claimTimeInSeconds = data["claimTimeInSeconds"],
            expediteTimeInSeconds = data["expediteTimeInSeconds"],
            expediteCost = data["expediteCost"],
            pledged = data["pledged"],
            inGame = data["inGame"]
            )
    
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
