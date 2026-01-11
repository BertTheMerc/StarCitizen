import pygame
import pytz
import datetime
from Screens import ScreenTemplate
from libs import Timer, Helper

class Clocks(ScreenTemplate.Screen_Template):
    def __init__(self, screen, fonts):
        super().__init__(screen, "CLOCKS", fonts)

        self.start_time = datetime.datetime.now()
        self.contract_timer = Timer.Timer(Timer.TimerType.CountUp)
        self.contract_clock_display = None
        self.play_clock_display = None
        self.real_clock_display = None
        
        self.selected_index = 0
        self.startX = 130
        self.startY = 90
        self.colonSep = 400
        self.timerx = 450

    def create(self):
        pass

    def action1(self):
        self.selected_index += 1
        if self.selected_index > 1:
            self.selected_index = 0

    def action2(self):
        if self.selected_index == 0:
            if self.contract_timer.Active:
                self.contract_timer.stop(reset=True)
            else:
                self.contract_timer.start()
        else:
            self.start_time = datetime.datetime.now()

    def action3(self):
        self.selected_index -= 1
        if self.selected_index < 0:
            self.selected_index = 1

    def adjust1(self):
        pass

    def adjust2(self):
        pass

    def display(self):
        super().display()
        
        if self.selected_index == 0:
            if self.contract_timer.Active:
                super().button_text("action2", "STOP")
            else:
                super().button_text("action2", "START")

        else:
            super().button_text("action2", "RESET")

        offset = self.startY
        
        if self.selected_index == 0:
            c = self.text_selected    
        else:
            c = self.text_colour
        
        Helper.render_text(self.screen, self.fonts["XL"], c, "Contract", self.startX, offset)
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, ":", self.colonSep, offset)
            
        offset += 40
        if self.selected_index == 1:
            c = self.text_selected    
        else:
            c = self.text_colour

        Helper.render_text(self.screen, self.fonts["XL"], c, "Play Time", self.startX, offset)
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, ":", self.colonSep, offset)

        offset += 80
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, "UK", self.startX, offset)
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, ":", self.colonSep, offset)
        offset += 40
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, "USA", self.startX, offset)
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, ":", self.colonSep, offset)

        offset += 40
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, "AUS", self.startX, offset)
        Helper.render_text(self.screen, self.fonts["XL"], self.text_colour, ":", self.colonSep, offset)

        offset = self.startY-28
        Helper.render_text(self.screen, self.fonts["D"], self.text_colour, self.contract_timer.a_display(), self.timerx, offset)
        offset += 40
        Helper.render_text(self.screen, self.fonts["D"], self.text_colour, super()._delta_formatedextension(datetime.datetime.now() - self.start_time), self.timerx, offset)
        offset += 80
        Helper.render_text(self.screen, self.fonts["D"], self.text_colour, super()._date_formatedextension(datetime.datetime.now()), self.timerx, offset)
        offset += 40
        Helper.render_text(self.screen, self.fonts["D"], self.text_colour, super()._date_formatedextension(datetime.datetime.now().astimezone(pytz.timezone('US/Eastern'))), self.timerx, offset)
        offset += 40
        Helper.render_text(self.screen, self.fonts["D"], self.text_colour, super()._date_formatedextension(datetime.datetime.now().astimezone(pytz.timezone('Australia/Brisbane'))), self.timerx, offset)

    def quit(self):
        pass