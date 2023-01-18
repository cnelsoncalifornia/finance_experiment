from otree.api import *
import random

class C(BaseConstants):
    NAME_IN_URL = 'survey_2'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 1
    CREDIT = 80 # This is sufficient to cover the maximum bidding price of 20 in each of the 4 bidding decisions per round.
    MAX = 20 # Maximum bid.
    NAMES = {
        1: ['H','A','H','C'],
        2: ['B','H','M','G'],
        3: ['B','A','D','C'],
        4: ['D','C','A','C'],
        5: ['D','K','G','A']
    }

    PAYOFFS = {
        1: {'A':8, 'C':10, 'H':20},
        2: {'B':16, 'G':10, 'H':10, 'M':14},
        3: {'A':8, 'B':10, 'C':6, 'D':14},
        4: {'A':12, 'C':12, 'D': 14},
        5: {'A':6, 'D':14, 'G':20, 'K':12}
    }



class Subsession(BaseSubsession):
    cummulative_earnings = models.IntegerField(initial = 0)


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    prob_low_3 = models.IntegerField(label='',min=0,max=100)
    prob_high_3= models.IntegerField(label='',min=0,max=100)
    bid_3 = models.IntegerField(label='Bid:', min=0, max=20)
    bid_3_2 = models.IntegerField(label='Bid:', min=0, max=20)
    shares_acquired_3 = models.IntegerField(initial=0)  # Shares acquired in the first purchase after period 3.
    shares_acquired_3_2 = models.IntegerField(initial=0)  # Shares acquired in the second purchase after period 3.
    payoff_3 = models.IntegerField(initial=0) # Payoff for the first stock purchased after round 3.
    payoff_3_2 = models.IntegerField(initial=0)  # Payoff for the second stock purchased after round 3.
    earnings_3 = models.IntegerField(initial=0)  # payoff_3 * shares_acquired_3
    earnings_3_2 = models.IntegerField(initial=0)  # payoff_3_2 * shares_acquired_3_2
    guess_3 = models.IntegerField(label='')  # Subject's guess for the final payout of the first stock they bid on in the first market.
    guess_3_2 = models.IntegerField(label='')

    prob_low_6 = models.IntegerField(label='',min=0,max=100)
    prob_high_6= models.IntegerField(label='',min=0,max=100)
    bid_6 = models.IntegerField(label='Bid:', min=0, max=20)
    bid_6_2 = models.IntegerField(label='Bid:', min=0, max=20)
    shares_acquired_6 = models.IntegerField(initial=0)  # Shares acquired in the first purchase after period 6.
    shares_acquired_6_2 = models.IntegerField(initial=0)  # Shares acquired in the second purchase after period 6.
    payoff_6 = models.IntegerField(initial=0) # Payoff for the first stock purchased after round 6.
    payoff_6_2 = models.IntegerField(initial=0) # Payoff for the second stock purchased after round 6.
    earnings_6 = models.IntegerField(initial=0)  # payoff_6 * shares_acquired_6
    earnings_6_2 = models.IntegerField(initial=0)  # payoff_6_2 * shares_acquired_6_2
    guess_6 = models.IntegerField(label='')  # Subject's guess for the final payout of the first stock they bid on in the second market.
    guess_6_2 = models.IntegerField(label='')

    earnings = models.IntegerField(initial=0) # Total earnings for the round including cash and stock payoffs.

    stock_3 = models.StringField(initial='') # Name of tne first stock that could be picked at the end of round 3.
    stock_3_2 = models.StringField(initial='') # Name of the second stock that could be picked at the end of round 3.
    stock_6 = models.StringField(initial='') # Name of stock that could be picked at the end of round 6.
    stock_6_2 = models.StringField(initial='') # Name of stock that could be picked at the end of round 6.

    final_earnings = models.IntegerField(initial=0)
    cash_balance = models.IntegerField(initial=C.CREDIT)


# FUNCTIONS
# PAGES
class Intro(Page):
    def vars_for_template(player: Player):
        if player.subsession.session.config['number'] == 1:  # The current app goes first.  There are no rounds from the other app.
            current_round = player.round_number
        else:                                                # The current app goes second.  Adds the rounds from the other app.
            current_round = player.round_number + 5
        return{
            'current_round': current_round
        }




class Bid1(Page):

    def vars_for_template(player: Player):
       player.stock_3 = C.NAMES[player.round_number][0]  # The name of the first stock that can be purchased after period 3.
       player.stock_3_2 = C.NAMES[player.round_number][1] # The name of the second stock that can be purchased after period 3.

       player.payoff_3 = C.PAYOFFS[player.round_number][player.stock_3]  # The payoff of the frist stock that can be purchased after period 3.
       player.payoff_3_2 = C.PAYOFFS[player.round_number][player.stock_3_2]  # The payoff of the second stock that can be purchased after period 3.



       return dict(
          image_path1= 'stock_experiment_cliff_nelson/stock_movements_{}_part1.jpg'.format(player.round_number),
          image_path2='stock_experiment_cliff_nelson/stock_movements_{}_part1_graph.jpg'.format(player.round_number),

       )
    form_model = 'player'
    form_fields = ['prob_low_3','prob_high_3','guess_3','guess_3_2','bid_3','bid_3_2']

