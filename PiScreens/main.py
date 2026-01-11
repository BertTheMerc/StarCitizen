from __future__ import division
from __future__ import print_function

import os

# I see no reason to disable screensaver for this tool.
os.environ["SDL_VIDEO_ALLOW_SCREENSAVER"] = "1"

# Maybe people want to keep watching the joystick feedback even when this
# window doesn't have focus. Possibly by capturing this window into OBS.
os.environ["SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"] = "1"

# A tiny performance/latency hit isn't a problem here. Instead, it's more
# important to keep the desktop compositing effects running fine. Disabling
# compositing is known to cause issues on KDE/KWin/Plasma/X11 on Linux.
os.environ["SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR"] = "0"

import sys
import pygame
import socket
from pygame.locals import *

from Screens import ClaimTimers, TradeRoutes, MFDs, Clocks, RepairOutposts, ShipComponents, LootComponents, LootPrices


class joystick_handler(object):
    def __init__(self, id):
        self.id = id
        self.joy = pygame.joystick.Joystick(id)
        self.name = self.joy.get_name()
        self.joy.init()
        self.numaxes = self.joy.get_numaxes()
        self.numballs = self.joy.get_numballs()
        self.numbuttons = self.joy.get_numbuttons()
        self.numhats = self.joy.get_numhats()

        self.axis = []
        for i in range(self.numaxes):
            self.axis.append(self.joy.get_axis(i))

        self.ball = []
        for i in range(self.numballs):
            self.ball.append(self.joy.get_ball(i))

        self.button = []
        for i in range(self.numbuttons):
            self.button.append(self.joy.get_button(i))

        self.hat = []
        for i in range(self.numhats):
            self.hat.append(self.joy.get_hat(i))


