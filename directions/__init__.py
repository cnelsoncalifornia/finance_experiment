from otree.api import *

doc = """
Comprehension test. If the user fails too many times, they exit.
"""


class C(BaseConstants):
    NAME_IN_URL = 'directions_test'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 1
    MAX_FAILED_ATTEMPTS = 4


class Subsession(BaseSubsession):
    pass


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    num_failed_attempts = models.IntegerField(initial=0)
    failed_too_many = models.BooleanField(initial=False)
    fixed = models.StringField(
        choices=[['Yes', 'Yes'], ['No', 'No']],
        label='Can a superstar stock become a regular stock?',
        widget=widgets.RadioSelect,
    )
    bid_question1 = models.IntegerField(
        label='If you bid 15 and the random number is 11, what price do you pay for the stock?'
    )
    bid_question2 = models.StringField(
        choices=[['Yes', 'Yes'], ['No', 'No']],
        label='If you bid 5 and the random number is 8, do you purchase the stock?',
        widget=widgets.RadioSelect,
    )
    prob_question1 = models.IntegerField(
        label='''
        If a regular stock has increased 3 periods in a row, what is the probability that 
        it will increase next round?  Enter as a percentage.''',
        min=0, max=100
    )
    prob_question2 = models.IntegerField(
        label='''
        If a regular stock has decreased 6 rounds in a row, what is the probability that it will decrease next round?  
        Enter as a percentage.''',
        min=0, max=100
    )
    payoff_question = models.StringField(
        choices=[['True', 'True'], ['False', 'False']],
        label='True or False: The payoff of a stock is the number that appears on the 10th period of the round.',
        widget=widgets.RadioSelect,
    )
    superstars_possible = models.StringField(
        choices=[['True', 'True'], ['False', 'False']],
        label='''
        True or False: In some rounds, superstar stocks are possible and in other rounds superstar stocks 
        are not possible.''',
        widget=widgets.RadioSelect,
    )
    prob_superstar = models.IntegerField(
        label='''
        In those rounds in which superstar stocks are possible, what is the probability of any stock being created 
        a superstar?  Enter as a percentage.''',
        min=0, max=100
    )

class Directions(Page):
    pass


class MyPage(Page):
    form_model = 'player'
    form_fields = ['fixed', 'bid_question1', 'bid_question2', 'prob_question1', 'prob_question2', 'payoff_question',
                   'superstars_possible', 'prob_superstar']

    @staticmethod
    def error_message(player: Player, values):
        # alternatively, you could make quiz1_error_message, quiz2_error_message, etc.
        # but if you have many similar fields, this is more efficient.
        solutions = dict(fixed='No', bid_question1=11, bid_question2='No', prob_question1=50, prob_question2=50,
                         payoff_question='True', superstars_possible='True', prob_superstar=2 )

        # error_message can return a dict whose keys are field names and whose
        # values are error messages
        errors = {name: 'Wrong' for name in solutions if values[name] != solutions[name]}
        # print('errors is', errors)
        if errors:
            player.num_failed_attempts += 1
            if player.num_failed_attempts >= C.MAX_FAILED_ATTEMPTS:
                player.failed_too_many = True
                # we don't return any error here; just let the user proceed to the
                # next page, but the next page is the 'failed' page that boots them
                # from the experiment.
            else:
                return errors


class Failed(Page):
    @staticmethod
    def is_displayed(player: Player):
        return player.failed_too_many


class Results(Page):
    pass


page_sequence = [Directions, MyPage, Failed, Results]