class Bid2(Page):
    def vars_for_template(player: Player):
        player.stock_6 = C.NAMES[player.round_number][2]  # The name of the first stock that can be purchased after period 6.
        player.stock_6_2 = C.NAMES[player.round_number][3]  # The name of the second stock that can be purchased after period 6.

        player.payoff_6 = C.PAYOFFS[player.round_number][player.stock_6]  # The payoff of the frist stock that can be purchased after period 3.
        player.payoff_6_2 = C.PAYOFFS[player.round_number][player.stock_6_2]  # The payoff of the second stock that can be purchased after period 3.

        return dict(
            image_path1= 'stock_experiment_cliff_nelson/stock_movements_{}_part2.jpg'.format(player.round_number),
            image_path2='stock_experiment_cliff_nelson/stock_movements_{}_part2_graph.jpg'.format(player.round_number)
        )
    form_model = 'player'
    form_fields = ['prob_low_6','prob_high_6','guess_6','guess_6_2','bid_6','bid_6_2']

class Results1(Page):
    @staticmethod
    def vars_for_template(player: Player):
        ran_int = random.randint(1,C.MAX)
        purchase_3 = (ran_int<=player.bid_3)

        if purchase_3:
            player.shares_acquired_3 = 1
            player.cash_balance -= ran_int
            statement = "Since " + str(ran_int) +" is less than or equal to your bid, you puchased 1 share of stock " + player.stock_3 + " at the price of " + str(ran_int) +"."
        else:
            player.shares_acquired_3 = 0
            statement = "Since " + str(ran_int) + " is greater than your bid, you did not purchase any shares."

        ran_int_2 = random.randint(1,C.MAX)
        purchase_3_2 = (ran_int_2<=player.bid_3_2)

        if purchase_3_2:
            player.shares_acquired_3_2 = 1
            player.cash_balance -= ran_int_2
            statement_2 = "Since " + str(ran_int_2) +" is less than or equal to your bid, you puchased 1 share of stock " + player.stock_3_2 + " at the price of " + str(ran_int_2) +"."
        else:
            player.shares_acquired_3_2 = 0
            statement_2 = "Since " + str(ran_int_2) + " is greater than your bid, you did not purchase any shares."

        return{
            "ran_int":ran_int,
            "statement":statement,
            "ran_int_2":ran_int_2,
            "statement_2":statement_2,
        }



class Results2(Page):
    @staticmethod
    def vars_for_template(player: Player):
        ran_int = random.randint(1,C.MAX)
        purchase_6 = (ran_int <= player.bid_6)

        if purchase_6:
            player.shares_acquired_6 = 1
            player.cash_balance -= ran_int
            statement = "Since " + str(ran_int) +" is less than or equal to your bid, you puchased 1 share of stock " + player.stock_6 + " at the price of " + str(ran_int) +"."
        else:
            player.shares_acquired_6 = 0
            statement = "Since " + str(ran_int) + " is greater than your bid, you did not purchase any shares."

        ran_int_2 = random.randint(1,C.MAX)
        purchase_6_2 = (ran_int_2<=player.bid_6_2)

        if purchase_6_2:
            player.shares_acquired_6_2 = 1
            player.cash_balance -= ran_int_2
            statement_2 = "Since " + str(ran_int_2) +" is less than or equal to your bid, you puchased 1 share of stock " + player.stock_6_2 + " at the price of " + str(ran_int_2) +"."
        else:
            player.shares_acquired_6_2 = 0
            statement_2 = "Since " + str(ran_int_2) + " is greater than your bid, you did not purchase any shares."



        return{
            "ran_int":ran_int,
            "statement":statement,
            "ran_int_2":ran_int_2,
            "statement_2":statement_2,
        }



class CombinedResults(Page):
    @staticmethod
    def vars_for_template(player: Player):

        player.earnings_3 = player.payoff_3 * player.shares_acquired_3
        player.earnings_3_2 = player.payoff_3_2 * player.shares_acquired_3_2
        player.earnings_6 = player.payoff_6 * player.shares_acquired_6
        player.earnings_6_2 = player.payoff_6_2 * player.shares_acquired_6_2

        player.earnings = player.cash_balance+ player.earnings_3 + player.earnings_3_2 + player.earnings_6 + player.earnings_6_2


        all_players = player.in_all_rounds()

        player.final_earnings = 0

        for temp_player in all_players:
            player.final_earnings += temp_player.earnings

        if player.subsession.session.config['number'] == 1:  # The current app goes first.  Defines the participant variable 'final_earnings'.
            player.participant.vars['final_earnings'] = player.final_earnings
        else:                                                # The current app goes second.  Adds to the participant variable 'final_earnings'.
            player.final_earnings = player.participant.vars['final_earnings'] + player.final_earnings

        return dict(
            image_path= 'stock_experiment_cliff_nelson/stock_movements_{}_part3.jpg'.format(player.round_number)
        )

page_sequence = [Intro, Bid1 , Results1, Bid2, Results2, CombinedResults]
