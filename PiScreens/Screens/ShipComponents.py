from libs import Helper, Repo
from Domain import TradeRoute
import pygame
from pygame.locals import *
from Screens import MultiList

class ShipComponents(MultiList.MultiList):
    def __init__(self, screen, fonts):
        print ("Ship Components")

        repo = Repo.Repo()
        full_list = repo.get_vehicle_components()
        print (len(full_list))
        type_seen = set()
        item_types = []

        print (full_list[0])
        item_types = {c.category for c in full_list}

        columns = ["Name", "Made by", "Class", "Grade", "Size"]

        item_sub_types = []
        for x in item_types:
            item_sub_types.append(["Civilian","Industrial","Competition","Military","Stealth"])

        super().__init__(screen, "Vehicle Components", fonts, item_types, item_sub_types, columns, [100, 220, 540, 700, 820])
        self.data_source = full_list 

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
