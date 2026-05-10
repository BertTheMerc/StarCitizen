from libs import Helper, Repo
from Domain import TradeRoute
import pygame
import numpy as np
from pygame.locals import *
from Screens import ScreenTemplate

class MultiList(ScreenTemplate.Screen_Template):
    def __init__(self, screen, title, fonts, list_types, sub_list_types, columns_names, column_position):
        super().__init__(screen, title, fonts)
    
        self.itemTypes = list_types
        self.subTypes = sub_list_types
        self.columns = columns_names
        self.data_source = None
        self.selectedType = 0
        self.selectedSubType = 0
        self.cols = column_position
        self.source_y = 110
        self.header_y = 100
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
        i = 0
        l = 0
        for item in self.itemTypes:
            l += Helper.text_width(self.fonts["M"], item)[0] + 10
        
        x = 512 - l/2
        for item in self.itemTypes:
            if i == self.selectedType:
                colour = self.text_colour
            else:
                colour = self.shadow_color

            Helper.draw_box(self.screen,x-5, 58, Helper.text_width(self.fonts["M"], item)[0]+10,self.list_line_space+4, colour, False)
            x += Helper.render_text(self.screen, self.fonts["M"], colour, item, x, 60) + 10

            i += 1
        
        i = 0
        l = 0
        for sub_item in self.subTypes[self.selectedType]:
            l += Helper.text_width(self.fonts["M"], sub_item)[0] + 10
        
        x = 512 - l/2
        for sub_item in self.subTypes[self.selectedType]:
            if i == self.selectedSubType:
                colour = self.text_colour
            else:
                colour = self.shadow_color

            Helper.draw_box(self.screen,x-5, 78, Helper.text_width(self.fonts["M"], sub_item)[0]+10,self.list_line_space+4, colour, False)
            x += Helper.render_text(self.screen, self.fonts["M"], colour, sub_item, x, 80) + 10
            i += 1

        y = 130
        self.showheaders()
        idx = 0

        for item in self.data_source:
            if idx >= self.page_idx * self.items_per_page and y < 480:
                if (item.itemType==self.itemTypes[self.selectedType] and item.subType==self.subTypes[item.subType][self.selectedSubType]) or (item.itemType==self.selectedType and item.subType==self.selectedSubType):
                    c = 0
                    for col in self.columns:
                        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, (str)(item.column(c)), self.cols[c], y)
                        c += 1
                    
                    y += self.list_line_space
                    idx += 1

    def showheaders(self):
        c = 0
        for col in self.columns:
            Helper.render_text(self.screen, self.fonts["M"], (255,0,0), col, self.cols[c], self.header_y)
            c += 1
        

    def action1(self):
        self.selectedType += 1
        if self.selectedType >= len(self.itemTypes):
            self.selectedType = 0

        self.selectedSubType = 0

    def action2(self):
        pass

    def action3(self):
        self.selectedType -= 1
        if self.selectedType < 0:
           self.selectedType = len(self.itemTypes)-1

        self.selectedSubType = 0

    def adjust1(self):
        self.selectedSubType += 1

        if self.selectedSubType > len(self.subTypes[self.selectedType])-1:
            self.selectedSubType = 0

        self.page_idx = 0

    def adjust2(self):
        self.page_idx += 1

    def adjust3(self):
        self.selectedSubType -= 1
        if self.selectedSubType < 0:
            self.selectedSubType = len(self.subTypes[self.selectedType])-1
        
        self.page_idx = 0

    def quit(self):
        pass