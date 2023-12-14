# Structure of this code:
# Part 1: Define lists that will contain the numbers for each subject.  If there are N subjects, this list will eventually contain N numbers.
# Part 2: Use a for loop to read in all the data from the various csv files.  This for loop cycles through all files.
# Part 3: Within the above for loop, there is another for loop that goes through each subject in the file and fills in all lists variables defined at the beginning.
# Part 4: Define new variables that are give specific values for the situation (e.g. 3 of 3 growth) and go through a loop which fills them in.  
# Part 5: Hypothesis tests.







path = "C:/Users/Cliff/Documents/Overvaluation Experiment/Experiment Data Files/Modified Data Files/"
file_names <- file.path(path, dir(path,pattern = ".csv"))

library(statpsych)

# Part 1

stock_experience <- list() # Does the subject have experience in the stock market?
econ_knowledge <- list() # Has the subject taken an economics class? 

prob_3_SS_1 <- list() # Subject's round 1, period 3 guessed probability that the first asset is a SS.  # Alternative: for(i in 1:5){  prob <- paste("prob_3_SS_",i);  assign(prob,list()) }
prob_3_SS_2 <- list()
prob_3_SS_3 <- list()
prob_3_SS_4 <- list()
prob_3_SS_5 <- list()
prob_3_SS_7_13_1 <- list() # Subject's period 3 guessed prob that the first asset is a superstar for round 1 of when assets start at 7 or 13.
prob_3_SS_7_13_2 <- list()

prob_3_SS <- list() # Subject's guessed probability of being a SS averaged for all rounds.

prob_3_2_SS_1 <- list() # Subject's round 1, period 3 guessed probability that the second asset is a SS.
prob_3_2_SS_2 <- list()
prob_3_2_SS_3 <- list()
prob_3_2_SS_4 <- list()
prob_3_2_SS_5 <- list()
prob_3_2_SS_7_13_1 <- list() # Subject's period 3 guessed prob that the second asset is a superstar for round 1 of when assets start at 7 or 13.
prob_3_2_SS_7_13_2 <- list()


prob_4_SS_1 <- list() # Subject's round 1, period 4 guessed probability that the first asset is a SS.  
prob_4_SS_2 <- list()
prob_4_SS_3 <- list()
prob_4_SS_4 <- list()
prob_4_SS_5 <- list()

prob_4_2_SS_1 <- list() # Subject's round 1, period 4 guessed probability that the second asset is a SS.
prob_4_2_SS_2 <- list()
prob_4_2_SS_3 <- list()
prob_4_2_SS_4 <- list()
prob_4_2_SS_5 <- list()

prob_5_SS_1 <- list() # Subject's round 1, period 5 guessed probability that the first asset is a SS.  
prob_5_SS_2 <- list()
prob_5_SS_3 <- list()
prob_5_SS_4 <- list()
prob_5_SS_5 <- list()

prob_5_2_SS_1 <- list() # Subject's round 1, period 5 guessed probability that the second asset is a SS.
prob_5_2_SS_2 <- list()
prob_5_2_SS_3 <- list()
prob_5_2_SS_4 <- list()
prob_5_2_SS_5 <- list()


bid_3_SS_1 <- list() # Subject's round 1 bid for a asset with the most increase after period 3 when superstars are possible.
bid_3_SS_2 <- list()
bid_3_SS_3 <- list()
bid_3_SS_4 <- list()
bid_3_SS_5 <- list()
bid_3_SS_7_13_1 <- list() # Subject's period 3 bid for the first asset for round 1 of when assets start at 7 or 13.
bid_3_SS_7_13_2 <- list()

bid_3_SS <- list() # Subject's average bid for a stock with the most increase after period 3.

bid_3_2_SS_1 <- list() # Subject's round 1 bid for the second asset after period 3 when superstars are possible.
bid_3_2_SS_2 <- list()
bid_3_2_SS_3 <- list()
bid_3_2_SS_4 <- list()
bid_3_2_SS_5 <- list()
bid_3_2_SS_7_13_1 <- list() # Subject's period 3 bid for the second asset for round 1 of when assets start at 7 or 13.
bid_3_2_SS_7_13_2 <- list()


bid_3_NoSS_1 <- list() # Subject's round 1 bid for a asset with the most increase after period 3 when superstars are not possible.
bid_3_NoSS_2 <- list()
bid_3_NoSS_3 <- list()
bid_3_NoSS_4 <- list()
bid_3_NoSS_5 <- list()

bid_3_NoSS <- list()

bid_3_2_NoSS_1 <- list() # Subject's round 1 bid for the second asset after period 3 when superstars are NOT possible.
bid_3_2_NoSS_2 <- list()
bid_3_2_NoSS_3 <- list()
bid_3_2_NoSS_4 <- list()
bid_3_2_NoSS_5 <- list()


guess_3_SS_1 <- list() # Subject's round 1 guess for a asset with the most increase after period 3 when superstars are possible.
guess_3_SS_2 <- list()
guess_3_SS_3 <- list()
guess_3_SS_4 <- list()
guess_3_SS_5 <- list()
guess_3_SS_7_13_1 <- list() # Subject's period 3 guessed final payoff for the first asset for round 1 of when assets start at 7 or 13.
guess_3_SS_7_13_2 <- list()

guess_3_SS <- list() # Subject's average guess for a stock with the most increase after period 3.

guess_3_2_SS_1 <- list() # Subject's round 1 guess for the second asset after period 3 when superstars are possible.
guess_3_2_SS_2 <- list()
guess_3_2_SS_3 <- list()
guess_3_2_SS_4 <- list()
guess_3_2_SS_5 <- list()
guess_3_2_SS_7_13_1 <- list() # Subject's period 3 guessed final payoff for the first asset for round 1 of when assets start at 7 or 13.
guess_3_2_SS_7_13_2 <- list()


guess_3_NoSS_1 <- list() # Subject's round 1 guess for a asset with the most increase after period 3 when superstars are not possible.
guess_3_NoSS_2 <- list()
guess_3_NoSS_3 <- list()
guess_3_NoSS_4 <- list()
guess_3_NoSS_5 <- list()

guess_3_NoSS <- list()

guess_3_2_NoSS_1 <- list() # Subject's round 1 guess for the second asset after period 3 when superstars are NOT possible.
guess_3_2_NoSS_2 <- list()
guess_3_2_NoSS_3 <- list()
guess_3_2_NoSS_4 <- list()
guess_3_2_NoSS_5 <- list()





discount_3_NoSS <- list()

curr_payoff_3_SS <- list()

curr_payoff_3_SS_1 <- list()
curr_payoff_3_SS_2 <- list()
curr_payoff_3_SS_3 <- list()
curr_payoff_3_SS_4 <- list()
curr_payoff_3_SS_5 <- list()

curr_payoff_3_2_SS_1 <- list()
curr_payoff_3_2_SS_2 <- list()
curr_payoff_3_2_SS_3 <- list()
curr_payoff_3_2_SS_4 <- list()
curr_payoff_3_2_SS_5 <- list()

curr_payoff_4_SS_1 <- list()
curr_payoff_4_SS_2 <- list()
curr_payoff_4_SS_3 <- list()
curr_payoff_4_SS_4 <- list()
curr_payoff_4_SS_5 <- list()

curr_payoff_4_2_SS_1 <- list()
curr_payoff_4_2_SS_2 <- list()
curr_payoff_4_2_SS_3 <- list()
curr_payoff_4_2_SS_4 <- list()
curr_payoff_4_2_SS_5 <- list()

curr_payoff_5_SS_1 <- list()
curr_payoff_5_SS_2 <- list()
curr_payoff_5_SS_3 <- list()
curr_payoff_5_SS_4 <- list()
curr_payoff_5_SS_5 <- list()

curr_payoff_5_2_SS_1 <- list()
curr_payoff_5_2_SS_2 <- list()
curr_payoff_5_2_SS_3 <- list()
curr_payoff_5_2_SS_4 <- list()
curr_payoff_5_2_SS_5 <- list()


curr_payoff_3_NoSS <- list()

curr_payoff_3_NoSS_1 <- list()
curr_payoff_3_NoSS_2 <- list()
curr_payoff_3_NoSS_3 <- list()
curr_payoff_3_NoSS_4 <- list()
curr_payoff_3_NoSS_5 <- list()


curr_payoff_3_2_NoSS_1 <- list()
curr_payoff_3_2_NoSS_2 <- list()
curr_payoff_3_2_NoSS_3 <- list()
curr_payoff_3_2_NoSS_4 <- list()
curr_payoff_3_2_NoSS_5 <- list()

############################################################################

prob_6_SS_1 <- list() # Subject's round 1 guessed probability that the first asset is a SS after period 6..
prob_6_SS_2 <- list()
prob_6_SS_3 <- list()
prob_6_SS_4 <- list()
prob_6_SS_5 <- list()

prob_6_SS <- list() # Subject's guessed probability of being a SS averaged for all rounds.

prob_6_2_SS_1 <- list() # Subject's round 1 guessed probability that the first asset is a SS.
prob_6_2_SS_2 <- list()
prob_6_2_SS_3 <- list()
prob_6_2_SS_4 <- list()
prob_6_2_SS_5 <- list()

bid_6_SS_1 <- list() # Subject's round 1 bid for a asset with the most increase after period 6 when superstars are possible.
bid_6_SS_2 <- list()
bid_6_SS_3 <- list()
bid_6_SS_4 <- list()
bid_6_SS_5 <- list()

bid_6_SS <- list() # Subject's average bid for a stock with the most increase after period 6.

bid_6_2_SS_1 <- list() # Subject's round 1 bid for the second asset after period 6 when superstars are possible.
bid_6_2_SS_2 <- list()
bid_6_2_SS_3 <- list()
bid_6_2_SS_4 <- list()
bid_6_2_SS_5 <- list()


bid_6_NoSS_1 <- list() # Subject's round 1 bid for a asset with the most increase after period 6 when superstars are not possible.
bid_6_NoSS_2 <- list()
bid_6_NoSS_3 <- list()
bid_6_NoSS_4 <- list()
bid_6_NoSS_5 <- list()

bid_6_NoSS <- list()

bid_6_2_NoSS_1 <- list() # Subject's round 1 bid for the second asset after period 6 when superstars are NOT possible.
bid_6_2_NoSS_2 <- list()
bid_6_2_NoSS_3 <- list()
bid_6_2_NoSS_4 <- list()
bid_6_2_NoSS_5 <- list()








guess_6_SS_1 <- list() # Subject's round 1 guess for a asset with the most increase after period 6 when superstars are possible.
guess_6_SS_2 <- list()
guess_6_SS_3 <- list()
guess_6_SS_4 <- list()
guess_6_SS_5 <- list()

guess_6_SS <- list() # Subject's average guess for a stock with the most increase after period 6.

guess_6_2_SS_1 <- list() # Subject's round 1 guess for the second asset after period 6 when superstars are possible.
guess_6_2_SS_2 <- list()
guess_6_2_SS_3 <- list()
guess_6_2_SS_4 <- list()
guess_6_2_SS_5 <- list()


guess_6_NoSS_1 <- list() # Subject's round 1 guess for a asset with the most increase after period 6 when superstars are not possible.
guess_6_NoSS_2 <- list()
guess_6_NoSS_3 <- list()
guess_6_NoSS_4 <- list()
guess_6_NoSS_5 <- list()

guess_6_NoSS <- list()

guess_6_2_NoSS_1 <- list() # Subject's round 1 guess for the second asset after period 6 when superstars are NOT possible.
guess_6_2_NoSS_2 <- list()
guess_6_2_NoSS_3 <- list()
guess_6_2_NoSS_4 <- list()
guess_6_2_NoSS_5 <- list()



discount_6_NoSS <- list()

curr_payoff_6_SS <- list()

curr_payoff_6_SS_1 <- list()
curr_payoff_6_SS_2 <- list()
curr_payoff_6_SS_3 <- list()
curr_payoff_6_SS_4 <- list()
curr_payoff_6_SS_5 <- list()


