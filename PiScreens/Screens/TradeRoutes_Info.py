from libs import Helper, Repo
from Domain import TradeRoute
import pygame
from pygame.locals import *
from Screens import ScreenTemplate

class TradeRoutes_Info(ScreenTemplate.Screen_Template):
    def __init__(self, screen, fonts, routeIdx):
        super().__init__(screen, "TRADE ROUTES", fonts)
        self.cols = [75, 300, 600, 700, 800]
        self.source_y = 60
        self.header_y = 90
        self.units = 0

    def create(self):
        pass

    def display(self):
        super().display()
        super().button_text("action1", "")
        super().button_text("action2", "")
        super().button_text("action3", "BACK")
        super().button_text("adjust1", "MORE")
        super().button_text("adjust2", "LESS")

        if len(self.routes) == 0:
            self.update_route()

    def update_route(self):
        self.routes = Repo.Repo.get_trade_route(self.sources[self.sourceIdx])
        Helper.clear_inner_sreen(self.screen)
        Helper.render_text(self.screen, self.fonts[1], self.text_colour, "PICK UP:" + self.sources[self.sourceIdx], self.cols[0], self.source_y)
             
        self.showroute()

    def update(self):
        pass

    def action1(self):
        self.sourceIdx -= 1

        if self.sourceIdx < 0:
            self.sourceIdx = len(self.sources)-1

        self.update_route()

    def showroute(self):
        y = 120
        self.showheaders()
        for item in self.routes:
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.target, self.cols[0], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.goods, self.cols[1], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(item.buy_cost), self.cols[2], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(item.sale_amount), self.cols[3], y)
             Helper.render_text(self.screen, self.fonts["M"], self.text_colour, str(100/item.buy_cost*item.sale_amount) + "%", self.cols[4], y)
             y += 30

    def showheaders(self):
        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, "Target", self.cols[0], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, "Goods", self.cols[1], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, "Buy", self.cols[2], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, "Sale", self.cols[3], self.header_y)
        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, "SCU", self.cols[4], self.header_y)

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