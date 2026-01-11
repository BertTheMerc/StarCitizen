from libs import Helper, Repo
from Domain import TradeRoute
import pygame
from pygame.locals import *
from Screens import MultiList

class ShipComponents(MultiList.MultiList):
    def __init__(self, screen, fonts):
        print ("Ship Components")
        data_source = Repo.Repo.get_all_components()
        
        type_seen = set()
        item_types = []

        for item in data_source:  
            if item.comp_type not in type_seen:
                type_seen.add(item.comp_type)
                item_types.append(item.comp_type)

        columns = ["Name", "Made by", "Class", "Grade", "Size"]

        item_sub_types = []
        for x in item_types:
            item_sub_types.append(["Civilian","Industrial","Competition","Military","Stealth"])

        super().__init__(screen, "Ship Components", fonts, item_types, item_sub_types, columns, [100, 220, 540, 700, 820])
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