curr_payoff_6_NoSS <- list()


curr_payoff_6_NoSS_1 <- list()
curr_payoff_6_NoSS_2 <- list()
curr_payoff_6_NoSS_3 <- list()
curr_payoff_6_NoSS_4 <- list()
curr_payoff_6_NoSS_5 <- list()


curr_payoff_6_2_SS_1 <- list()
curr_payoff_6_2_SS_2 <- list()
curr_payoff_6_2_SS_3 <- list()
curr_payoff_6_2_SS_4 <- list()
curr_payoff_6_2_SS_5 <- list()


curr_payoff_6_2_NoSS_1 <- list()
curr_payoff_6_2_NoSS_2 <- list()
curr_payoff_6_2_NoSS_3 <- list()
curr_payoff_6_2_NoSS_4 <- list()
curr_payoff_6_2_NoSS_5 <- list()



# Part 2

for(i in 1:length(file_names)){
  data_temp <- read.csv(file_names[i])
  no_subjects <- length(data_temp$participant.code) # Number of subjects in that session.
  
  stock_experience_temp <- data_temp$final_instructions.1.player.stock_experience
  econ_knowledge_temp   <- data_temp$final_instructions.1.player.econ_knowledge
  
  prob_3_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_3
  prob_3_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_3
  prob_3_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_3
  prob_3_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_3
  prob_3_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_3
  prob_3_SS_7_13_1_temp <- data_temp$asset_experiment_cliff_nelson_7_13.1.player.prob_3
  prob_3_SS_7_13_2_temp <- data_temp$asset_experiment_cliff_nelson_7_13.2.player.prob_3
  
  prob_3_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.prob_3 +
                     data_temp$asset_experiment_cliff_nelson.2.player.prob_3 +
                     data_temp$asset_experiment_cliff_nelson.3.player.prob_3 +
                     data_temp$asset_experiment_cliff_nelson.4.player.prob_3 +
                     data_temp$asset_experiment_cliff_nelson.5.player.prob_3)/5  
  
  prob_3_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_3_2
  prob_3_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_3_2
  prob_3_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_3_2
  prob_3_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_3_2
  prob_3_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_3_2
  prob_3_2_SS_7_13_1_temp <- data_temp$asset_experiment_cliff_nelson_7_13.1.player.prob_3_2
  prob_3_2_SS_7_13_2_temp <- data_temp$asset_experiment_cliff_nelson_7_13.2.player.prob_3_2
  
  prob_4_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_4
  prob_4_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_4
  prob_4_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_4
  prob_4_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_4
  prob_4_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_4
  
  prob_4_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_4_2
  prob_4_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_4_2
  prob_4_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_4_2
  prob_4_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_4_2
  prob_4_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_4_2
  
  prob_5_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_5
  prob_5_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_5
  prob_5_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_5
  prob_5_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_5
  prob_5_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_5
  
  prob_5_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_5_2
  prob_5_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_5_2
  prob_5_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_5_2
  prob_5_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_5_2
  prob_5_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_5_2
  
  
  bid_3_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.bid_3
  bid_3_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.bid_3
  bid_3_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.bid_3
  bid_3_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.bid_3
  bid_3_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.bid_3
  bid_3_SS_7_13_1_temp <- data_temp$asset_experiment_cliff_nelson_7_13.1.player.bid_3
  bid_3_SS_7_13_2_temp <- data_temp$asset_experiment_cliff_nelson_7_13.2.player.bid_3    
  
  bid_3_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.bid_3 +
    data_temp$asset_experiment_cliff_nelson.2.player.bid_3 +
    data_temp$asset_experiment_cliff_nelson.3.player.bid_3 +
    data_temp$asset_experiment_cliff_nelson.4.player.bid_3 +
    data_temp$asset_experiment_cliff_nelson.5.player.bid_3)/5
  
  bid_3_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.bid_3_2
  bid_3_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.bid_3_2
  bid_3_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.bid_3_2
  bid_3_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.bid_3_2
  bid_3_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.bid_3_2
  bid_3_2_SS_7_13_1_temp <- data_temp$asset_experiment_cliff_nelson_7_13.1.player.bid_3_2
  bid_3_2_SS_7_13_2_temp <- data_temp$asset_experiment_cliff_nelson_7_13.2.player.bid_3_2 
  
  bid_3_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_3
  bid_3_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_3
  bid_3_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_3
  bid_3_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_3
  bid_3_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_3 
  
  bid_3_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_3)/5
  
  bid_3_2_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_3_2
  bid_3_2_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_3_2
  bid_3_2_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_3_2
  bid_3_2_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_3_2
  bid_3_2_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_3_2
 
  
  guess_3_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.guess_3
  guess_3_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.guess_3
  guess_3_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.guess_3
  guess_3_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.guess_3
  guess_3_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.guess_3
  guess_3_SS_7_13_1_temp <- data_temp$asset_experiment_cliff_nelson_7_13.1.player.guess_3
  guess_3_SS_7_13_2_temp <- data_temp$asset_experiment_cliff_nelson_7_13.2.player.guess_3
  
  
  guess_3_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.guess_3 +
                      data_temp$asset_experiment_cliff_nelson.2.player.guess_3 +
                      data_temp$asset_experiment_cliff_nelson.3.player.guess_3 +
                      data_temp$asset_experiment_cliff_nelson.4.player.guess_3 +
                      data_temp$asset_experiment_cliff_nelson.5.player.guess_3)/5
  
  guess_3_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.guess_3_2
  guess_3_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.guess_3_2
  guess_3_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.guess_3_2
  guess_3_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.guess_3_2
  guess_3_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.guess_3_2
  guess_3_2_SS_7_13_1_temp <- data_temp$asset_experiment_cliff_nelson_7_13.1.player.guess_3_2
  guess_3_2_SS_7_13_2_temp <- data_temp$asset_experiment_cliff_nelson_7_13.2.player.guess_3_2
  
  guess_3_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.guess_3
  guess_3_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.guess_3
  guess_3_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.guess_3
  guess_3_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.guess_3
  guess_3_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.guess_3 
  
  guess_3_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.guess_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.guess_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.guess_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.guess_3 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.guess_3)/5
  
  guess_3_2_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.guess_3_2
  guess_3_2_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.guess_3_2
  guess_3_2_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.guess_3_2
  guess_3_2_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.guess_3_2
  guess_3_2_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.guess_3_2
  
  
  curr_payoff_3_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_3
  curr_payoff_3_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_3
  curr_payoff_3_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_3
  curr_payoff_3_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_3
  curr_payoff_3_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_3
  
  curr_payoff_3_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_3_2
  curr_payoff_3_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_3_2
  curr_payoff_3_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_3_2
  curr_payoff_3_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_3_2
  curr_payoff_3_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_3_2

  curr_payoff_4_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_4
  curr_payoff_4_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_4
  curr_payoff_4_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_4
  curr_payoff_4_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_4
  curr_payoff_4_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_4
  
  curr_payoff_4_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_4_2
  curr_payoff_4_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_4_2
  curr_payoff_4_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_4_2
  curr_payoff_4_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_4_2
  curr_payoff_4_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_4_2
  
  curr_payoff_5_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_5
  curr_payoff_5_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_5
  curr_payoff_5_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_5
  curr_payoff_5_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_5
  curr_payoff_5_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_5
  
  curr_payoff_5_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_5_2
  curr_payoff_5_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_5_2
  curr_payoff_5_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_5_2
  curr_payoff_5_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_5_2
  curr_payoff_5_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_5_2 
  
    
  curr_payoff_3_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_3
  curr_payoff_3_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_3
  curr_payoff_3_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_3
  curr_payoff_3_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_3
  curr_payoff_3_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_3
  
  
  curr_payoff_3_2_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_3_2
  curr_payoff_3_2_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_3_2
  curr_payoff_3_2_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_3_2
  curr_payoff_3_2_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_3_2
  curr_payoff_3_2_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_3_2
  
   
  curr_payoff_3_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_3 +
                      data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_3 +
                      data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_3 +
                      data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_3 +
                      data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_3)/5
  curr_payoff_3_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_3 +
                              data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_3 +
                              data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_3 +
                              data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_3 +
                              data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_3)/5
  
  
  discount_3_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_3/data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_3 +
    data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_3/data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_3 +
    data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_3/data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_3 +
    data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_3/data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_3 +
    data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_3/data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_3)/5

  
    
  prob_6_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_6
  prob_6_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_6
  prob_6_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_6
  prob_6_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_6
  prob_6_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_6
  
  prob_6_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.prob_6 +
                       data_temp$asset_experiment_cliff_nelson.2.player.prob_6 +
                       data_temp$asset_experiment_cliff_nelson.3.player.prob_6 +
                       data_temp$asset_experiment_cliff_nelson.4.player.prob_6 +
                       data_temp$asset_experiment_cliff_nelson.5.player.prob_6)/5  
  
  prob_6_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.prob_6_2
  prob_6_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.prob_6_2
  prob_6_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.prob_6_2
  prob_6_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.prob_6_2
  prob_6_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.prob_6_2
  
  
  bid_6_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.bid_6
  bid_6_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.bid_6
  bid_6_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.bid_6
  bid_6_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.bid_6
  bid_6_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.bid_6
  
  
  bid_6_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.bid_6 +
                      data_temp$asset_experiment_cliff_nelson.2.player.bid_6 +
                      data_temp$asset_experiment_cliff_nelson.3.player.bid_6 +
                      data_temp$asset_experiment_cliff_nelson.4.player.bid_6 +
                      data_temp$asset_experiment_cliff_nelson.5.player.bid_6)/5
  
  bid_6_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.bid_6_2
  bid_6_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.bid_6_2
  bid_6_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.bid_6_2
  bid_6_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.bid_6_2
  bid_6_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.bid_6_2
  
  bid_6_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_6
  bid_6_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_6
  bid_6_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_6
  bid_6_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_6
  bid_6_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_6 
  
  bid_6_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_6)/5
  
  bid_6_2_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_6_2
  bid_6_2_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_6_2
  bid_6_2_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_6_2
  bid_6_2_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_6_2
  bid_6_2_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_6_2

  
  
  
  
  
  
  
  
  guess_6_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.guess_6
  guess_6_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.guess_6
  guess_6_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.guess_6
  guess_6_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.guess_6
  guess_6_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.guess_6
  
  
  guess_6_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.guess_6 +
                      data_temp$asset_experiment_cliff_nelson.2.player.guess_6 +
                      data_temp$asset_experiment_cliff_nelson.3.player.guess_6 +
                      data_temp$asset_experiment_cliff_nelson.4.player.guess_6 +
                      data_temp$asset_experiment_cliff_nelson.5.player.guess_6)/5
  
  guess_6_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.guess_6_2
  guess_6_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.guess_6_2
  guess_6_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.guess_6_2
  guess_6_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.guess_6_2
  guess_6_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.guess_6_2
  
  guess_6_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.guess_6
  guess_6_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.guess_6
  guess_6_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.guess_6
  guess_6_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.guess_6
  guess_6_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.guess_6 
  
  guess_6_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.guess_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.guess_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.guess_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.guess_6 +
                        data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.guess_6)/5
  
  guess_6_2_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.guess_6_2
  guess_6_2_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.guess_6_2
  guess_6_2_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.guess_6_2
  guess_6_2_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.guess_6_2
  guess_6_2_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.guess_6_2
  
  
  
  
  curr_payoff_6_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_6
  curr_payoff_6_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_6
  curr_payoff_6_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_6
  curr_payoff_6_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_6
  curr_payoff_6_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_6
  
  
  curr_payoff_6_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_6
  curr_payoff_6_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_6
  curr_payoff_6_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_6
  curr_payoff_6_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_6
  curr_payoff_6_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_6
  
  curr_payoff_6_2_SS_1_temp <- data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_6_2
  curr_payoff_6_2_SS_2_temp <- data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_6_2
  curr_payoff_6_2_SS_3_temp <- data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_6_2
  curr_payoff_6_2_SS_4_temp <- data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_6_2
  curr_payoff_6_2_SS_5_temp <- data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_6_2
  
  
  curr_payoff_6_2_NoSS_1_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_6_2
  curr_payoff_6_2_NoSS_2_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_6_2
  curr_payoff_6_2_NoSS_3_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_6_2
  curr_payoff_6_2_NoSS_4_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_6_2
  curr_payoff_6_2_NoSS_5_temp <- data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_6_2
  
    
  curr_payoff_6_SS_temp <- (data_temp$asset_experiment_cliff_nelson.1.player.curr_payoff_6 +
                              data_temp$asset_experiment_cliff_nelson.2.player.curr_payoff_6 +
                              data_temp$asset_experiment_cliff_nelson.3.player.curr_payoff_6 +
                              data_temp$asset_experiment_cliff_nelson.4.player.curr_payoff_6 +
                              data_temp$asset_experiment_cliff_nelson.5.player.curr_payoff_6)/5
  curr_payoff_6_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_6 +
                                data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_6 +
                                data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_6 +
                                data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_6 +
                                data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_6)/5
  
  
  discount_6_NoSS_temp <- (data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.bid_6/data_temp$asset_experiment_cliff_nelson_no_superstars.1.player.curr_payoff_6 +
                             data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.bid_6/data_temp$asset_experiment_cliff_nelson_no_superstars.2.player.curr_payoff_6 +
                             data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.bid_6/data_temp$asset_experiment_cliff_nelson_no_superstars.3.player.curr_payoff_6 +
                             data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.bid_6/data_temp$asset_experiment_cliff_nelson_no_superstars.4.player.curr_payoff_6 +
                             data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.bid_6/data_temp$asset_experiment_cliff_nelson_no_superstars.5.player.curr_payoff_6)/5
  
  
