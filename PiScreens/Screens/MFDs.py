import sys
from os import listdir
from os.path import isfile, join
from libs import SlideShow, Helper
import pygame
from pygame.locals import *
from Screens import ScreenTemplate

class MFD(ScreenTemplate.Screen_Template):
    def __init__(self, screen, fonts):
        super().__init__(screen, "MFDS", fonts)
        self.currentSlide = None
        self.images = SlideShow.Slideshow()
        self.imageIndex = 0
        self.startX = 50
        self.startY = 100
        #image_files = [f for f in listdir("./MFDImages") if isfile(join("./MFDImages", f))]

        #for img in image_files:
            #self.images.add(img, pygame.image.load(join("MFDImages", img)))

    def create(self):
        pass

    def display(self):
        super().display()
        
        super().button_text("action1", "NEXT")
        super().button_text("action2", "")
        super().button_text("action3", "PREV")
        #super().button_text("adjust1", "ADJ 1")
        #super().button_text("adjust2", "ADJ 2")

        #self.screen.blit(self.images.get(self.imageIndex).image, (53, 53))

    def update(self):
        pass

    def action1(self):
        self.imageIndex -= 1

        if self.imageIndex < 0:
            self.imageIndex = self.images.count - 1

    def action2(self):
        print("Action 2")

    def action3(self):
        print("Action 3")
        self.imageIndex += 1
        if self.imageIndex > self.images.count:
            self.imageIndex = 0

        #Helper.clear_area(self.screen, (self.startX,self.startY,980,560))
        self.show_image()

    def adjust1(self):
        print("Adjust 1")

    def adjust2(self):
        print("Adjust 2")

    def quit(self):
        pass