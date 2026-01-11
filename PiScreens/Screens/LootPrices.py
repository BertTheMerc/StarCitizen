from libs import Helper, Repo
from Domain import TradeRoute
import pygame
import numpy as np
from pygame.locals import *
from Screens import MultiList

class LootPrices(MultiList.MultiList):
    def __init__(self, screen, fonts):
        
    
        item_types = [  
                            "Weapons", 
                            "Armour",
                            "Clothes", 
                            "S Guns", 
                            "S Parts", 
                            "Other"
                         ]

        columns = ["Name", "Size", "Sale", "Return"]

        sub_item_types = []
        sub_item_types.append(["Side",        "Primary",  "Special",      "Melee",            "Attach",   "Throw"])
        sub_item_types.append(["Under",       "Helmets",  "Core",         "Arms",             "Legs",     "Backpacks","Flair"])
        sub_item_types.append(["Head",        "Shirts",   "Jackets",      "Gloves",           "Legs",     "Feet",     "Eyes"])
        sub_item_types.append(["Ordnance",    "Turrets",  "Weapons",      "CM",               "Missile"])
        sub_item_types.append(["Coolers",     "Minig",    "Power",        "QD",               "Shields"])
        sub_item_types.append(["ALL"])

        super().__init__(screen, "LOOT PRICES", fonts, item_types, sub_item_types, columns, [140, 600, 700, 800, 900])
        self.data_source = Repo.Repo.get_loot_resale_prices()

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