# Part 3  
  for(j in 1:no_subjects){
    stock_experience <- append(stock_experience, stock_experience_temp[j])
    econ_knowledge   <- append(econ_knowledge, econ_knowledge_temp[j])
    
    prob_3_SS_1 <- append(prob_3_SS_1, prob_3_SS_1_temp[j])
    prob_3_SS_2 <- append(prob_3_SS_2, prob_3_SS_2_temp[j])
    prob_3_SS_3 <- append(prob_3_SS_3, prob_3_SS_3_temp[j])
    prob_3_SS_4 <- append(prob_3_SS_4, prob_3_SS_4_temp[j])
    prob_3_SS_5 <- append(prob_3_SS_5, prob_3_SS_5_temp[j])
    prob_3_SS_7_13_1 <- append(prob_3_SS_7_13_1, prob_3_SS_7_13_1_temp[j])
    prob_3_SS_7_13_2 <- append(prob_3_SS_7_13_2, prob_3_SS_7_13_2_temp[j])
    
    prob_3_SS <- append(prob_3_SS, prob_3_SS_temp[j])
    
    prob_3_2_SS_1 <- append(prob_3_2_SS_1, prob_3_2_SS_1_temp[j])
    prob_3_2_SS_2 <- append(prob_3_2_SS_2, prob_3_2_SS_2_temp[j])
    prob_3_2_SS_3 <- append(prob_3_2_SS_3, prob_3_2_SS_3_temp[j])
    prob_3_2_SS_4 <- append(prob_3_2_SS_4, prob_3_2_SS_4_temp[j])
    prob_3_2_SS_5 <- append(prob_3_2_SS_5, prob_3_2_SS_5_temp[j])
    prob_3_2_SS_7_13_1 <- append(prob_3_2_SS_7_13_1, prob_3_2_SS_7_13_1_temp[j])
    prob_3_2_SS_7_13_2 <- append(prob_3_2_SS_7_13_2, prob_3_2_SS_7_13_2_temp[j])
    
    prob_4_SS_1 <- append(prob_4_SS_1, prob_4_SS_1_temp[j])
    prob_4_SS_2 <- append(prob_4_SS_2, prob_4_SS_2_temp[j])
    prob_4_SS_3 <- append(prob_4_SS_3, prob_4_SS_3_temp[j])
    prob_4_SS_4 <- append(prob_4_SS_4, prob_4_SS_4_temp[j])
    prob_4_SS_5 <- append(prob_4_SS_5, prob_4_SS_5_temp[j])
    
    prob_4_2_SS_1 <- append(prob_4_2_SS_1, prob_4_2_SS_1_temp[j])
    prob_4_2_SS_2 <- append(prob_4_2_SS_2, prob_4_2_SS_2_temp[j])
    prob_4_2_SS_3 <- append(prob_4_2_SS_3, prob_4_2_SS_3_temp[j])
    prob_4_2_SS_4 <- append(prob_4_2_SS_4, prob_4_2_SS_4_temp[j])
    prob_4_2_SS_5 <- append(prob_4_2_SS_5, prob_4_2_SS_5_temp[j])
    
    prob_5_SS_1 <- append(prob_5_SS_1, prob_5_SS_1_temp[j])
    prob_5_SS_2 <- append(prob_5_SS_2, prob_5_SS_2_temp[j])
    prob_5_SS_3 <- append(prob_5_SS_3, prob_5_SS_3_temp[j])
    prob_5_SS_4 <- append(prob_5_SS_4, prob_5_SS_4_temp[j])
    prob_5_SS_5 <- append(prob_5_SS_5, prob_5_SS_5_temp[j])
    
    prob_5_2_SS_1 <- append(prob_5_2_SS_1, prob_5_2_SS_1_temp[j])
    prob_5_2_SS_2 <- append(prob_5_2_SS_2, prob_5_2_SS_2_temp[j])
    prob_5_2_SS_3 <- append(prob_5_2_SS_3, prob_5_2_SS_3_temp[j])
    prob_5_2_SS_4 <- append(prob_5_2_SS_4, prob_5_2_SS_4_temp[j])
    prob_5_2_SS_5 <- append(prob_5_2_SS_5, prob_5_2_SS_5_temp[j])
    
    bid_3_SS_1 <-append(bid_3_SS_1, bid_3_SS_1_temp[j])
    bid_3_SS_2 <-append(bid_3_SS_2, bid_3_SS_2_temp[j])
    bid_3_SS_3 <-append(bid_3_SS_3, bid_3_SS_3_temp[j])
    bid_3_SS_4 <-append(bid_3_SS_4, bid_3_SS_4_temp[j])
    bid_3_SS_5 <-append(bid_3_SS_5, bid_3_SS_5_temp[j])
    bid_3_SS_7_13_1 <- append(bid_3_SS_7_13_1, bid_3_SS_7_13_1_temp[j])
    bid_3_SS_7_13_2 <- append(bid_3_SS_7_13_2, bid_3_SS_7_13_2_temp[j])
    
    bid_3_SS <- append(bid_3_SS, bid_3_SS_temp[j])
    
    bid_3_2_SS_1 <-append(bid_3_2_SS_1, bid_3_2_SS_1_temp[j])
    bid_3_2_SS_2 <-append(bid_3_2_SS_2, bid_3_2_SS_2_temp[j])
    bid_3_2_SS_3 <-append(bid_3_2_SS_3, bid_3_2_SS_3_temp[j])
    bid_3_2_SS_4 <-append(bid_3_2_SS_4, bid_3_2_SS_4_temp[j])
    bid_3_2_SS_5 <-append(bid_3_2_SS_5, bid_3_2_SS_5_temp[j])
    bid_3_2_SS_7_13_1 <- append(bid_3_2_SS_7_13_1, bid_3_2_SS_7_13_1_temp[j])
    bid_3_2_SS_7_13_2 <- append(bid_3_2_SS_7_13_2, bid_3_2_SS_7_13_2_temp[j])
    
    
    bid_3_NoSS_1 <-append(bid_3_NoSS_1, bid_3_NoSS_1_temp[j])
    bid_3_NoSS_2 <-append(bid_3_NoSS_2, bid_3_NoSS_2_temp[j])
    bid_3_NoSS_3 <-append(bid_3_NoSS_3, bid_3_NoSS_3_temp[j])
    bid_3_NoSS_4 <-append(bid_3_NoSS_4, bid_3_NoSS_4_temp[j])
    bid_3_NoSS_5 <-append(bid_3_NoSS_5, bid_3_NoSS_5_temp[j])
    
    bid_3_NoSS <- append(bid_3_NoSS, bid_3_NoSS_temp[j])
    
    
    bid_3_2_NoSS_1 <-append(bid_3_2_NoSS_1, bid_3_2_NoSS_1_temp[j])
    bid_3_2_NoSS_2 <-append(bid_3_2_NoSS_2, bid_3_2_NoSS_2_temp[j])
    bid_3_2_NoSS_3 <-append(bid_3_2_NoSS_3, bid_3_2_NoSS_3_temp[j])
    bid_3_2_NoSS_4 <-append(bid_3_2_NoSS_4, bid_3_2_NoSS_4_temp[j])
    bid_3_2_NoSS_5 <-append(bid_3_2_NoSS_5, bid_3_2_NoSS_5_temp[j])
    
    
    guess_3_SS_1 <-append(guess_3_SS_1, guess_3_SS_1_temp[j])
    guess_3_SS_2 <-append(guess_3_SS_2, guess_3_SS_2_temp[j])
    guess_3_SS_3 <-append(guess_3_SS_3, guess_3_SS_3_temp[j])
    guess_3_SS_4 <-append(guess_3_SS_4, guess_3_SS_4_temp[j])
    guess_3_SS_5 <-append(guess_3_SS_5, guess_3_SS_5_temp[j])
    guess_3_SS_7_13_1 <- append(guess_3_SS_7_13_1, guess_3_SS_7_13_1_temp[j])
    guess_3_SS_7_13_2 <- append(guess_3_SS_7_13_2, guess_3_SS_7_13_2_temp[j])
    
    guess_3_SS <- append(guess_3_SS, guess_3_SS_temp[j])
    
    guess_3_2_SS_1 <-append(guess_3_2_SS_1, guess_3_2_SS_1_temp[j])
    guess_3_2_SS_2 <-append(guess_3_2_SS_2, guess_3_2_SS_2_temp[j])
    guess_3_2_SS_3 <-append(guess_3_2_SS_3, guess_3_2_SS_3_temp[j])
    guess_3_2_SS_4 <-append(guess_3_2_SS_4, guess_3_2_SS_4_temp[j])
    guess_3_2_SS_5 <-append(guess_3_2_SS_5, guess_3_2_SS_5_temp[j])
    guess_3_2_SS_7_13_1 <- append(guess_3_2_SS_7_13_1, guess_3_2_SS_7_13_1_temp[j])
    guess_3_2_SS_7_13_2 <- append(guess_3_2_SS_7_13_2, guess_3_2_SS_7_13_2_temp[j])
    
    
    guess_3_NoSS_1 <-append(guess_3_NoSS_1, guess_3_NoSS_1_temp[j])
    guess_3_NoSS_2 <-append(guess_3_NoSS_2, guess_3_NoSS_2_temp[j])
    guess_3_NoSS_3 <-append(guess_3_NoSS_3, guess_3_NoSS_3_temp[j])
    guess_3_NoSS_4 <-append(guess_3_NoSS_4, guess_3_NoSS_4_temp[j])
    guess_3_NoSS_5 <-append(guess_3_NoSS_5, guess_3_NoSS_5_temp[j])
    
    guess_3_NoSS <- append(guess_3_NoSS, guess_3_NoSS_temp[j])
    
    
    guess_3_2_NoSS_1 <-append(guess_3_2_NoSS_1, guess_3_2_NoSS_1_temp[j])
    guess_3_2_NoSS_2 <-append(guess_3_2_NoSS_2, guess_3_2_NoSS_2_temp[j])
    guess_3_2_NoSS_3 <-append(guess_3_2_NoSS_3, guess_3_2_NoSS_3_temp[j])
    guess_3_2_NoSS_4 <-append(guess_3_2_NoSS_4, guess_3_2_NoSS_4_temp[j])
    guess_3_2_NoSS_5 <-append(guess_3_2_NoSS_5, guess_3_2_NoSS_5_temp[j])
    
    
    
    
    
 
    discount_3_NoSS <- append(discount_3_NoSS, discount_3_NoSS_temp[j])
    curr_payoff_3_SS <- append(curr_payoff_3_SS, curr_payoff_3_SS_temp[j])
    curr_payoff_3_SS_1 <- append(curr_payoff_3_SS_1, curr_payoff_3_SS_1_temp[j])
    curr_payoff_3_SS_2 <- append(curr_payoff_3_SS_2, curr_payoff_3_SS_2_temp[j])
    curr_payoff_3_SS_3 <- append(curr_payoff_3_SS_3, curr_payoff_3_SS_3_temp[j])
    curr_payoff_3_SS_4 <- append(curr_payoff_3_SS_4, curr_payoff_3_SS_4_temp[j])
    curr_payoff_3_SS_5 <- append(curr_payoff_3_SS_5, curr_payoff_3_SS_5_temp[j])

    curr_payoff_3_2_SS_1 <- append(curr_payoff_3_2_SS_1, curr_payoff_3_2_SS_1_temp[j])
    curr_payoff_3_2_SS_2 <- append(curr_payoff_3_2_SS_2, curr_payoff_3_2_SS_2_temp[j])
    curr_payoff_3_2_SS_3 <- append(curr_payoff_3_2_SS_3, curr_payoff_3_2_SS_3_temp[j])
    curr_payoff_3_2_SS_4 <- append(curr_payoff_3_2_SS_4, curr_payoff_3_2_SS_4_temp[j])
    curr_payoff_3_2_SS_5 <- append(curr_payoff_3_2_SS_5, curr_payoff_3_2_SS_5_temp[j])    
    
    
    curr_payoff_4_SS_1 <- append(curr_payoff_4_SS_1, curr_payoff_4_SS_1_temp[j])
    curr_payoff_4_SS_2 <- append(curr_payoff_4_SS_2, curr_payoff_4_SS_2_temp[j])
    curr_payoff_4_SS_3 <- append(curr_payoff_4_SS_3, curr_payoff_4_SS_3_temp[j])
    curr_payoff_4_SS_4 <- append(curr_payoff_4_SS_4, curr_payoff_4_SS_4_temp[j])
    curr_payoff_4_SS_5 <- append(curr_payoff_4_SS_5, curr_payoff_4_SS_5_temp[j])
    
    curr_payoff_4_2_SS_1 <- append(curr_payoff_4_2_SS_1, curr_payoff_4_2_SS_1_temp[j])
    curr_payoff_4_2_SS_2 <- append(curr_payoff_4_2_SS_2, curr_payoff_4_2_SS_2_temp[j])
    curr_payoff_4_2_SS_3 <- append(curr_payoff_4_2_SS_3, curr_payoff_4_2_SS_3_temp[j])
    curr_payoff_4_2_SS_4 <- append(curr_payoff_4_2_SS_4, curr_payoff_4_2_SS_4_temp[j])
    curr_payoff_4_2_SS_5 <- append(curr_payoff_4_2_SS_5, curr_payoff_4_2_SS_5_temp[j]) 
    
    
    curr_payoff_5_SS_1 <- append(curr_payoff_5_SS_1, curr_payoff_5_SS_1_temp[j])
    curr_payoff_5_SS_2 <- append(curr_payoff_5_SS_2, curr_payoff_5_SS_2_temp[j])
    curr_payoff_5_SS_3 <- append(curr_payoff_5_SS_3, curr_payoff_5_SS_3_temp[j])
    curr_payoff_5_SS_4 <- append(curr_payoff_5_SS_4, curr_payoff_5_SS_4_temp[j])
    curr_payoff_5_SS_5 <- append(curr_payoff_5_SS_5, curr_payoff_5_SS_5_temp[j])
    
    curr_payoff_5_2_SS_1 <- append(curr_payoff_5_2_SS_1, curr_payoff_5_2_SS_1_temp[j])
    curr_payoff_5_2_SS_2 <- append(curr_payoff_5_2_SS_2, curr_payoff_5_2_SS_2_temp[j])
    curr_payoff_5_2_SS_3 <- append(curr_payoff_5_2_SS_3, curr_payoff_5_2_SS_3_temp[j])
    curr_payoff_5_2_SS_4 <- append(curr_payoff_5_2_SS_4, curr_payoff_5_2_SS_4_temp[j])
    curr_payoff_5_2_SS_5 <- append(curr_payoff_5_2_SS_5, curr_payoff_5_2_SS_5_temp[j]) 
    
    
    curr_payoff_3_NoSS <- append(curr_payoff_3_NoSS, curr_payoff_3_NoSS_temp[j])
    curr_payoff_3_NoSS_1 <- append(curr_payoff_3_NoSS_1, curr_payoff_3_NoSS_1_temp[j])
    curr_payoff_3_NoSS_2 <- append(curr_payoff_3_NoSS_2, curr_payoff_3_NoSS_2_temp[j])
    curr_payoff_3_NoSS_3 <- append(curr_payoff_3_NoSS_3, curr_payoff_3_NoSS_3_temp[j])
    curr_payoff_3_NoSS_4 <- append(curr_payoff_3_NoSS_4, curr_payoff_3_NoSS_4_temp[j])
    curr_payoff_3_NoSS_5 <- append(curr_payoff_3_NoSS_5, curr_payoff_3_NoSS_5_temp[j])
    
    
    curr_payoff_3_2_NoSS_1 <- append(curr_payoff_3_2_NoSS_1, curr_payoff_3_2_NoSS_1_temp[j])
    curr_payoff_3_2_NoSS_2 <- append(curr_payoff_3_2_NoSS_2, curr_payoff_3_2_NoSS_2_temp[j])
    curr_payoff_3_2_NoSS_3 <- append(curr_payoff_3_2_NoSS_3, curr_payoff_3_2_NoSS_3_temp[j])
    curr_payoff_3_2_NoSS_4 <- append(curr_payoff_3_2_NoSS_4, curr_payoff_3_2_NoSS_4_temp[j])
    curr_payoff_3_2_NoSS_5 <- append(curr_payoff_3_2_NoSS_5, curr_payoff_3_2_NoSS_5_temp[j])
    
    
    prob_6_SS_1 <- append(prob_6_SS_1, prob_6_SS_1_temp[j])
    prob_6_SS_2 <- append(prob_6_SS_2, prob_6_SS_2_temp[j])
    prob_6_SS_3 <- append(prob_6_SS_3, prob_6_SS_3_temp[j])
    prob_6_SS_4 <- append(prob_6_SS_4, prob_6_SS_4_temp[j])
    prob_6_SS_5 <- append(prob_6_SS_5, prob_6_SS_5_temp[j])
    
    prob_6_SS <- append(prob_6_SS, prob_6_SS_temp[j])
    
    prob_6_2_SS_1 <- append(prob_6_2_SS_1, prob_6_2_SS_1_temp[j])
    prob_6_2_SS_2 <- append(prob_6_2_SS_2, prob_6_2_SS_2_temp[j])
    prob_6_2_SS_3 <- append(prob_6_2_SS_3, prob_6_2_SS_3_temp[j])
    prob_6_2_SS_4 <- append(prob_6_2_SS_4, prob_6_2_SS_4_temp[j])
    prob_6_2_SS_5 <- append(prob_6_2_SS_5, prob_6_2_SS_5_temp[j])
    
    bid_6_SS_1 <-append(bid_6_SS_1, bid_6_SS_1_temp[j])
    bid_6_SS_2 <-append(bid_6_SS_2, bid_6_SS_2_temp[j])
    bid_6_SS_3 <-append(bid_6_SS_3, bid_6_SS_3_temp[j])
    bid_6_SS_4 <-append(bid_6_SS_4, bid_6_SS_4_temp[j])
    bid_6_SS_5 <-append(bid_6_SS_5, bid_6_SS_5_temp[j])
    
    bid_6_SS <- append(bid_6_SS, bid_6_SS_temp[j])
    
    bid_6_2_SS_1 <-append(bid_6_2_SS_1, bid_6_2_SS_1_temp[j])
    bid_6_2_SS_2 <-append(bid_6_2_SS_2, bid_6_2_SS_2_temp[j])
    bid_6_2_SS_3 <-append(bid_6_2_SS_3, bid_6_2_SS_3_temp[j])
    bid_6_2_SS_4 <-append(bid_6_2_SS_4, bid_6_2_SS_4_temp[j])
    bid_6_2_SS_5 <-append(bid_6_2_SS_5, bid_6_2_SS_5_temp[j])
    
    
    bid_6_NoSS_1 <-append(bid_6_NoSS_1, bid_6_NoSS_1_temp[j])
    bid_6_NoSS_2 <-append(bid_6_NoSS_2, bid_6_NoSS_2_temp[j])
    bid_6_NoSS_3 <-append(bid_6_NoSS_3, bid_6_NoSS_3_temp[j])
    bid_6_NoSS_4 <-append(bid_6_NoSS_4, bid_6_NoSS_4_temp[j])
    bid_6_NoSS_5 <-append(bid_6_NoSS_5, bid_6_NoSS_5_temp[j])
    
    bid_6_NoSS <- append(bid_6_NoSS, bid_6_NoSS_temp[j])
    
    
    bid_6_2_NoSS_1 <-append(bid_6_2_NoSS_1, bid_6_2_NoSS_1_temp[j])
    bid_6_2_NoSS_2 <-append(bid_6_2_NoSS_2, bid_6_2_NoSS_2_temp[j])
    bid_6_2_NoSS_3 <-append(bid_6_2_NoSS_3, bid_6_2_NoSS_3_temp[j])
    bid_6_2_NoSS_4 <-append(bid_6_2_NoSS_4, bid_6_2_NoSS_4_temp[j])
    bid_6_2_NoSS_5 <-append(bid_6_2_NoSS_5, bid_6_2_NoSS_5_temp[j])
    
    
    
    
    
    guess_6_SS_1 <-append(guess_6_SS_1, guess_6_SS_1_temp[j])
    guess_6_SS_2 <-append(guess_6_SS_2, guess_6_SS_2_temp[j])
    guess_6_SS_3 <-append(guess_6_SS_3, guess_6_SS_3_temp[j])
    guess_6_SS_4 <-append(guess_6_SS_4, guess_6_SS_4_temp[j])
    guess_6_SS_5 <-append(guess_6_SS_5, guess_6_SS_5_temp[j])
    
    guess_6_SS <- append(guess_6_SS, guess_6_SS_temp[j])
    
    guess_6_2_SS_1 <-append(guess_6_2_SS_1, guess_6_2_SS_1_temp[j])
    guess_6_2_SS_2 <-append(guess_6_2_SS_2, guess_6_2_SS_2_temp[j])
    guess_6_2_SS_3 <-append(guess_6_2_SS_3, guess_6_2_SS_3_temp[j])
    guess_6_2_SS_4 <-append(guess_6_2_SS_4, guess_6_2_SS_4_temp[j])
    guess_6_2_SS_5 <-append(guess_6_2_SS_5, guess_6_2_SS_5_temp[j])
    
    
    guess_6_NoSS_1 <-append(guess_6_NoSS_1, guess_6_NoSS_1_temp[j])
    guess_6_NoSS_2 <-append(guess_6_NoSS_2, guess_6_NoSS_2_temp[j])
    guess_6_NoSS_3 <-append(guess_6_NoSS_3, guess_6_NoSS_3_temp[j])
    guess_6_NoSS_4 <-append(guess_6_NoSS_4, guess_6_NoSS_4_temp[j])
    guess_6_NoSS_5 <-append(guess_6_NoSS_5, guess_6_NoSS_5_temp[j])
    
    guess_6_NoSS <- append(guess_6_NoSS, guess_6_NoSS_temp[j])
    
    
    guess_6_2_NoSS_1 <-append(guess_6_2_NoSS_1, guess_6_2_NoSS_1_temp[j])
    guess_6_2_NoSS_2 <-append(guess_6_2_NoSS_2, guess_6_2_NoSS_2_temp[j])
    guess_6_2_NoSS_3 <-append(guess_6_2_NoSS_3, guess_6_2_NoSS_3_temp[j])
    guess_6_2_NoSS_4 <-append(guess_6_2_NoSS_4, guess_6_2_NoSS_4_temp[j])
    guess_6_2_NoSS_5 <-append(guess_6_2_NoSS_5, guess_6_2_NoSS_5_temp[j])
    
    
    
    
    discount_6_NoSS <- append(discount_6_NoSS, discount_6_NoSS_temp[j])
    
    curr_payoff_6_SS <- append(curr_payoff_6_SS, curr_payoff_6_SS_temp[j])
    curr_payoff_6_SS_1 <- append(curr_payoff_6_SS_1, curr_payoff_6_SS_1_temp[j])
    curr_payoff_6_SS_2 <- append(curr_payoff_6_SS_2, curr_payoff_6_SS_2_temp[j])
    curr_payoff_6_SS_3 <- append(curr_payoff_6_SS_3, curr_payoff_6_SS_3_temp[j])
    curr_payoff_6_SS_4 <- append(curr_payoff_6_SS_4, curr_payoff_6_SS_4_temp[j])
    curr_payoff_6_SS_5 <- append(curr_payoff_6_SS_5, curr_payoff_6_SS_5_temp[j])
    
    
    curr_payoff_6_NoSS <- append(curr_payoff_6_NoSS, curr_payoff_6_NoSS_temp[j])
    curr_payoff_6_NoSS_1 <- append(curr_payoff_6_NoSS_1, curr_payoff_6_NoSS_1_temp[j])
    curr_payoff_6_NoSS_2 <- append(curr_payoff_6_NoSS_2, curr_payoff_6_NoSS_2_temp[j])
    curr_payoff_6_NoSS_3 <- append(curr_payoff_6_NoSS_3, curr_payoff_6_NoSS_3_temp[j])
    curr_payoff_6_NoSS_4 <- append(curr_payoff_6_NoSS_4, curr_payoff_6_NoSS_4_temp[j])
    curr_payoff_6_NoSS_5 <- append(curr_payoff_6_NoSS_5, curr_payoff_6_NoSS_5_temp[j])
    
    curr_payoff_6_2_SS_1 <- append(curr_payoff_6_2_SS_1, curr_payoff_6_2_SS_1_temp[j])
    curr_payoff_6_2_SS_2 <- append(curr_payoff_6_2_SS_2, curr_payoff_6_2_SS_2_temp[j])
    curr_payoff_6_2_SS_3 <- append(curr_payoff_6_2_SS_3, curr_payoff_6_2_SS_3_temp[j])
    curr_payoff_6_2_SS_4 <- append(curr_payoff_6_2_SS_4, curr_payoff_6_2_SS_4_temp[j])
    curr_payoff_6_2_SS_5 <- append(curr_payoff_6_2_SS_5, curr_payoff_6_2_SS_5_temp[j])
    
    
    curr_payoff_6_2_NoSS_1 <- append(curr_payoff_6_2_NoSS_1, curr_payoff_6_2_NoSS_1_temp[j])
    curr_payoff_6_2_NoSS_2 <- append(curr_payoff_6_2_NoSS_2, curr_payoff_6_2_NoSS_2_temp[j])
    curr_payoff_6_2_NoSS_3 <- append(curr_payoff_6_2_NoSS_3, curr_payoff_6_2_NoSS_3_temp[j])
    curr_payoff_6_2_NoSS_4 <- append(curr_payoff_6_2_NoSS_4, curr_payoff_6_2_NoSS_4_temp[j])
    curr_payoff_6_2_NoSS_5 <- append(curr_payoff_6_2_NoSS_5, curr_payoff_6_2_NoSS_5_temp[j])
    
  }
}



