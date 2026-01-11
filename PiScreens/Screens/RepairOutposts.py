from libs import Helper, Repo
from Domain import TradeRoute
import pygame
from pygame.locals import *
from Screens import MultiList

class RepairOutposts(MultiList.MultiList):
    def __init__(self, screen, fonts):
        print ("Repair Outposts")
        data_source = Repo.Repo.get_all_outposts()
        
        system_seen = set()
        item_type = []

        for item in data_source:  
            if item.system not in system_seen:
                system_seen.add(item.system)
                item_type.append(item.system)
                print(item.system)

        columns = ["Area", "Outpost", "Pad Size", "Repairs", "Garage"]

        item_sub_type = []
                
        for system in item_type:
            group_seen = set()
            sub = []
            for item in data_source:  
                if item.system == system:
                    if item.group not in group_seen:
                        group_seen.add(item.group)
                        sub.append(item.group)
                        print ("%s <-> %s" % (system, item.group))
        
            item_sub_type.append(sub)

        print (item_type)
        print (item_sub_type)

        super().__init__(screen, "Outposts", fonts, item_type, item_sub_type, columns, [100, 220, 540, 700, 820])
        self.data_source = data_source 

    def create(self):
        pass

    def display(self):
        super().display()
        
    def action1(self):
        super().action1()

    def action2(self):
        super().action2()

    def action3(self):
        super().action3()

    def adjust1(self):
        super().adjust1()

    def adjust2(self):
        super().adjust2()

    def adjust3(self):
        super().adjust3()

    def quit(self):
        pass