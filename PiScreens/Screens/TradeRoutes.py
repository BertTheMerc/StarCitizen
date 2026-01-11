from libs import Helper, Repo
from Domain import TradeRoute
import pygame
from pygame.locals import *
from Screens import ScreenTemplate

class TradeRoutes(ScreenTemplate.Screen_Template):
    def __init__(self, screen, fonts):
        super().__init__(screen, "TRADE ROUTES", fonts)
        self.routes = []
        self.cols = [90, 400, 700, 800, 870]
        self.source_y = 130
        self.header_y = 110
        self.sources = Repo.Repo.get_trade_route_sources() 
        print (len(self.sources))
        self.sourceIdx = 0
        self.units = 0

    def create(self):
        pass

    def display(self):
        super().display()
        super().button_text("action1", "NEXT")
        super().button_text("action2", "INFO")
        super().button_text("action3", "PREV")
        super().button_text("adjust1", "UP")
        super().button_text("adjust3", "DOWN")

        if len(self.routes) == 0:
            self.update_route()

        Helper.render_centre_text(self.screen, self.fonts["L"], self.text_colour, "PICK UP :" + self.sources[self.sourceIdx][0] , 512, 60)

        self.showroute()

    def update_route(self):
        self.routes = Repo.Repo.get_trade_route(self.sources[self.sourceIdx])
        Helper.clear_inner_sreen(self.screen)
        self.showroute()

    def action1(self):
        self.sourceIdx -= 1

        if self.sourceIdx < 0:
            self.sourceIdx = len(self.sources)-1

        self.update_route()

    def showroute(self):
        y = self.source_y
        self.showheaders()
        for item in self.routes:
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.target, self.cols[0], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.goods, self.cols[1], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(item.buy_cost), self.cols[2], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(item.sale_amount), self.cols[3], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(int((100/item.buy_cost*item.sale_amount))), self.cols[4], y)
             y += self.list_line_space

    def showheaders(self):
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Target", self.cols[0], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Goods", self.cols[1], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Buy", self.cols[2], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "Sell", self.cols[3], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], (255,0,0), "%", self.cols[4], self.header_y)

    def action2(self):
       self.display_info()

    def action3(self):
        self.sourceIdx += 1
        if self.sourceIdx > len(self.sources):
            self.sourceIdx = 0

        self.update_route()

    def adjust1(self):
        self.unit += 1

    def adjust2(self):
        self.unit -= 1
        if self.unit < 0:
           self.unit = 0

    def quit(self):
        pass