# Part 4

# Part 4(a).  This is for the data where Superstars are not possible.

mean_guess_3of3growth_NoSS <- list()  # Average guessed payoffs for the subject for all rounds with 3 of 3 growth.
mean_guess_1of3growth_NoSS <- list()
mean_guess_0of3growth_NoSS <- list()

mean_guess_5of6growth_NoSS <- list()
mean_guess_4of6growth_NoSS <- list()
mean_guess_3of6growth_NoSS <- list()
mean_guess_2of6growth_NoSS <- list()
mean_guess_1of6growth_NoSS <- list()
mean_guess_0of6growth_NoSS <- list()

mean_bid_3of3growth_NoSS <- list()  # Average bids for the subject for all rounds with 3 of 3 growth.
mean_bid_1of3growth_NoSS <- list()
mean_bid_0of3growth_NoSS <- list()

mean_bid_5of6growth_NoSS <- list()
mean_bid_4of6growth_NoSS <- list()
mean_bid_3of6growth_NoSS <- list()
mean_bid_2of6growth_NoSS <- list()
mean_bid_1of6growth_NoSS <- list()
mean_bid_0of6growth_NoSS <- list()


median_guess_3of3growth_NoSS <- list()
median_guess_1of3growth_NoSS <- list()
median_guess_0of3growth_NoSS <- list()

