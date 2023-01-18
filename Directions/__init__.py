from otree.api import *



doc = """
This application provides a webpage giving participants instructions about the game.
"""


class C(BaseConstants):
    NAME_IN_URL = 'Directions'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 1


class Subsession(BaseSubsession):
    pass


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    pass


# FUNCTIONS
# PAGES
class Directions(Page):
    pass


page_sequence = [Directions]