class PiStarScreenApp(object):
    class default:
        "Program constants"

        # TODO: Add a command-line parameter to change the size.
        # TODO: Maybe make this program flexible, let the window height define
        #       the actual font/circle size.
        bigfontsize = 36
        largefontsize = 24
        medfontsize = 18
        smallfontsize = 12
        resolution = (1024, 600)

    def __init__(self):
        self.fonts = {}
        self.joycount = None
        self.action_down_idx = None
        self.action_exec_idx = None
        self.action_up_idx = None
        self.adjust_inc_idx = None
        self.adjust_dec_idx = None
        self.page_next_idx = None
        self.page_previous_idx = None
        self.screens = []
        self.screen_index = 0
        self.joy = []
        self.surface = None
        self.switch = True

    def init(self):
        pygame.init()
        pygame.font.init()  # you have to call this at the start,

        if os.name == 'nt':
            self.page_previous_idx = 7
            self.page_next_idx = 8
            self.action_up_idx = 5
            self.action_exec_idx = 4
            self.action_down_idx = 3
            self.adjust_inc_idx = 2
            self.adjust_dec_idx = 1
        else:
            self.page_previous_idx = 0
            self.page_next_idx = 1
            self.adjust_inc_idx = 2
            self.adjust_dec_idx = 3
            self.action_up_idx = 4
            self.action_exec_idx = 5
            self.action_down_idx = 6
        
        self.fonts["XL"] = pygame.font.Font("./Fonts/GoodTimes-Regular.ttf", self.default.bigfontsize)
        self.fonts["L"] = pygame.font.Font("./Fonts/GoodTimes-Regular.ttf", self.default.largefontsize)
        self.fonts["M"] = pygame.font.Font("./Fonts/GoodTimes-Regular.ttf", self.default.medfontsize)
        self.fonts["S"] = pygame.font.Font("./Fonts/GoodTimes-Regular.ttf", self.default.smallfontsize)
        self.fonts["D"] = pygame.font.Font("./Fonts/digits.ttf", self.default.bigfontsize)
        self.fonts["DS"] = pygame.font.Font("./Fonts/digits.ttf", self.default.smallfontsize)

        print ("Fonts loaded: " + str(len(self.fonts)))

        pygame.event.set_blocked((MOUSEMOTION, MOUSEBUTTONUP, MOUSEBUTTONDOWN))
        self.joycount = pygame.joystick.get_count()

        if self.joycount == 0:
            print("This program only works with at least one joystick plugged in. No joysticks were detected.")
            #self.quit(1)

        for i in range(self.joycount):
            self.joy.append(joystick_handler(i))

    def next(self):
        print("Next screen")
        self.surface.fill((0, 0, 0))
        self.screen_index += 1
        if self.screen_index >= len(self.screens):
            self.screen_index = 0
        self.switch = True

    def previous(self):
        print("Previous screen")
        self.surface.fill((0, 0, 0))
        self.screen_index -= 1
        if self.screen_index < 0:
            self.screen_index = len(self.screens) - 1
        self.switch = True

    def create_screens(self, screen):
        
        loot_resale = LootPrices.LootPrices(screen, self.fonts)
        loot_resale.create()
        self.screens.append(loot_resale)

        loot_comps = LootComponents.LootComponents(screen, self.fonts)
        loot_comps.create()
        self.screens.append(loot_comps)

        comps = ShipComponents.ShipComponents(screen, self.fonts)
        comps.create()
        self.screens.append(comps)

        outposts = RepairOutposts.RepairOutposts(screen, self.fonts)
        outposts.create()
        self.screens.append(outposts)

        clocks = Clocks.Clocks(screen, self.fonts)
        clocks.create()
        
        if (socket.gethostname() == "ConsoleLeft"):
            self.screens.insert(0, clocks)
        else:
            self.screens.append(clocks)
            
        claim = ClaimTimers.ClaimTimers(screen, self.fonts)
        claim.create()
        self.screens.append(claim)
        
        trade = TradeRoutes.TradeRoutes(screen, self.fonts)
        trade.create()
        self.screens.append(trade)

        #mdf = MFDs.MFD(screen, self.fonts)
        #mdf.create()
        #self.screens.append(mdf)

    def run(self):
        print("Starting")

        if os.name == 'nt':
            self.surface = pygame.display.set_mode((1024, 600), RESIZABLE)
            pygame.display.set_caption("PiStarScreens")
        else:
            self.surface = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)

        self.create_screens(self.surface)

        while True:
            self.screens[self.screen_index].display()
            pygame.display.flip()
            for event in [] + pygame.event.get():
                # QUIT             none
                # ACTIVEEVENT      gain, state
                # KEYDOWN          unicode, key, mod
                # KEYUP            key, mod
                # MOUSEMOTION      pos, rel, buttons
                # MOUSEBUTTONUP    pos, button
                # MOUSEBUTTONDOWN  pos, button
                # JOYAXISMOTION    joy, axis, value
                # JOYBALLMOTION    joy, ball, rel
                # JOYHATMOTION     joy, hat, value
                # JOYBUTTONUP      joy, button
                # JOYBUTTONDOWN    joy, button
                # VIDEORESIZE      size, w, h
                # VIDEOEXPOSE      none
                # USEREVENT        code

                if event.type == QUIT:
                    self.quit()
                elif event.type == KEYDOWN and event.key in [K_ESCAPE, K_q]:
                    self.quit()
                elif event.type == KEYUP:
                    print("Key up!")
                    print(event.key)
                    # self.joy[event.joy].button[event.button] = 0
                    if event.key == K_o:
                        self.previous()
                    elif event.key == K_u:
                        self.screens[self.screen_index].action1()
                    elif event.key == K_j:
                        self.screens[self.screen_index].action2()
                    elif event.key == K_m:
                        self.screens[self.screen_index].action3()
                    elif event.key == K_w:
                        self.screens[self.screen_index].adjust1()
                    elif event.key == K_s:
                        self.screens[self.screen_index].adjust2()
                    elif event.key == K_x:
                        self.screens[self.screen_index].adjust3()
                    if event.key == K_p:
                        self.next()
             
                elif event.type == JOYBUTTONUP:
                    print("Button up!")
                    print(event.button)
                    # self.joy[event.joy].button[event.button] = 0
                    if event.button == self.page_previous_idx:
                        self.previous()
                    elif event.button == self.action_up_idx:
                        self.screens[self.screen_index].action1()
                    elif event.button == self.action_exec_idx:
                        self.screens[self.screen_index].action2()
                    elif event.button == self.action_down_idx:
                        self.screens[self.screen_index].action3()
                    elif event.button == self.adjust_inc_idx:
                        self.screens[self.screen_index].adjust1()
                    elif event.button == self.adjust_dec_idx:
                        self.screens[self.screen_index].adjust2()
                    elif event.button == self.page_next_idx:
                        self.next()
                elif event.type == JOYBUTTONDOWN:
                    self.joy[event.joy].button[event.button] = 1

    def quit(self, status=0):
        print("Quitting")
        for screen in self.screens:
            screen.quit()

        pygame.quit()
        sys.exit(status)


if __name__ == "__main__":
    print("Ready")
    program = PiStarScreenApp()
    program.init()
    program.run()  # This function should never return
