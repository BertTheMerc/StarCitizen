from typing import List, Optional
from Domain import MultiListBase

class ShipComponent(MultiListBase.Base):
    def __init__(self, name: str, comp_type: str, man: str, c: str, grade: str, size: int):
        self.id = 0
        self.name = name
        self.comp_type = comp_type
        self.man = man
        self.cclass = c
        self.grade = grade
        self.size = size

        self.item_type = comp_type
        self.sub_item_type = c
        self.col_0 = name
        self.col_1 = man
        self.col_2 = c
        self.col_3 = grade
        self.col_4 = size