median_guess_5of6growth_NoSS <- list()
median_guess_4of6growth_NoSS <- list()
median_guess_3of6growth_NoSS <- list()
median_guess_2of6growth_NoSS <- list()
median_guess_1of6growth_NoSS <- list()
median_guess_0of6growth_NoSS <- list()

median_bid_3of3growth_NoSS <- list()
median_bid_1of3growth_NoSS <- list()
median_bid_0of3growth_NoSS <- list()

median_bid_5of6growth_NoSS <- list()
median_bid_4of6growth_NoSS <- list()
median_bid_3of6growth_NoSS <- list()
median_bid_2of6growth_NoSS <- list()
median_bid_1of6growth_NoSS <- list()
median_bid_0of6growth_NoSS <- list()

for (i in 1:length(guess_3_NoSS_1)){
  
  # This block of code is for 3 of 3 growth (3 up and 0 down has current payoff at 13)
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_NoSS_1[[i]] == 13){
    guess_temp <- append(guess_temp, guess_3_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_NoSS_1[[i]])
  }
  if(curr_payoff_3_NoSS_2[[i]] == 13){
    guess_temp <- append(guess_temp, guess_3_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_NoSS_2[[i]])
  }
  if(curr_payoff_3_NoSS_3[[i]] == 13){
    guess_temp <- append(guess_temp, guess_3_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_NoSS_3[[i]])
  }
  if(curr_payoff_3_NoSS_4[[i]] == 13){
    guess_temp <- append(guess_temp, guess_3_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_NoSS_4[[i]])
  }
  if(curr_payoff_3_NoSS_5[[i]] == 13){
    guess_temp <- append(guess_temp, guess_3_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_guess_3of3growth_NoSS <- append(mean_guess_3of3growth_NoSS, avg_guess)
  mean_bid_3of3growth_NoSS <- append(mean_bid_3of3growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_3of3growth_NoSS <- append(median_guess_3of3growth_NoSS, median_guess)
  median_bid_3of3growth_NoSS <- append(median_bid_3of3growth_NoSS, median_bid)
  
  
  
  # This block of code is for 1 of 3 growth (1 up and 2 down has current payoff at 9)
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_2_NoSS_1[[i]] == 9){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_1[[i]])
  }
  if(curr_payoff_3_2_NoSS_2[[i]] == 9){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_2[[i]])
  }
  if(curr_payoff_3_2_NoSS_3[[i]] == 9){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_3[[i]])
  }
  if(curr_payoff_3_2_NoSS_4[[i]] == 9){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_4[[i]])
  }
  if(curr_payoff_3_2_NoSS_5[[i]] == 9){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_1of3growth_NoSS <- append(mean_guess_1of3growth_NoSS, avg_guess)
  mean_bid_1of3growth_NoSS <- append(mean_bid_1of3growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_1of3growth_NoSS <- append(median_guess_1of3growth_NoSS, median_guess)
  median_bid_1of3growth_NoSS <- append(median_bid_1of3growth_NoSS, median_bid)
  

  # This block of code is for 0 of 3 growth (0 up and 3 down has current payoff at 7)
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_2_NoSS_1[[i]] == 7){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_1[[i]])
  }
  if(curr_payoff_3_2_NoSS_2[[i]] == 7){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_2[[i]])
  }
  if(curr_payoff_3_2_NoSS_3[[i]] == 7){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_3[[i]])
  }
  if(curr_payoff_3_2_NoSS_4[[i]] == 7){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_4[[i]])
  }
  if(curr_payoff_3_2_NoSS_5[[i]] == 7){
    guess_temp <- append(guess_temp, guess_3_2_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_2_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_0of3growth_NoSS <- append(mean_guess_0of3growth_NoSS, avg_guess)
  mean_bid_0of3growth_NoSS <- append(mean_bid_0of3growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_0of3growth_NoSS <- append(median_guess_0of3growth_NoSS, median_guess)
  median_bid_0of3growth_NoSS <- append(median_bid_0of3growth_NoSS, median_bid)  
    
  
  # This block of code is for 5 of 6 growth (5 up and 1 down has current payoff at 14)
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_NoSS_1[[i]] == 14){
    guess_temp <- append(guess_temp, guess_6_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_1[[i]])
  }
  if(curr_payoff_6_NoSS_2[[i]] == 14){
    guess_temp <- append(guess_temp, guess_6_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_2[[i]])
  }
  if(curr_payoff_6_NoSS_3[[i]] == 14){
    guess_temp <- append(guess_temp, guess_6_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_3[[i]])
  }
  if(curr_payoff_6_NoSS_4[[i]] == 14){
    guess_temp <- append(guess_temp, guess_6_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_4[[i]])
  }
  if(curr_payoff_6_NoSS_5[[i]] == 14){
    guess_temp <- append(guess_temp, guess_6_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_5[[i]])
  }

  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_5of6growth_NoSS <- append(mean_guess_5of6growth_NoSS, avg_guess)
  mean_bid_5of6growth_NoSS <- append(mean_bid_5of6growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_5of6growth_NoSS <- append(median_guess_5of6growth_NoSS, median_guess)
  median_bid_5of6growth_NoSS <- append(median_bid_5of6growth_NoSS, median_bid)
  
  
  
  
  # This block of code is for 4 of 6 growth (4 up and 2 down has current payoff at 12)
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_NoSS_1[[i]] == 12){
    guess_temp <- append(guess_temp, guess_6_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_1[[i]])
  }
  if(curr_payoff_6_NoSS_2[[i]] == 12){
    guess_temp <- append(guess_temp, guess_6_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_2[[i]])
  }
  if(curr_payoff_6_NoSS_3[[i]] == 12){
    guess_temp <- append(guess_temp, guess_6_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_3[[i]])
  }
  if(curr_payoff_6_NoSS_4[[i]] == 12){
    guess_temp <- append(guess_temp, guess_6_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_4[[i]])
  }
  if(curr_payoff_6_NoSS_5[[i]] == 12){
    guess_temp <- append(guess_temp, guess_6_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_4of6growth_NoSS <- append(mean_guess_4of6growth_NoSS, avg_guess)
  mean_bid_4of6growth_NoSS <- append(mean_bid_4of6growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_4of6growth_NoSS <- append(median_guess_4of6growth_NoSS, median_guess)
  median_bid_4of6growth_NoSS <- append(median_bid_4of6growth_NoSS, median_bid)  
  
  
  # This block of code is for 3 of 6 growth (3 up and 3 down has current payoff at 10)
  # This could occur in either the first or second asset, therefore we have _2 in some of the variable name.
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_NoSS_1[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_1[[i]])
  }
  if(curr_payoff_6_2_NoSS_2[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_2[[i]])
  }
  if(curr_payoff_6_2_NoSS_3[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_3[[i]])
  }
  if(curr_payoff_6_2_NoSS_4[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_4[[i]])
  }
  if(curr_payoff_6_2_NoSS_5[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_5[[i]])
  }
  
  if(curr_payoff_6_NoSS_1[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_1[[i]])
  }
  if(curr_payoff_6_NoSS_2[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_2[[i]])
  }
  if(curr_payoff_6_NoSS_3[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_3[[i]])
  }
  if(curr_payoff_6_NoSS_4[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_4[[i]])
  }
  if(curr_payoff_6_NoSS_5[[i]] == 10){
    guess_temp <- append(guess_temp, guess_6_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_3of6growth_NoSS <- append(mean_guess_3of6growth_NoSS, avg_guess)
  mean_bid_3of6growth_NoSS <- append(mean_bid_3of6growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_3of6growth_NoSS <- append(median_guess_3of6growth_NoSS, median_guess)
  median_bid_3of6growth_NoSS <- append(median_bid_3of6growth_NoSS, median_bid)
  
  # This block of code is for 2 of 6 growth (2 up and 4 down has current payoff at 8)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_NoSS_1[[i]] == 8){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_1[[i]])
  }
  if(curr_payoff_6_2_NoSS_2[[i]] == 8){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_2[[i]])
  }
  if(curr_payoff_6_2_NoSS_3[[i]] == 8){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_3[[i]])
  }
  if(curr_payoff_6_2_NoSS_4[[i]] == 8){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_4[[i]])
  }
  if(curr_payoff_6_2_NoSS_5[[i]] == 8){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_2of6growth_NoSS <- append(mean_guess_2of6growth_NoSS, avg_guess)
  mean_bid_2of6growth_NoSS <- append(mean_bid_2of6growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_2of6growth_NoSS <- append(median_guess_2of6growth_NoSS, median_guess)
  median_bid_2of6growth_NoSS <- append(median_bid_2of6growth_NoSS, median_bid)
  
  
  
  # This block of code is for 1 of 6 growth (1 up and 5 down has current payoff at 6)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_NoSS_1[[i]] == 6){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_1[[i]])
  }
  if(curr_payoff_6_2_NoSS_2[[i]] == 6){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_2[[i]])
  }
  if(curr_payoff_6_2_NoSS_3[[i]] == 6){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_3[[i]])
  }
  if(curr_payoff_6_2_NoSS_4[[i]] == 6){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_4[[i]])
  }
  if(curr_payoff_6_2_NoSS_5[[i]] == 6){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_1of6growth_NoSS <- append(mean_guess_1of6growth_NoSS, avg_guess)
  mean_bid_1of6growth_NoSS <- append(mean_bid_1of6growth_NoSS, avg_bid)
 
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_1of6growth_NoSS <- append(median_guess_1of6growth_NoSS, median_guess)
  median_bid_1of6growth_NoSS <- append(median_bid_1of6growth_NoSS, median_bid)
  
  # This block of code is for 0 of 6 growth (0 up and 6 down has current payoff at 4)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_NoSS_1[[i]] == 4){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_1[[i]])
  }
  if(curr_payoff_6_2_NoSS_2[[i]] == 4){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_2[[i]])
  }
  if(curr_payoff_6_2_NoSS_3[[i]] == 4){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_3[[i]])
  }
  if(curr_payoff_6_2_NoSS_4[[i]] == 4){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_4[[i]])
  }
  if(curr_payoff_6_2_NoSS_5[[i]] == 4){
    guess_temp <- append(guess_temp, guess_6_2_NoSS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_NoSS_5[[i]])
  }
  
  avg_guess <- mean(unlist(guess_temp), na.rm = T)
  avg_bid <- mean(unlist(bid_temp), na.rm = T)
  mean_guess_0of6growth_NoSS <- append(mean_guess_0of6growth_NoSS, avg_guess)
  mean_bid_0of6growth_NoSS <- append(mean_bid_0of6growth_NoSS, avg_bid)
  
  median_guess <- median(unlist(guess_temp), na.rm = T)
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_guess_0of6growth_NoSS <- append(median_guess_0of6growth_NoSS, median_guess)
  median_bid_0of6growth_NoSS <- append(median_bid_0of6growth_NoSS, median_bid)
  
}



