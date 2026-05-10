from dataclasses import dataclass
from typing import List, Optional
from Domain import MultiListBase

@dataclass
class ShipWeapon(MultiListBase.Base):
    id: int
    category: str
    name: str
    comp_type: str
    man: str
    size: int
    
    @staticmethod
    def from_json(data):
        return ShipWeapon(
            name = data["componentName"],
            id = data["id"],
            category = data["category"],
            comp_type = data["comp_type"],
            man = data["man"],
            size = data["size"]
            )
    
    
    
    
    #item_type: str = comp_type
    #sub_item_type = c
    #col_0 = name
    #col_1 = man
    #col_2 = c
    #col_3 = grade
    #col_4 = size
