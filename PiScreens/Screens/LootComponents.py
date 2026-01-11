from libs import Helper, Repo
from pygame.locals import *
from Screens import ScreenTemplate

class LootComponents(ScreenTemplate.Screen_Template):
    def __init__(self, screen, fonts):
        super().__init__(screen, "Wanted Components", fonts)
        self.components = []
        self.cols = [75, 300, 550, 750, 850, 950]
        self.loot_cols = [75, 550]
        self.source_y = 90
        self.header_y = 90
        self.page_index = 0
        self.items_per_page = 16
        self.mil_class = True 

        self.components = Repo.Repo.get_loot_components()

    def create(self):
        pass

    def display(self):
        super().display()
        super().button_text("action1", "NEXT")
        #super().button_text("action2", "MORE")
        #super().button_text("action3", "PREV")
        self.showcomponents()

    def showcomponents(self):
        y = 110
        idx = 0
        first = True

        if self.mil_class:
            Helper.render_text(self.screen, self.fonts["L"], self.text_colour, "Military", self.loot_cols[0], 60)
        else:
            Helper.render_text(self.screen, self.fonts["L"], self.text_colour, "Stealth", self.loot_cols[0], 60)
            
        for item in self.components:           
            if (item.cclass == "Military" and self.mil_class) or (item.cclass != "Military" and self.mil_class == False): 
                if idx >= self.page_index * self.items_per_page:
                    if first:
                        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.comp_type + " | " + item.name + " | " + item.grade +" | " + str(item.size), self.loot_cols[0], y)
                        first = False
                        y -= 30
                        idx -= 1
                    else:
                        Helper.render_text(self.screen, self.fonts["M"], self.text_colour, item.comp_type + " | " + item.name + " | " + item.grade +" | " + str(item.size), self.loot_cols[1], y)
                        first = True

                    y += 30
                idx += 1

            if idx >= (self.page_index + 1) * self.items_per_page:
                break


    def action1(self):
        self.mil_class = not self.mil_class
        
    def action2(self):
       self.page_index += 1
       if self.page_index * self.items_per_page >= len(self.components):
           self.page_index = 0

    def quit(self):
        pass