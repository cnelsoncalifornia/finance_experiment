from otree.api import *



doc = """
This application provides a webpage notifying participants that they have completed the experiment.
"""


class C(BaseConstants):
    NAME_IN_URL = 'final_instructions'
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
class final_instructions(Page):
    pass


page_sequence = [final_instructions]
