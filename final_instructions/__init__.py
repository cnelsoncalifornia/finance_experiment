from otree.api import *



doc = """
This application provides a webpage notifying participants that they have completed the experiment.
"""


class C(BaseConstants):
    NAME_IN_URL = 'final_instructions'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 1
    CONVERSION_TO_USD = 0.20


class Subsession(BaseSubsession):
    pass


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    final_earnings = models.IntegerField(initial=0)
    final_earnings_usd = models.FloatField(initial=0)


# FUNCTIONS
# PAGES
class final_instructions(Page):
    @staticmethod
    def vars_for_template(player: Player):
        player.final_earnings = player.participant.vars['final_earnings']
        player.final_earnings_usd = player.final_earnings * C.CONVERSION_TO_USD



page_sequence = [final_instructions]
