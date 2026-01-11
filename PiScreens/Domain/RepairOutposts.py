from os import system
from typing import List, Optional
from Domain import MultiListBase


class RepairOutpost(MultiListBase.Base):
    def __init__(self, system: str, group: str, area: str, name: str, pad_sizes: str, repair: bool, garage: bool):
        self.id = 0
        self.system = system
        self.group = group
        self.name = name
        self.area = area
        self.pad_sizes = pad_sizes
        self.repair = repair
        self.garage = garage  


        self.item_type = system
        self.sub_item_type = group
        self.col_0 = area
        self.col_1 = name
        self.col_2 = pad_sizes
        self.col_3 = (bool)(repair)
        self.col_4 = (bool)(garage)