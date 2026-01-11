import pygame
import pytz
import datetime
import socket

from libs import Timer, Helper

class Screen_Template:
    def __init__(self, screen, screen_name: str, fonts: dict):
        self.screen = screen
        self.screen_name = screen_name
        self.fonts = fonts
        self.screenIdx = -1
        self.machine_name = socket.gethostname()
        self.border_width = 53
        self.button_y = [125, 250, 380]
        self.prev_x = 300
        self.next_x = 670
        self.text_colour = (255, 0, 0)
        self.text_selected = (255, 255, 255)
        self.shadow_color = (127,0,0)
        self.left_edge = 0
        self.right_edge = 971
        self.action_x = -1
        self.adjust_x = -1
        self.button_text_offset = 20
        self.list_line_space = 18
        
        self.frame = pygame.image.load('images//FrameB.png')
        self.button = pygame.image.load('images//buttonb.png')
        print (self.machine_name)

        if (self.machine_name == "ConsoleLeft"):
            self.action_x = 25
            self.adjust_x = 999
        else:
            self.action_x = 999
            self.adjust_x = 25
    
    def display(self):
        self.screen.blit(self.frame, (0, 0))
        self.screen.blit(self.button, (self.prev_x, 1))
        self.screen.blit(self.button, (self.next_x, 1))
        self.button_text("prev", "PREV")
        self.button_text("next", "NEXT")

        Helper.render_centre_text(self.screen, self.fonts["L"], (55, 0, 0), self.screen_name, 502, 537)
        Helper.render_centre_text(self.screen, self.fonts["L"], self.text_colour, self.screen_name, 505, 535)

        for b in self.button_y:
            self.screen.blit(self.button, (self.left_edge, b))
            self.screen.blit(self.button, (self.right_edge, b))

    def title(self, text):
        Helper.render_centre_text(self.screen, self.fonts["L"], self.text_colour, text , 512, 60)
            
    def button_text(self, button_name, text, shadow=True):
        if button_name == "prev":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.prev_x + 25, 21)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.prev_x+25, 20)

        if button_name == "next":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.next_x+25, 21)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.next_x+25, 20)


        if button_name == "action1":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.action_x+1, self.button_y[0]+self.button_text_offset+1)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.action_x, self.button_y[0]+self.button_text_offset)

        if button_name == "action2":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.action_x+1, self.button_y[1]+self.button_text_offset+1)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.action_x, self.button_y[1]+self.button_text_offset)

        if button_name == "action3":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.action_x+1, self.button_y[2]+self.button_text_offset+1)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.action_x, self.button_y[2]+self.button_text_offset)

        if button_name == "adjust1":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.adjust_x+1, self.button_y[0]+self.button_text_offset+1)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.adjust_x, self.button_y[0]+self.button_text_offset)

        if button_name == "adjust2":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.adjust_x+1, self.button_y[1]+self.button_text_offset+1)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.adjust_x, self.button_y[1]+self.button_text_offset)

        if button_name == "adjust3":
            if shadow:
                Helper.render_centre_text(self.screen, self.fonts["S"], self.shadow_color, text, self.adjust_x+1, self.button_y[2]+self.button_text_offset+1)
            Helper.render_centre_text(self.screen, self.fonts["S"], self.text_colour, text, self.adjust_x, self.button_y[2]+self.button_text_offset)
                
    def _date_formatedextension(self, dt: datetime.datetime, short: bool = True):
        if short:
            return dt.strftime("%H:%M")
        else:
            return dt.strftime("%H:%M:%S")

    def _delta_formatedextension(self, dt: datetime.timedelta):
        hours = int(dt.total_seconds() // 3600)
        minutes = int((dt.total_seconds() % 3600) // 60)
        seconds = int(dt.total_seconds() % 60)
        return f"{hours:02d}:{minutes:02d}:{seconds:02d}"