# Part 4(b).  This is for the data where Superstars ARE possible.

mean_prob_3of3growth_SS <- list()  # Average probability guesses for the subject for all rounds with 3 of 3 growth.
mean_prob_2of3growth_SS <- list()
mean_prob_1of3growth_SS <- list()
mean_prob_0of3growth_SS <- list()

mean_prob_4of4growth_SS <- list()
mean_prob_3of4growth_SS <- list()
mean_prob_2of4growth_SS <- list()

mean_prob_5of5growth_SS <- list()
mean_prob_4of5growth_SS <- list()
mean_prob_3of5growth_SS <- list()

mean_prob_6of6growth_SS <- list()
mean_prob_5of6growth_SS <- list()
mean_prob_4of6growth_SS <- list()
mean_prob_3of6growth_SS <- list()
mean_prob_2of6growth_SS <- list()
mean_prob_1of6growth_SS <- list()
mean_prob_0of6growth_SS <- list()



mean_guess_3of3growth_SS <- list()  # Average guessed payoffs for the subject for all rounds with 3 of 3 growth.
mean_guess_2of3growth_SS <- list()
mean_guess_1of3growth_SS <- list()
mean_guess_0of3growth_SS <- list()

mean_guess_6of6growth_SS <- list()
mean_guess_5of6growth_SS <- list()
mean_guess_4of6growth_SS <- list()
mean_guess_3of6growth_SS <- list()
mean_guess_2of6growth_SS <- list()
mean_guess_1of6growth_SS <- list()
mean_guess_0of6growth_SS <- list()

mean_bid_3of3growth_SS <- list()  # Average bids for the subject for all rounds with 3 of 3 growth.
mean_bid_2of3growth_SS <- list()
mean_bid_1of3growth_SS <- list()
mean_bid_0of3growth_SS <- list()

mean_bid_6of6growth_SS <- list()
mean_bid_5of6growth_SS <- list()
mean_bid_4of6growth_SS <- list()
mean_bid_3of6growth_SS <- list()
mean_bid_2of6growth_SS <- list()
mean_bid_1of6growth_SS <- list()
mean_bid_0of6growth_SS <- list()

median_prob_3of3growth_SS <- list()  # Average probability guesses for the subject for all rounds with 3 of 3 growth.
median_prob_2of3growth_SS <- list()
median_prob_1of3growth_SS <- list()
median_prob_0of3growth_SS <- list()

median_prob_4of4growth_SS <- list()
median_prob_3of4growth_SS <- list()
median_prob_2of4growth_SS <- list()

median_prob_5of5growth_SS <- list()
median_prob_4of5growth_SS <- list()
median_prob_3of5growth_SS <- list()

median_prob_6of6growth_SS <- list()
median_prob_5of6growth_SS <- list()
median_prob_4of6growth_SS <- list()
median_prob_3of6growth_SS <- list()
median_prob_2of6growth_SS <- list()
median_prob_1of6growth_SS <- list()
median_prob_0of6growth_SS <- list()


median_guess_3of3growth_SS <- list()
median_guess_2of3growth_SS <- list()
median_guess_1of3growth_SS <- list()
median_guess_0of3growth_SS <- list()

median_guess_6of6growth_SS <- list()
median_guess_5of6growth_SS <- list()
median_guess_4of6growth_SS <- list()
median_guess_3of6growth_SS <- list()
median_guess_2of6growth_SS <- list()
median_guess_1of6growth_SS <- list()
median_guess_0of6growth_SS <- list()

median_bid_3of3growth_SS <- list()
median_bid_2of3growth_SS <- list()
median_bid_1of3growth_SS <- list()
median_bid_0of3growth_SS <- list()

median_bid_6of6growth_SS <- list()
median_bid_5of6growth_SS <- list()
median_bid_4of6growth_SS <- list()
median_bid_3of6growth_SS <- list()
median_bid_2of6growth_SS <- list()
median_bid_1of6growth_SS <- list()
median_bid_0of6growth_SS <- list()

