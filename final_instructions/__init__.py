from otree.api import *



doc = """
This application provides a webpage notifying participants that they have completed the experiment.
"""


class C(BaseConstants):
    NAME_IN_URL = 'final_instructions'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 1
    CONVERSION_TO_USD = 0.15
    EARNINGS_FOR_CORRECT_PROB = 5
    MARGIN_OF_ERROR = 0 #How much probability guesses can differ from the actual probability and still get rewarded.


class Subsession(BaseSubsession):
    pass


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    # Subject's probability guesses
    prob_3 = models.IntegerField(initial=0)
    prob_3_2 = models.IntegerField(initial=0)
    prob_4 = models.IntegerField(initial=0)
    prob_4_2 = models.IntegerField(initial=0)
    prob_5 = models.IntegerField(initial=0)
    prob_5_2 = models.IntegerField(initial=0)
    prob_6 = models.IntegerField(initial=0)
    prob_6_2 = models.IntegerField(initial=0)

    # Bayesian probability values.  Proper values added later.
    bprob_3 = models.IntegerField(initial=0)
    bprob_3_2 = models.IntegerField(initial=0)
    bprob_4 = models.IntegerField(initial=0)
    bprob_4_2 = models.IntegerField(initial=0)
    bprob_5 = models.IntegerField(initial=0)
    bprob_5_2 = models.IntegerField(initial=0)
    bprob_6 = models.IntegerField(initial=0)
    bprob_6_2 = models.IntegerField(initial=0)

    # Is the guess within 1 of the Bayesian values?
    accurate_prob_3 = models.StringField(initial='No')
    accurate_prob_3_2 = models.StringField(initial='No')
    accurate_prob_4 = models.StringField(initial='No')
    accurate_prob_4_2 = models.StringField(initial='No')
    accurate_prob_5 = models.StringField(initial='No')
    accurate_prob_5_2 = models.StringField(initial='No')
    accurate_prob_6 = models.StringField(initial='No')
    accurate_prob_6_2 = models.StringField(initial='No')

    # Additional earnings from correct probability guesses
    earn_3 = models.IntegerField(initial=0)
    earn_3_2 = models.IntegerField(initial=0)
    earn_4 = models.IntegerField(initial=0)
    earn_4_2 = models.IntegerField(initial=0)
    earn_5 = models.IntegerField(initial=0)
    earn_5_2 = models.IntegerField(initial=0)
    earn_6 = models.IntegerField(initial=0)
    earn_6_2 = models.IntegerField(initial=0)
    total_prob_earnings = models.IntegerField(initial=0)


    earnings = models.IntegerField(initial=0)
    total_earnings = models.IntegerField(initial=0)
    total_earnings_usd = models.FloatField(initial=0)


    first_participation = models.StringField(   # This variable use to be called previous_participation
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

    first_app = models.StringField(initial='')


# FUNCTIONS
# PAGES
class previous_participation(Page):
    form_model = 'player'
    form_fields = ['first_participation','stock_experience','econ_knowledge']


class final_instructions(Page):
    form_model = 'player'
    form_fields = ['strategy_from_subjects', 'comments_from_subjects']
    @staticmethod
    def vars_for_template(player: Player):
        player.prob_3 = player.participant.vars['prob_3']
        player.prob_3_2 = player.participant.vars['prob_3_2']
        player.prob_4 = player.participant.vars['prob_4']
        player.prob_4_2 = player.participant.vars['prob_4_2']
        player.prob_5 = player.participant.vars['prob_5']
        player.prob_5_2 = player.participant.vars['prob_5_2']
        player.prob_6 = player.participant.vars['prob_6']
        player.prob_6_2 = player.participant.vars['prob_6_2']

        player.bprob_3 = 14 # 3 of 3 growth
        player.bprob_3_2 = 0  # 1 of 3 growth
        player.bprob_4 = 24  # 4 of 4 growth
        player.bprob_4_2 = 0  # 3 of 4 growth
        player.bprob_5 = 1  # 4 of 5 growth
        player.bprob_5_2 = 0  # 3 of 5 growth
        player.bprob_6 = 1  # 5 of 6 growth
        player.bprob_6_2 = 0 # 3 of 6 growth

        if(abs(player.prob_3 - player.bprob_3) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_3 = 'Yes'
            player.earn_3 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_3_2 - player.bprob_3_2) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_3_2 = 'Yes'
            player.earn_3_2 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_4 - player.bprob_4) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_4 = 'Yes'
            player.earn_4 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_4_2 - player.bprob_4_2) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_4_2 = 'Yes'
            player.earn_4_2 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_5 - player.bprob_5) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_5 = 'Yes'
            player.earn_5 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_5_2 - player.bprob_5_2) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_5_2 = 'Yes'
            player.earn_5_2 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_6 - player.bprob_6) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_6 = 'Yes'
            player.earn_6 = C.EARNINGS_FOR_CORRECT_PROB
        if(abs(player.prob_6_2 - player.bprob_6_2) <= C.MARGIN_OF_ERROR):
            player.accurate_prob_6_2 = 'Yes'
            player.earn_6_2 = C.EARNINGS_FOR_CORRECT_PROB

        player.total_prob_earnings = player.earn_3 + player.earn_3_2 + player.earn_4 + player.earn_4_2 + player.earn_5 + player.earn_5_2 + player.earn_6 + player.earn_6_2

        player.earnings = player.participant.vars['final_earnings'] + player.participant.vars['final_earnings_app2'] #+ player.participant.vars['final_earnings_bonus']

        player.total_earnings = player.earnings + player.total_prob_earnings
        player.total_earnings_usd = player.total_earnings * C.CONVERSION_TO_USD

        if player.subsession.session.config['number'] == 1:  # The current app goes first.  There are no rounds from the other app.
            player.first_app = 'superstars'
        else:                                                # The current app goes second.  Adds the rounds from the other app.
            player.first_app = 'no superstars'



page_sequence = [previous_participation, final_instructions]
