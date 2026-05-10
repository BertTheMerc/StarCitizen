from dataclasses import dataclass
from typing import List, Optional
from Domain import MultiListBase

@dataclass
class RepairOutpost(MultiListBase.Base):
    id: int
    system: str 
    group: str 
    area: str 
    name: str 
    pad_sizes: str 
    repair: bool 
    garage: bool
    category: str

    @staticmethod
    def from_json(data):
         item = RepairOutpost(
            id = data["id"],
            system = data["systemName"],
            group = data["subSystemName"],
            name = data["outpostName"],
            area = data["area"],
            pad_sizes = data["padSizes"],
            repair = data["repair"],
            garage = data["garage"],
            category= ""
         )

         item.category = item.system + ">" + item.group

         return item
        
     #self.id = 0
     #   self.system = system
     #   self.group = group
     #   self.name = name
     #   self.area = area
     #   self.pad_sizes = pad_sizes
     #   self.repair = repair
     #   self.garage = garage  
     #   self.category = system + " → " + group

      #  self.item_type = system
      #  self.sub_item_type = group
      #  self.col_0 = area
      #  self.col_1 = name
      #  self.col_2 = pad_sizes
      #  self.col_3 = (bool)(repair)
      #  self.col_4 = (bool)(garage)