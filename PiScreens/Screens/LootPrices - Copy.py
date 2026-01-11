from libs import Helper, Repo
from Domain import TradeRoute
import pygame
import numpy as np
from pygame.locals import *
from Screens import MultiList

class LootPrices(MultiList.MultiList):
    def __init__(self, screen, fonts):
        super().__init__(screen, "LOOT PRICES", fonts)
    
        item_types = [  
                            "Personal Weapon", 
                            "Armour",
                            "Clothes", 
                            "Ship Weapon", 
                            "Ship Component", 
                            "Other"
                         ]
        sub_item_types = []
        sub_item_types.append(["Sidearms",    "Primary",  "Special",      "Melee",            "Attachments",  "Throwables"])
        sub_item_types.append(["Undersuits",  "Helmets",  "Core",         "Arms",             "Legs",         "Backpacks",    "Flair"])
        sub_item_types.append(["Headwear",    "Shirts",   "Jackets",      "Gloves",           "Legwear",      "Footwear",     "Eyewear"])
        sub_item_types.append(["Ordnance",    "Turrets",  "Weapons",      "CM Launchers",     "Missile Racks"])
        sub_item_types.append(["Coolers",     "Minig",    "Power Plants", "Quantum Drives",   "Shields",      "Liveries",     "Jump Modules"])
        sub_item_types.append(["ALL"])
        
        self.selected_type = 0
        self.selected_sub_type = 0
        self.cols = [100, 600, 700, 800, 900]
        self.source_y = 110
        self.header_y = 100
        self.loot = Repo.Repo.get_loot_resale_prices() 
        print (len(self.loot))
        self.page_idx = 0
        self.units = 0
        self.items_per_page = 12

    def create(self):
        pass

    def display(self):
        super().display()
        super().button_text("action1", "T+")
        super().button_text("action3", "T-")
        super().button_text("adjust1", "S+")
        super().button_text("adjust2", "MORE")
        super().button_text("adjust3", "S-")

        self.show_items()

    def show_items(self):
        self.title(self.item_type[self.selected_type] + " - " + self.item_sub_type[self.selected_type, self.selected_sub_type])
        #Helper.render_text(self.screen, self.fonts["M"], self.text_colour, self.item_type[self.selected_type] + " - " + self.item_sub_type[self.selected_type, self.selected_sub_type], self.cols[0], 60)
        
       
        y = 120
        self.showheaders()
        idx = 0

        for item in self.loot:
            if idx >= self.page_idx * self.items_per_page and y < 540:
                if item.item_type==self.selected_type and  item.sub_item_type==self.selected_sub_type:
                     Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.name, self.cols[0], y)
                     Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(item.size), self.cols[1], y)
                     Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(item.cargo_sale), self.cols[2], y)
                     Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(int(item.amount_per_volume)), self.cols[3], y)
                     y += self.list_line_space
                     idx += 1

    def showheaders(self):
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Name", self.cols[0], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Size", self.cols[1], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Sale", self.cols[2], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Return", self.cols[3], self.header_y)


    def action1(self):
        self.selected_type += 1
        if self.selected_type >= len(self.item_type):
            self.selected_type = 0

        self.selected_sub_type = 0

    def action2(self):
        pass

    def action3(self):
        self.selected_type -= 1
        if self.selected_type < 0:
           self.selected_type = len(self.item_type)-1

        self.selected_sub_type = 0

    def adjust1(self):
        self.selected_sub_type += 1

        if self.selected_sub_type > 6 or self.item_sub_type[self.selected_type, self.selected_sub_type] == "":
            self.selected_sub_type = 0

        self.page_idx = 0

    def adjust2(self):
        self.page_idx += 1

    def adjust3(self):
        self.selected_sub_type -= 1
        if self.selected_sub_type < 0:
            self.selected_sub_type = 6

        if self.item_sub_type[self.selected_type, self.selected_sub_type] == "":
            self.adjust3()
        
        self.page_idx = 0

    def quit(self):
        pass