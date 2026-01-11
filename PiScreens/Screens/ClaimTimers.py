import sys
from datetime import timedelta

import pygame
from pygame.locals import *
from libs import Timer
from Domain.ShipDetails import ShipDetails
from Domain.Fleet import Fleet
from libs import Helper, Repo
from Screens import ScreenTemplate

class ClaimTimers(ScreenTemplate.Screen_Template):
    def __init__(self, screen, fonts):
        super().__init__(screen, "CLAIM TIMERS", fonts)
        
        self.fleet = Fleet()
        self.selected_index = 0
        self.startX = [110, 600, 800]
        self.startY = 90

    def create(self):
        for ship in Repo.Repo.get_pledge_ships():
            print ("Adding: " + ship.name)
            self.fleet.add(ship)

    def perform_action(self):
        pass

    def display(self):
        super().display()
        
        super().button_text("action1", "UP")
        super().button_text("action2", "START")
        super().button_text("action3", "DOWN")
        #super().button_text("adjust1", "ADJ 1")
        #super().button_text("adjust2", "ADJ 2")

        offset = self.startY
        i = 0
        for ship in self.fleet.ships:
            colour = (255, 0, 0)
            if i == self.selected_index:
                colour = (255, 255, 255)
            Helper.render_text(self.screen, self.fonts["L"], colour, ship.name, self.startX[0], offset)
            
            t = self.fleet.get_timer(ship.name)
            if t.Active:
                Helper.render_text(self.screen, self.fonts["D"], colour, t.b_display(), self.startX[1], offset-30)
                Helper.render_text(self.screen, self.fonts["D"], colour, t.a_display(), self.startX[2], offset-30)
            else:
                Helper.render_text(self.screen, self.fonts["D"], colour, ship.claim_display, self.startX[1], offset-30)
                Helper.render_text(self.screen, self.fonts["D"], colour, ship.expedite_display, self.startX[2], offset-30)
                
            offset += 40
            i += 1

    def action3(self):
        self.selected_index += 1
        if self.selected_index >= len(self.fleet.ships):
            self.selected_index = 0

    def action2(self):
        s = self.fleet.get_ship(self.selected_index)
        t = self.fleet.get_timer(s.name)
        
        if (t.Active):
            t.stop()
        else:
            t.start()

    def action1(self):
        self.selected_index -= 1
        if self.selected_index < 0:
            self.selected_index = len(self.fleet.ships) - 1

    def adjust1(self):
        pass

    def adjust2(self):
        pass

    def quit(self):
        print ("Quiting claim timers screen")
        for ship in self.fleet.ships:
            t = self.fleet.get_timer(ship.name)
            if (t.Active):
                print ("stopping timer for: " + ship.name)
                t.stop()
    