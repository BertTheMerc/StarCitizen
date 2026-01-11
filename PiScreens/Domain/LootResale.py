from re import A
from typing import List, Optional
from Domain import MultiListBase

class LootResale(MultiListBase.Base):
    def __init__(self, name: str, item_type: int, sub_item_type: int, size: float, cargo_sale: int):
        self.id = 0
        self.name = name
        self.item_type = item_type
        self.sub_item_type = sub_item_type
        self.size = size
        self.cargo_sale = cargo_sale
        self.amount_per_volume = cargo_sale / size

        self.col_0 = self.name
        self.col_1 = self.size
        self.col_2 = self.cargo_sale
        self.col_3 = (int)(self.amount_per_volume)