# This for loop is for answers given after periods 3 and 6.  All subjects answered these questions.
for (i in 1:length(guess_3_SS_1)){
  
  # This block of code is for 3 of 3 growth (3 up and 0 down has current payoff at 13)
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_SS_1[[i]] == 13){
    prob_temp <- append(prob_temp, prob_3_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_1[[i]])
  }
  if(curr_payoff_3_SS_2[[i]] == 13){
    prob_temp <- append(prob_temp, prob_3_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_2[[i]])
  }
  if(curr_payoff_3_SS_3[[i]] == 13){
    prob_temp <- append(prob_temp, prob_3_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_3[[i]])
  }
  if(curr_payoff_3_SS_4[[i]] == 13){
    prob_temp <- append(prob_temp, prob_3_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_4[[i]])
  }
  if(curr_payoff_3_SS_5[[i]] == 13){
    prob_temp <- append(prob_temp, prob_3_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_3of3growth_SS <- append(mean_prob_3of3growth_SS, avg_prob)
  mean_guess_3of3growth_SS <- append(mean_guess_3of3growth_SS, avg_guess)
  mean_bid_3of3growth_SS <- append(mean_bid_3of3growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_3of3growth_SS <- append(median_prob_3of3growth_SS, median_prob)
  median_guess_3of3growth_SS <- append(median_guess_3of3growth_SS, median_guess)
  median_bid_3of3growth_SS <- append(median_bid_3of3growth_SS, median_bid)
  
  
  # This block of code is for 2 of 3 growth (2 up and 1 down has current payoff at 11)
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_SS_1[[i]] == 11){
    prob_temp <- append(prob_temp, prob_3_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_1[[i]])
  }
  if(curr_payoff_3_SS_2[[i]] == 11){
    prob_temp <- append(prob_temp, prob_3_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_2[[i]])
  }
  if(curr_payoff_3_SS_3[[i]] == 11){
    prob_temp <- append(prob_temp, prob_3_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_3[[i]])
  }
  if(curr_payoff_3_SS_4[[i]] == 11){
    prob_temp <- append(prob_temp, prob_3_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_4[[i]])
  }
  if(curr_payoff_3_SS_5[[i]] == 11){
    prob_temp <- append(prob_temp, prob_3_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_3_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_2of3growth_SS <- append(mean_prob_2of3growth_SS, avg_prob)
  mean_guess_2of3growth_SS <- append(mean_guess_2of3growth_SS, avg_guess)
  mean_bid_2of3growth_SS <- append(mean_bid_2of3growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_2of3growth_SS <- append(median_prob_2of3growth_SS, median_prob)
  median_guess_2of3growth_SS <- append(median_guess_2of3growth_SS, median_guess)
  median_bid_2of3growth_SS <- append(median_bid_2of3growth_SS, median_bid)
  
  
  
  # This block of code is for 1 of 3 growth (1 up and 2 down has current payoff at 9)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_2_SS_1[[i]] == 9){
    prob_temp <- append(prob_temp, prob_3_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_1[[i]])
  }
  if(curr_payoff_3_2_SS_2[[i]] == 9){
    prob_temp <- append(prob_temp, prob_3_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_2[[i]])
  }
  if(curr_payoff_3_2_SS_3[[i]] == 9){
    prob_temp <- append(prob_temp, prob_3_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_3[[i]])
  }
  if(curr_payoff_3_2_SS_4[[i]] == 9){
    prob_temp <- append(prob_temp, prob_3_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_4[[i]])
  }
  if(curr_payoff_3_2_SS_5[[i]] == 9){
    prob_temp <- append(prob_temp, prob_3_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_1of3growth_SS <- append(mean_prob_1of3growth_SS, avg_prob)
  mean_guess_1of3growth_SS <- append(mean_guess_1of3growth_SS, avg_guess)
  mean_bid_1of3growth_SS <- append(mean_bid_1of3growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_1of3growth_SS <- append(median_prob_1of3growth_SS, median_prob)
  median_guess_1of3growth_SS <- append(median_guess_1of3growth_SS, median_guess)
  median_bid_1of3growth_SS <- append(median_bid_1of3growth_SS, median_bid)
  
  # This block of code is for 0 of 3 growth (0 up and 3 down has current payoff at 7)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_3_2_SS_1[[i]] == 7){
    prob_temp <- append(prob_temp, prob_3_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_1[[i]])
  }
  if(curr_payoff_3_2_SS_2[[i]] == 7){
    prob_temp <- append(prob_temp, prob_3_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_2[[i]])
  }
  if(curr_payoff_3_2_SS_3[[i]] == 7){
    prob_temp <- append(prob_temp, prob_3_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_3[[i]])
  }
  if(curr_payoff_3_2_SS_4[[i]] == 7){
    prob_temp <- append(prob_temp, prob_3_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_4[[i]])
  }
  if(curr_payoff_3_2_SS_5[[i]] == 7){
    prob_temp <- append(prob_temp, prob_3_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_3_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_3_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_0of3growth_SS <- append(mean_prob_0of3growth_SS, avg_prob)
  mean_guess_0of3growth_SS <- append(mean_guess_0of3growth_SS, avg_guess)
  mean_bid_0of3growth_SS <- append(mean_bid_0of3growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_0of3growth_SS <- append(median_prob_0of3growth_SS, median_prob)
  median_guess_0of3growth_SS <- append(median_guess_0of3growth_SS, median_guess)
  median_bid_0of3growth_SS <- append(median_bid_0of3growth_SS, median_bid)
  
  # This block of code is for 6 of 6 growth (6 up and 0 down has current payoff at 16)

  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_SS_1[[i]] == 16){
    prob_temp <- append(prob_temp, prob_6_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_1[[i]])
  }
  if(curr_payoff_6_SS_2[[i]] == 16){
    prob_temp <- append(prob_temp, prob_6_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_2[[i]])
  }
  if(curr_payoff_6_SS_3[[i]] == 16){
    prob_temp <- append(prob_temp, prob_6_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_3[[i]])
  }
  if(curr_payoff_6_SS_4[[i]] == 16){
    prob_temp <- append(prob_temp, prob_6_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_4[[i]])
  }
  if(curr_payoff_6_SS_5[[i]] == 16){
    prob_temp <- append(prob_temp, prob_6_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_6of6growth_SS <- append(mean_prob_6of6growth_SS, avg_prob)
  mean_guess_6of6growth_SS <- append(mean_guess_6of6growth_SS, avg_guess)
  mean_bid_6of6growth_SS <- append(mean_bid_6of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_6of6growth_SS <- append(median_prob_6of6growth_SS, median_prob)
  median_guess_6of6growth_SS <- append(median_guess_6of6growth_SS, median_guess)
  median_bid_6of6growth_SS <- append(median_bid_6of6growth_SS, median_bid)
  
  
  # This block of code is for 5 of 6 growth (5 up and 1 down has current payoff at 14)
 
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_SS_1[[i]] == 14){
    prob_temp <- append(prob_temp, prob_6_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_1[[i]])
  }
  if(curr_payoff_6_SS_2[[i]] == 14){
    prob_temp <- append(prob_temp, prob_6_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_2[[i]])
  }
  if(curr_payoff_6_SS_3[[i]] == 14){
    prob_temp <- append(prob_temp, prob_6_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_3[[i]])
  }
  if(curr_payoff_6_SS_4[[i]] == 14){
    prob_temp <- append(prob_temp, prob_6_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_4[[i]])
  }
  if(curr_payoff_6_SS_5[[i]] == 14){
    prob_temp <- append(prob_temp, prob_6_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_5of6growth_SS <- append(mean_prob_5of6growth_SS, avg_prob)
  mean_guess_5of6growth_SS <- append(mean_guess_5of6growth_SS, avg_guess)
  mean_bid_5of6growth_SS <- append(mean_bid_5of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_5of6growth_SS <- append(median_prob_5of6growth_SS, median_prob)
  median_guess_5of6growth_SS <- append(median_guess_5of6growth_SS, median_guess)
  median_bid_5of6growth_SS <- append(median_bid_5of6growth_SS, median_bid)
  
   

  # This block of code is for 4 of 6 growth (4 up and 2 down has current payoff at 12)
  # This hasn't happened in the first 2 batches. We are assuming that if it does happen, it happens for asset 2.
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_SS_1[[i]] == 12){
    prob_temp <- append(prob_temp, prob_6_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_1[[i]])
  }
  if(curr_payoff_6_2_SS_2[[i]] == 12){
    prob_temp <- append(prob_temp, prob_6_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_2[[i]])
  }
  if(curr_payoff_6_2_SS_3[[i]] == 12){
    prob_temp <- append(prob_temp, prob_6_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_3[[i]])
  }
  if(curr_payoff_6_2_SS_4[[i]] == 12){
    prob_temp <- append(prob_temp, prob_6_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_4[[i]])
  }
  if(curr_payoff_6_2_SS_5[[i]] == 12){
    prob_temp <- append(prob_temp, prob_6_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_4of6growth_SS <- append(mean_prob_4of6growth_SS, avg_prob)
  mean_guess_4of6growth_SS <- append(mean_guess_4of6growth_SS, avg_guess)
  mean_bid_4of6growth_SS <- append(mean_bid_4of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_4of6growth_SS <- append(median_prob_4of6growth_SS, median_prob)
  median_guess_4of6growth_SS <- append(median_guess_4of6growth_SS, median_guess)
  median_bid_4of6growth_SS <- append(median_bid_4of6growth_SS, median_bid)  
  
  
  
  
  # This block of code is for 3 of 6 growth (3 up and 3 down has current payoff at 10)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_SS_1[[i]] == 10){
    prob_temp <- append(prob_temp, prob_6_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_1[[i]])
  }
  if(curr_payoff_6_2_SS_2[[i]] == 10){
    prob_temp <- append(prob_temp, prob_6_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_2[[i]])
  }
  if(curr_payoff_6_2_SS_3[[i]] == 10){
    prob_temp <- append(prob_temp, prob_6_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_3[[i]])
  }
  if(curr_payoff_6_2_SS_4[[i]] == 10){
    prob_temp <- append(prob_temp, prob_6_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_4[[i]])
  }
  if(curr_payoff_6_2_SS_5[[i]] == 10){
    prob_temp <- append(prob_temp, prob_6_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_3of6growth_SS <- append(mean_prob_3of6growth_SS, avg_prob)
  mean_guess_3of6growth_SS <- append(mean_guess_3of6growth_SS, avg_guess)
  mean_bid_3of6growth_SS <- append(mean_bid_3of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_3of6growth_SS <- append(median_prob_3of6growth_SS, median_prob)
  median_guess_3of6growth_SS <- append(median_guess_3of6growth_SS, median_guess)
  median_bid_3of6growth_SS <- append(median_bid_3of6growth_SS, median_bid)  
  
  
  
  # This block of code is for 2 of 6 growth (2 up and 4 down has current payoff at 8)
  # This occurs in the second asset, therefore we have _2 in the variable name.

  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_SS_1[[i]] == 8){
    prob_temp <- append(prob_temp, prob_6_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_1[[i]])
  }
  if(curr_payoff_6_2_SS_2[[i]] == 8){
    prob_temp <- append(prob_temp, prob_6_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_2[[i]])
  }
  if(curr_payoff_6_2_SS_3[[i]] == 8){
    prob_temp <- append(prob_temp, prob_6_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_3[[i]])
  }
  if(curr_payoff_6_2_SS_4[[i]] == 8){
    prob_temp <- append(prob_temp, prob_6_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_4[[i]])
  }
  if(curr_payoff_6_2_SS_5[[i]] == 8){
    prob_temp <- append(prob_temp, prob_6_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_2of6growth_SS <- append(mean_prob_2of6growth_SS, avg_prob)
  mean_guess_2of6growth_SS <- append(mean_guess_2of6growth_SS, avg_guess)
  mean_bid_2of6growth_SS <- append(mean_bid_2of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_2of6growth_SS <- append(median_prob_2of6growth_SS, median_prob)
  median_guess_2of6growth_SS <- append(median_guess_2of6growth_SS, median_guess)
  median_bid_2of6growth_SS <- append(median_bid_2of6growth_SS, median_bid)  
  
  
  
  # This block of code is for 1 of 6 growth (1 up and 5 down has current payoff at 6)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_SS_1[[i]] == 6){
    prob_temp <- append(prob_temp, prob_6_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_1[[i]])
  }
  if(curr_payoff_6_2_SS_2[[i]] == 6){
    prob_temp <- append(prob_temp, prob_6_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_2[[i]])
  }
  if(curr_payoff_6_2_SS_3[[i]] == 6){
    prob_temp <- append(prob_temp, prob_6_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_3[[i]])
  }
  if(curr_payoff_6_2_SS_4[[i]] == 6){
    prob_temp <- append(prob_temp, prob_6_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_4[[i]])
  }
  if(curr_payoff_6_2_SS_5[[i]] == 6){
    prob_temp <- append(prob_temp, prob_6_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_1of6growth_SS <- append(mean_prob_1of6growth_SS, avg_prob)
  mean_guess_1of6growth_SS <- append(mean_guess_1of6growth_SS, avg_guess)
  mean_bid_1of6growth_SS <- append(mean_bid_1of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_1of6growth_SS <- append(median_prob_1of6growth_SS, median_prob)
  median_guess_1of6growth_SS <- append(median_guess_1of6growth_SS, median_guess)
  median_bid_1of6growth_SS <- append(median_bid_1of6growth_SS, median_bid)
  

  # This block of code is for 0 of 6 growth (0 up and 6 down has current payoff at 4)
  # This occurs in the second asset, therefore we have _2 in the variable name.
  
  prob_temp <- list()
  guess_temp <- list()
  bid_temp <- list()
  
  if(curr_payoff_6_2_SS_1[[i]] == 4){
    prob_temp <- append(prob_temp, prob_6_2_SS_1[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_1[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_1[[i]])
  }
  if(curr_payoff_6_2_SS_2[[i]] == 4){
    prob_temp <- append(prob_temp, prob_6_2_SS_2[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_2[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_2[[i]])
  }
  if(curr_payoff_6_2_SS_3[[i]] == 4){
    prob_temp <- append(prob_temp, prob_6_2_SS_3[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_3[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_3[[i]])
  }
  if(curr_payoff_6_2_SS_4[[i]] == 4){
    prob_temp <- append(prob_temp, prob_6_2_SS_4[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_4[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_4[[i]])
  }
  if(curr_payoff_6_2_SS_5[[i]] == 4){
    prob_temp <- append(prob_temp, prob_6_2_SS_5[[i]])
    guess_temp <- append(guess_temp, guess_6_2_SS_5[[i]])
    bid_temp <- append(bid_temp, bid_6_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  avg_guess <- mean(unlist(guess_temp), na.rm = T) 
  avg_bid <- mean(unlist(bid_temp), na.rm = T) 
  mean_prob_0of6growth_SS <- append(mean_prob_0of6growth_SS, avg_prob)
  mean_guess_0of6growth_SS <- append(mean_guess_0of6growth_SS, avg_guess)
  mean_bid_0of6growth_SS <- append(mean_bid_0of6growth_SS, avg_bid)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_guess <- median(unlist(guess_temp), na.rm = T) 
  median_bid <- median(unlist(bid_temp), na.rm = T)
  median_prob_0of6growth_SS <- append(median_prob_0of6growth_SS, median_prob)
  median_guess_0of6growth_SS <- append(median_guess_0of6growth_SS, median_guess)
  median_bid_0of6growth_SS <- append(median_bid_0of6growth_SS, median_bid)
  

}


# This for loop is for periods 4 and 5.  Only some subjects answered these questions.

for(i in 1:length(curr_payoff_4_SS_1)){
  
  # This block of code is for 4 of 4 growth (4 up and 0 down has current payoff at 14)
  
  prob_temp <- list()
  
  if(curr_payoff_4_SS_1[[i]] == 14){
    prob_temp <- append(prob_temp, prob_4_SS_1[[i]])
  }
  if(curr_payoff_4_SS_2[[i]] == 14){
    prob_temp <- append(prob_temp, prob_4_SS_2[[i]])
  }
  if(curr_payoff_4_SS_3[[i]] == 14){
    prob_temp <- append(prob_temp, prob_4_SS_3[[i]])
  }
  if(curr_payoff_4_SS_4[[i]] == 14){
    prob_temp <- append(prob_temp, prob_4_SS_4[[i]])
  }
  if(curr_payoff_4_SS_5[[i]] == 14){
    prob_temp <- append(prob_temp, prob_4_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  mean_prob_4of4growth_SS <- append(mean_prob_4of4growth_SS, avg_prob)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_prob_4of4growth_SS <- append(median_prob_4of4growth_SS, median_prob)
  
  # This block of code is for 3 of 4 growth (3 up and 1 down has current payoff at 12)
  # This could happen with either asset 1 or asset 2.
  
  prob_temp <- list()
  
  if(curr_payoff_4_SS_1[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_SS_1[[i]])
  }
  if(curr_payoff_4_SS_2[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_SS_2[[i]])
  }
  if(curr_payoff_4_SS_3[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_SS_3[[i]])
  }
  if(curr_payoff_4_SS_4[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_SS_4[[i]])
  }
  if(curr_payoff_4_SS_5[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_SS_5[[i]])
  }
  
  if(curr_payoff_4_2_SS_1[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_2_SS_1[[i]])
  }
  if(curr_payoff_4_2_SS_2[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_2_SS_2[[i]])
  }
  if(curr_payoff_4_2_SS_3[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_2_SS_3[[i]])
  }
  if(curr_payoff_4_2_SS_4[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_2_SS_4[[i]])
  }
  if(curr_payoff_4_2_SS_5[[i]] == 12){
    prob_temp <- append(prob_temp, prob_4_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  mean_prob_3of4growth_SS <- append(mean_prob_3of4growth_SS, avg_prob)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_prob_3of4growth_SS <- append(median_prob_3of4growth_SS, median_prob)
  
  # This block of code is for 2 of 4 growth (2 up and 2 down has current payoff at 10)
  # This happens with asset 2, so variables are labeled with _2.
  
  prob_temp <- list()
  
  if(curr_payoff_4_2_SS_1[[i]] == 10){
    prob_temp <- append(prob_temp, prob_4_2_SS_1[[i]])
  }
  if(curr_payoff_4_2_SS_2[[i]] == 10){
    prob_temp <- append(prob_temp, prob_4_2_SS_2[[i]])
  }
  if(curr_payoff_4_2_SS_3[[i]] == 10){
    prob_temp <- append(prob_temp, prob_4_2_SS_3[[i]])
  }
  if(curr_payoff_4_2_SS_4[[i]] == 10){
    prob_temp <- append(prob_temp, prob_4_2_SS_4[[i]])
  }
  if(curr_payoff_4_2_SS_5[[i]] == 10){
    prob_temp <- append(prob_temp, prob_4_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  mean_prob_2of4growth_SS <- append(mean_prob_2of4growth_SS, avg_prob)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_prob_2of4growth_SS <- append(median_prob_2of4growth_SS, median_prob)
  
  
  # This block of code is for 5 of 5 growth (5 up and 0 down has current payoff at 15)
  
  prob_temp <- list()
  
  if(curr_payoff_5_SS_1[[i]] == 15){
    prob_temp <- append(prob_temp, prob_5_SS_1[[i]])
  }
  if(curr_payoff_5_SS_2[[i]] == 15){
    prob_temp <- append(prob_temp, prob_5_SS_2[[i]])
  }
  if(curr_payoff_5_SS_3[[i]] == 15){
    prob_temp <- append(prob_temp, prob_5_SS_3[[i]])
  }
  if(curr_payoff_5_SS_4[[i]] == 15){
    prob_temp <- append(prob_temp, prob_5_SS_4[[i]])
  }
  if(curr_payoff_5_SS_5[[i]] == 15){
    prob_temp <- append(prob_temp, prob_5_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  mean_prob_5of5growth_SS <- append(mean_prob_5of5growth_SS, avg_prob)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_prob_5of5growth_SS <- append(median_prob_5of5growth_SS, median_prob)
  
  # This block of code is for 4 of 5 growth (4 up and 1 down has current payoff at 13)
  # This could happen with either asset 1 or asset 2.
  
  prob_temp <- list()
  
  if(curr_payoff_5_SS_1[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_SS_1[[i]])
  }
  if(curr_payoff_5_SS_2[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_SS_2[[i]])
  }
  if(curr_payoff_5_SS_3[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_SS_3[[i]])
  }
  if(curr_payoff_5_SS_4[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_SS_4[[i]])
  }
  if(curr_payoff_5_SS_5[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_SS_5[[i]])
  }
  
  if(curr_payoff_5_2_SS_1[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_2_SS_1[[i]])
  }
  if(curr_payoff_5_2_SS_2[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_2_SS_2[[i]])
  }
  if(curr_payoff_5_2_SS_3[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_2_SS_3[[i]])
  }
  if(curr_payoff_5_2_SS_4[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_2_SS_4[[i]])
  }
  if(curr_payoff_5_2_SS_5[[i]] == 13){
    prob_temp <- append(prob_temp, prob_5_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  mean_prob_4of5growth_SS <- append(mean_prob_4of5growth_SS, avg_prob)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_prob_4of5growth_SS <- append(median_prob_4of5growth_SS, median_prob)
  
  # This block of code is for 3 of 5 growth (3 up and 2 down has current payoff at 11)
  # This happens with asset 2, so variables are labeled with _2.
  
  prob_temp <- list()
  
  if(curr_payoff_5_2_SS_1[[i]] == 11){
    prob_temp <- append(prob_temp, prob_5_2_SS_1[[i]])
  }
  if(curr_payoff_5_2_SS_2[[i]] == 11){
    prob_temp <- append(prob_temp, prob_5_2_SS_2[[i]])
  }
  if(curr_payoff_5_2_SS_3[[i]] == 11){
    prob_temp <- append(prob_temp, prob_5_2_SS_3[[i]])
  }
  if(curr_payoff_5_2_SS_4[[i]] == 11){
    prob_temp <- append(prob_temp, prob_5_2_SS_4[[i]])
  }
  if(curr_payoff_5_2_SS_5[[i]] == 11){
    prob_temp <- append(prob_temp, prob_5_2_SS_5[[i]])
  }
  
  avg_prob <- mean(unlist(prob_temp), na.rm = T) 
  mean_prob_3of5growth_SS <- append(mean_prob_3of5growth_SS, avg_prob)
  
  median_prob <- median(unlist(prob_temp), na.rm = T) 
  median_prob_3of5growth_SS <- append(median_prob_3of5growth_SS, median_prob)

}





# Part 5

mean(unlist(mean_prob_5of6growth_SS), na.rm = T)

# Is the difference between guessed payoffs and bids different from 0?
# (a) No Superstars
t.test(unlist(mean_guess_3of3growth_NoSS), unlist(mean_bid_3of3growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_1of3growth_NoSS), unlist(mean_bid_1of3growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_0of3growth_NoSS), unlist(mean_bid_0of3growth_NoSS), paired = T, alternative = "two.sided")

t.test(unlist(mean_guess_5of6growth_NoSS), unlist(mean_bid_5of6growth_NoSS), paired = T, alternative = "two.sided")
#t.test(unlist(mean_guess_4of6growth_NoSS), unlist(mean_bid_4of6growth_NoSS), paired = T, alternative = "two.sided")  4 of 6 growth didn't happen in this batch.
t.test(unlist(mean_guess_3of6growth_NoSS), unlist(mean_bid_3of6growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_2of6growth_NoSS), unlist(mean_bid_2of6growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_1of6growth_NoSS), unlist(mean_bid_1of6growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_0of6growth_NoSS), unlist(mean_bid_0of6growth_NoSS), paired = T, alternative = "two.sided")


ci.median.ps(0.05, unlist(median_guess_0of3growth_NoSS), unlist(median_bid_0of3growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_1of3growth_NoSS), unlist(median_bid_1of3growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_3of3growth_NoSS), unlist(median_bid_3of3growth_NoSS) )

ci.median.ps(0.05, unlist(median_guess_0of6growth_NoSS), unlist(median_bid_0of6growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_1of6growth_NoSS), unlist(median_bid_1of6growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_2of6growth_NoSS), unlist(median_bid_2of6growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_3of6growth_NoSS), unlist(median_bid_3of6growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_4of6growth_NoSS), unlist(median_bid_4of6growth_NoSS) )
ci.median.ps(0.05, unlist(median_guess_5of6growth_NoSS), unlist(median_bid_5of6growth_NoSS) )

hist(unlist(median_guess_0of6growth_NoSS) - unlist(median_bid_0of6growth_NoSS), breaks = 10, main = "Guess - Bid (0 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(median_guess_5of6growth_NoSS) - unlist(median_bid_5of6growth_NoSS), breaks = 10, main = "Guess - Bid (5 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(mean_guess_5of6growth_NoSS) - unlist(mean_bid_5of6growth_NoSS), breaks = 10, main = "Mean Guess - Mean Bid (5 of 6 Growth)", xlab = "Guess - Bid")

# (b) Superstars are possible
t.test(unlist(mean_guess_3of3growth_SS), unlist(mean_bid_3of3growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_1of3growth_SS), unlist(mean_bid_1of3growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_0of3growth_SS), unlist(mean_bid_0of3growth_SS), paired = T, alternative = "two.sided")

t.test(unlist(mean_guess_6of6growth_SS), unlist(mean_bid_6of6growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_5of6growth_SS), unlist(mean_bid_5of6growth_SS), paired = T, alternative = "two.sided")
#t.test(unlist(mean_guess_4of6growth_SS), unlist(mean_bid_4of6growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_3of6growth_SS), unlist(mean_bid_3of6growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_2of6growth_SS), unlist(mean_bid_2of6growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_1of6growth_SS), unlist(mean_bid_1of6growth_SS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_0of6growth_SS), unlist(mean_bid_0of6growth_SS), paired = T, alternative = "two.sided")


ci.median.ps(0.05, unlist(median_guess_0of3growth_SS), unlist(median_bid_0of3growth_SS) )
ci.median.ps(0.05, unlist(median_guess_1of3growth_SS), unlist(median_bid_1of3growth_SS) )
ci.median.ps(0.05, unlist(median_guess_3of3growth_SS), unlist(median_bid_3of3growth_SS) )

ci.median.ps(0.05, unlist(median_guess_0of6growth_SS), unlist(median_bid_0of6growth_SS) )
ci.median.ps(0.05, unlist(median_guess_1of6growth_SS), unlist(median_bid_1of6growth_SS) )
ci.median.ps(0.05, unlist(median_guess_2of6growth_SS), unlist(median_bid_2of6growth_SS) )
ci.median.ps(0.05, unlist(median_guess_3of6growth_SS), unlist(median_bid_3of6growth_SS) )
ci.median.ps(0.05, unlist(median_guess_4of6growth_SS), unlist(median_bid_4of6growth_SS) )
ci.median.ps(0.05, unlist(median_guess_5of6growth_SS), unlist(median_bid_5of6growth_SS) )

hist(unlist(median_guess_1of6growth_SS) - unlist(median_bid_1of6growth_SS), breaks = 10, main = "Guess - Bid (1 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(mean_guess_1of6growth_SS) - unlist(mean_bid_1of6growth_SS), breaks = 10, main = "Mean Guess - Mean Bid (1 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(median_guess_5of6growth_SS) - unlist(median_bid_5of6growth_SS), breaks = 10, main = "Guess - Bid (5 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(mean_guess_5of6growth_SS) - unlist(mean_bid_5of6growth_SS), breaks = 10, main = "Mean Guess - Mean Bid (5 of 6 Growth)", xlab = "Guess - Bid")




