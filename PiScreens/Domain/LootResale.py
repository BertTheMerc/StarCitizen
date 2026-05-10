from dataclasses import dataclass
from typing import List, Optional
from Domain import MultiListBase

@dataclass
class LootResale(MultiListBase.Base):
    id: int
    name: str
    itemType: int
    subType: str
    name: str
    size: int
    cargoSale: int
    amount_per_volume: int
        
    @staticmethod
    def from_json(data):
        item = LootResale(
            id = data["id"],
            name = data["itemName"],
            itemType = data["itemType"],
            subType = data["subType"],
            size = data["scuSize"],
            cargoSale = data["cargoSaleValue"],
            amount_per_volume= 0
        )

        item.amount_per_volume = item.cargoSale / item.size

        return item
            #self.col_0 = self.name
            #self.col_1 = self.size
            #self.col_2 = self.cargo_sale
            #self.col_3 = (int)(self.amount_per_volume)