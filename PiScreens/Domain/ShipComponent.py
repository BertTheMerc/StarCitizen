from dataclasses import dataclass
from typing import List, Optional
from Domain import MultiListBase

@dataclass
class ShipComponent(MultiListBase.Base):
    category: str
    id: int
    name: str
    man: str
    manCode: str
    size: int
    compClass: str
    grade: str
    trackingSignalType: str
    health: int
    price: int
    scuSize: int
    salePrice: int
    saleReturn: int
    
    @staticmethod
    def from_json(data):
        print (data)
        return ShipComponent(
            category= data["categoryName"],
            id = data["componentId"],
            name = data["componentName"],
            man = data["manufacturerName"],
            manCode = data["manufacturerCode"],
            size = data["sizeOfComponent"],
            compClass= data["class"],
            grade = data["grade"],
            trackingSignalType = data["trackingSignalType"],
            health= data["health"],
            price= data["price"],
            scuSize= data["scuSize"],
            salePrice= data["salePrice"],
            saleReturn= data["return"]
            )
    
    
    
    
    #item_type: str = comp_type
    #sub_item_type = c
    #col_0 = name
    #col_1 = man
    #col_2 = c
    #col_3 = grade
    #col_4 = size
