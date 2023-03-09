from otree.api import *



doc = """
This application provides a webpage notifying participants that they have completed the experiment.
"""


class C(BaseConstants):
    NAME_IN_URL = 'final_instructions'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 1
    CONVERSION_TO_USD = 0.15


class Subsession(BaseSubsession):
    pass


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    final_earnings = models.IntegerField(initial=0)
    final_earnings_usd = models.FloatField(initial=0)
    previous_participation = models.StringField(
        choices=[['Yes', 'Yes'], ['No', 'No']],
        label='Is this your first time doing this experiment?',
        widget=widgets.RadioSelect,
    )
    stock_experience = models.StringField(
        choices=[['Yes', 'Yes'], ['No', 'No']],
        label='Have you ever bought a stock or a fund representing a group of stocks?',
        widget=widgets.RadioSelect,
    )
    econ_knowledge = models.StringField(
        choices=[['Yes', 'Yes'], ['No', 'No']],
        label='Have you taken an economics or finance class after graduating from high school?',
        widget=widgets.RadioSelect,
    )
    strategy_from_subjects = models.LongStringField(
        label='''
        Optional: How did you decide how much to bid for the assets?''',
    )
    comments_from_subjects = models.LongStringField(
        label='''
        Optional: Feel free to put any suggestions for how to make this experiment better.''',
    )


# FUNCTIONS
# PAGES
class previous_participation(Page):
    form_model = 'player'
    form_fields = ['previous_participation','stock_experience','econ_knowledge']


class final_instructions(Page):
    form_model = 'player'
    form_fields = ['strategy_from_subjects', 'comments_from_subjects']
    @staticmethod
    def vars_for_template(player: Player):
        player.final_earnings = player.participant.vars['final_earnings'] + player.participant.vars['final_earnings_app2']
        player.final_earnings_usd = player.final_earnings * C.CONVERSION_TO_USD



page_sequence = [previous_participation, final_instructions]
