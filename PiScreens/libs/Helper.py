import pygame

def render_text(screen, font, colour, text, x, y ):
    text_width, text_height = font.size(str(text))
    rendered_text = font.render(str(text), True, colour)
    screen.blit(rendered_text, (x, y))
    return text_width

def text_width(font, text: str):
    return font.size(str(text))

def render_centre_text(screen, font, colour, text, x, y):
    text_width, text_height = font.size(str(text))
    rendered_text = font.render(str(text), True, colour)
    screen.blit(rendered_text, (x-text_width/2, y))
    return text_width

def clear_screen(screen):
    screen.fill((0, 0, 0, 255))

def clear_inner_sreen(screen):
    screen.fill((0, 0, 0, 255), (53,53,918, 494))

def clear_area(screen, rect):
    screen.fill((0, 0, 0, 255), rect)

def draw_box(screen, x:int, y:int, w: int, h: int, colour, fill: bool):
    pygame.draw.rect(screen, colour, [x,y,w,h], width=1, border_radius=4) 