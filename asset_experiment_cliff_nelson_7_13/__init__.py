from otree.api import *
import random

class C(BaseConstants):
    NAME_IN_URL = 'survey_3'
    PLAYERS_PER_GROUP = None
    NUM_ROUNDS = 2
    #CREDIT = 80 # This is sufficient to cover the maximum bidding price of 20 in each of the 4 bidding decisions per round.
    MAX = 20 # Maximum bid.
    NAMES = {
        1: ['B', 'L'],  # First (highest) asset in market 1, second asset in market 2.
        2: ['C', 'O'],
    }

    PAYOFFS = {
        1: {'B': 13, 'L': 5},
        2: {'C': 13, 'O': 17},
    }

    PROJ_PAYOFF_3 = { # Projected payoffs in period 3.
        1: {'B': 10, 'L': 8},
        2: {'C': 10, 'O': 10},
    }




class Subsession(BaseSubsession):
    cummulative_earnings = models.IntegerField(initial = 0)


class Group(BaseGroup):
    pass


class Player(BasePlayer):
    prob_3 = models.IntegerField(label='',min=0,max=100)
    prob_3_2= models.IntegerField(label='',min=0,max=100)
    bid_3 = models.IntegerField(label='', min=0, max=20)
    bid_3_2 = models.IntegerField(label='', min=0, max=20)
    price_3 = models.IntegerField(initial = 0)
    price_3_2 = models.IntegerField(initial = 0)
    curr_payoff_3 = models.IntegerField(initial = 0) # Projected payoff after period 3 of first asset.
    curr_payoff_3_2 = models.IntegerField(initial = 0)
    shares_acquired_3 = models.IntegerField(initial=0)  # Shares acquired in the first purchase after period 3.
    shares_acquired_3_2 = models.IntegerField(initial=0)  # Shares acquired in the second purchase after period 3.
    acquired_3 = models.StringField(initial = 'No') # Yes if shares_aquired_3 is 1, otherwise No.
    acquired_3_2 = models.StringField(initial = 'No') # Yes if shares_aquired_3_2 is 1, otherwise No.
    payoff_3 = models.IntegerField(initial=0) # Payoff for the first asset purchased after round 3.
    payoff_3_2 = models.IntegerField(initial=0)  # Payoff for the second asset purchased after round 3.
    earnings_3 = models.IntegerField(initial=0)  # payoff_3 * shares_acquired_3 - price_3
    earnings_3_2 = models.IntegerField(initial=0)  # payoff_3_2 * shares_acquired_3_2 - price_3_2
    guess_3 = models.IntegerField(label='')  # Subject's guess for the final payout of the first asset they bid on in the first market.
    guess_3_2 = models.IntegerField(label='')



    earnings = models.IntegerField(initial=0) # Earnings for the round from asset payoffs.
    earnings_1 = models.IntegerField(initial=0) # Total earnings from the first market.
    earnings_from_guess_1 = models.IntegerField(initial=0)  # Earnings from correct payoff guesses in the first round. +/- 1 is okay.

    asset_3 = models.StringField(initial='') # Name of tne first (highest) asset that could be picked at the end of round 3.
    asset_3_2 = models.StringField(initial='') # Name of the second asset that could be picked at the end of round 3.

    final_earnings = models.IntegerField(initial=0)



# FUNCTIONS
# PAGES
class Intro(Page):
    def vars_for_template(player: Player):
        current_round = 10 + player.round_number   # The first 10 rounds have already been played.
        return{
            'current_round': current_round
        }




class Bid1(Page):

    def vars_for_template(player: Player):
       player.asset_3 = C.NAMES[player.round_number][0]  # The name of the first asset that can be purchased after period 3.
       player.asset_3_2 = C.NAMES[player.round_number][1] # The name of the second asset that can be purchased after period 3.

       player.payoff_3 = C.PAYOFFS[player.round_number][player.asset_3]  # The payoff of the first asset that can be purchased after period 3.
       player.payoff_3_2 = C.PAYOFFS[player.round_number][player.asset_3_2]  # The payoff of the second asset that can be purchased after period 3.

       player.curr_payoff_3 = C.PROJ_PAYOFF_3[player.round_number][player.asset_3]
       player.curr_payoff_3_2 = C.PROJ_PAYOFF_3[player.round_number][player.asset_3_2]

       return dict(
          image_path1= 'asset_experiment_cliff_nelson_7_13/asset_movements_{}_part1.jpg'.format(player.round_number),
          image_path2='asset_experiment_cliff_nelson_7_13/asset_movements_{}_part1_graph.jpg'.format(player.round_number),

       )
    form_model = 'player'
    form_fields = ['prob_3','prob_3_2','guess_3','guess_3_2','bid_3','bid_3_2']




class Results1(Page):
    @staticmethod
    def vars_for_template(player: Player):
        ran_int = random.randint(1,C.MAX)
        purchase_3 = (ran_int<=player.bid_3)

        if purchase_3:
            player.price_3 = ran_int
            player.shares_acquired_3 = 1
            player.acquired_3 = "Yes"
            statement = "Since " + str(ran_int) +" is less than or equal to your first bid, you puchased 1 unit of asset " + player.asset_3 + " at the price of " + str(player.price_3) +"."
        else:
            player.shares_acquired_3 = 0
            statement = "Since " + str(ran_int) + " is greater than your first bid, you did not purchase any units of asset " + player.asset_3 + "."

        ran_int_2 = random.randint(1,C.MAX)
        purchase_3_2 = (ran_int_2<=player.bid_3_2)

        if purchase_3_2:
            player.price_3_2 = ran_int_2
            player.shares_acquired_3_2 = 1
            player.acquired_3_2 = "Yes"
            statement_2 = "Since " + str(ran_int_2) +" is less than or equal to your second bid, you puchased 1 unit of asset " + player.asset_3_2 + " at the price of " + str(player.price_3_2) +"."
        else:
            player.shares_acquired_3_2 = 0
            statement_2 = "Since " + str(ran_int_2) + " is greater than your second bid, you did not purchase any units of asset " + player.asset_3_2 + "."

        return{
            "ran_int":ran_int,
            "statement":statement,
            "ran_int_2":ran_int_2,
            "statement_2":statement_2,
        }







class CombinedResults(Page):
    @staticmethod
    def vars_for_template(player: Player):

        player.earnings_3 = player.payoff_3 * player.shares_acquired_3 - player.price_3
        player.earnings_3_2 = player.payoff_3_2 * player.shares_acquired_3_2 - player.price_3_2


        player.earnings = player.earnings_3 + player.earnings_3_2

        player.earnings_from_guess_1 = 0

        if abs(player.guess_3 - player.payoff_3) < 2:
            player.earnings_from_guess_1 += 1
        if abs(player.guess_3_2 - player.payoff_3_2) < 2:
            player.earnings_from_guess_1 += 1

        player.earnings_1 = player.earnings_3 + player.earnings_3_2 + player.earnings_from_guess_1

        player.earnings = player.earnings_1

        all_players = player.in_all_rounds()

        player.final_earnings = 0

        for temp_player in all_players:
            player.final_earnings += temp_player.earnings

        player.participant.vars['final_earnings_bonus'] = player.final_earnings

        player.final_earnings = player.final_earnings + player.participant.vars['final_earnings'] + player.participant.vars['final_earnings_app2']


        return dict(
            image_path= 'asset_experiment_cliff_nelson_7_13/asset_movements_{}_part3.jpg'.format(player.round_number)
        )

page_sequence = [Intro, Bid1 , Results1, CombinedResults]
