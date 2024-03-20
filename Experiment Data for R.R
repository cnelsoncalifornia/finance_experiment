# Structure of this code:
# Part 1: Define lists that will contain the numbers for each subject.  If there are N subjects, this list will eventually contain N numbers.
# Part 2: Use a for loop to read in all the data from the various csv files.  This for loop cycles through all files.
# Part 3: Within the above for loop, there is another for loop that goes through each subject in the file and fills in all lists variables defined at the beginning.
# Part 4: Define new variables that are give specific values for the situation (e.g. 3 of 3 growth) and go through a loop which fills them in.  
# Part 5: Hypothesis tests.







path = "C:/Users/Cliff/Documents/Overvaluation Experiment/Experiment Data Files/Modified Data Files/"
file_names <- file.path(path, dir(path,pattern = ".csv"))

library(statpsych)
library(MASS)

# Part 1

first_experiment <- list() # "superstars" means subjects did 5 rounds where superstars are possible before any rounds in which they were not.

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
  
  first_experiment_temp <- data_temp$final_instructions.1.player.first_app
  
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
    first_experiment <- append(first_experiment, first_experiment_temp[j])
    
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

median(unlist(mean_bid_1of6growth_SS), na.rm = T)  # Another option: na.omit(unlist(mean_prob_5of6growth_SS))

# Is the difference between guessed payoffs and bids different from 0?
# (a) No Superstars
t.test(unlist(mean_guess_3of3growth_NoSS), unlist(mean_bid_3of3growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_1of3growth_NoSS), unlist(mean_bid_1of3growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_0of3growth_NoSS), unlist(mean_bid_0of3growth_NoSS), paired = T, alternative = "two.sided")

t.test(unlist(mean_guess_5of6growth_NoSS), unlist(mean_bid_5of6growth_NoSS), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_4of6growth_NoSS), unlist(mean_bid_4of6growth_NoSS), paired = T, alternative = "two.sided") 
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
hist(unlist(mean_guess_0of6growth_NoSS) - unlist(mean_bid_0of6growth_NoSS), breaks = 10, main = "Mean Guess - Mean Bid (0 of 6 Growth)", xlab = "Guess - Bid")
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
ci.median.ps(0.05, unlist(median_guess_5of6growth_SS), unlist(median_bid_4of6growth_SS) )
ci.median.ps(0.05, unlist(median_guess_6of6growth_SS), unlist(median_bid_5of6growth_SS) )

hist(unlist(median_guess_1of6growth_SS) - unlist(median_bid_1of6growth_SS), breaks = 10, main = "Guess - Bid (1 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(mean_guess_1of6growth_SS) - unlist(mean_bid_1of6growth_SS), breaks = 10, main = "Mean Guess - Mean Bid (1 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(median_guess_5of6growth_SS) - unlist(median_bid_5of6growth_SS), breaks = 10, main = "Guess - Bid (5 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(mean_guess_5of6growth_SS) - unlist(mean_bid_5of6growth_SS), breaks = 10, main = "Mean Guess - Mean Bid (5 of 6 Growth)", xlab = "Guess - Bid")
hist(unlist(mean_guess_3of3growth_SS) - unlist(mean_bid_3of3growth_SS), breaks = 10, main = "Mean Guess - Mean Bid, 3 of 3 Growth", xlab = "Guess - Bid")
hist(unlist(mean_guess_6of6growth_SS) - unlist(mean_bid_6of6growth_SS), breaks = 10, main = "Mean Guess - Mean Bid, 6 of 6 Growth", xlab = "Guess - Bid")
hist(unlist(mean_guess_1of6growth_SS) - unlist(mean_bid_1of6growth_SS), breaks = 10, main = "Mean Guess - Mean Bid, 1 of 6 Growth", xlab = "Guess - Bid")





# This block of code checks to see if the order matters.  
# Do subjects who see superstars first have significantly different results than those who see superstars second?

mean_bid_3of3growth_SS_SSfirst <- list()
mean_bid_3of3growth_SS_SSsecond <- list()
mean_bid_3of3growth_NoSS_SSfirst <- list()
mean_bid_3of3growth_NoSS_SSsecond <- list()

for(i in 1:length(first_experiment)){
  if(first_experiment[i] == "superstars"){ 
    mean_bid_3of3growth_SS_SSfirst <- append(mean_bid_3of3growth_SS_SSfirst, mean_bid_3of3growth_SS[i])
    mean_bid_3of3growth_NoSS_SSfirst <- append(mean_bid_3of3growth_NoSS_SSfirst, mean_bid_3of3growth_NoSS[i])
  } else {
    mean_bid_3of3growth_SS_SSsecond <- append(mean_bid_3of3growth_SS_SSsecond, mean_bid_3of3growth_SS[i])
    mean_bid_3of3growth_NoSS_SSsecond <- append(mean_bid_3of3growth_NoSS_SSsecond, mean_bid_3of3growth_NoSS[i])
  }
}

ci.2x2.mean.mixed(0.05, unlist(mean_bid_3of3growth_SS_SSfirst), unlist(mean_bid_3of3growth_NoSS_SSfirst), unlist(mean_bid_3of3growth_SS_SSsecond), unlist(mean_bid_3of3growth_NoSS_SSsecond))
# mean(unlist(mean_bid_3of3growth_SS_SSfirst)) - mean(unlist(mean_bid_3of3growth_NoSS_SSfirst))
# mean(unlist(mean_bid_3of3growth_SS_SSsecond)) - mean(unlist(mean_bid_3of3growth_NoSS_SSsecond))

mean_guess_3of3growth_SS_SSfirst <- list()
mean_guess_3of3growth_SS_SSsecond <- list()
mean_guess_3of3growth_NoSS_SSfirst <- list()
mean_guess_3of3growth_NoSS_SSsecond <- list()

for(i in 1:length(first_experiment)){
  if(first_experiment[i] == "superstars"){ 
    mean_guess_3of3growth_SS_SSfirst <- append(mean_guess_3of3growth_SS_SSfirst, mean_guess_3of3growth_SS[i])
    mean_guess_3of3growth_NoSS_SSfirst <- append(mean_guess_3of3growth_NoSS_SSfirst, mean_guess_3of3growth_NoSS[i])
  } else {
    mean_guess_3of3growth_SS_SSsecond <- append(mean_guess_3of3growth_SS_SSsecond, mean_guess_3of3growth_SS[i])
    mean_guess_3of3growth_NoSS_SSsecond <- append(mean_guess_3of3growth_NoSS_SSsecond, mean_guess_3of3growth_NoSS[i])
  }
}

ci.2x2.mean.mixed(0.05, unlist(mean_guess_3of3growth_SS_SSfirst), unlist(mean_guess_3of3growth_NoSS_SSfirst), unlist(mean_guess_3of3growth_SS_SSsecond), unlist(mean_guess_3of3growth_NoSS_SSsecond))

table(unlist(first_experiment))

        
# Repeat the code above for 0 of 3 growth
mean_bid_0of3growth_SS_SSfirst <- list()
mean_bid_0of3growth_SS_SSsecond <- list()
mean_bid_0of3growth_NoSS_SSfirst <- list()
mean_bid_0of3growth_NoSS_SSsecond <- list()

for(i in 1:length(first_experiment)){
  if(first_experiment[i] == "superstars"){ 
    mean_bid_0of3growth_SS_SSfirst <- append(mean_bid_0of3growth_SS_SSfirst, mean_bid_0of3growth_SS[i])
    mean_bid_0of3growth_NoSS_SSfirst <- append(mean_bid_0of3growth_NoSS_SSfirst, mean_bid_0of3growth_NoSS[i])
    print(i)
  } else {
    mean_bid_0of3growth_SS_SSsecond <- append(mean_bid_0of3growth_SS_SSsecond, mean_bid_0of3growth_SS[i])
    mean_bid_0of3growth_NoSS_SSsecond <- append(mean_bid_0of3growth_NoSS_SSsecond, mean_bid_0of3growth_NoSS[i])
  }
}

ci.2x2.mean.mixed(0.05, unlist(mean_bid_0of3growth_SS_SSfirst), unlist(mean_bid_0of3growth_NoSS_SSfirst), unlist(mean_bid_0of3growth_SS_SSsecond), unlist(mean_bid_0of3growth_NoSS_SSsecond))
mean(unlist(mean_bid_0of3growth_SS_SSfirst)) - mean(unlist(mean_bid_0of3growth_NoSS_SSfirst))
mean(unlist(mean_bid_0of3growth_SS_SSsecond)) - mean(unlist(mean_bid_0of3growth_NoSS_SSsecond))

mean_guess_0of3growth_SS_SSfirst <- list()
mean_guess_0of3growth_SS_SSsecond <- list()
mean_guess_0of3growth_NoSS_SSfirst <- list()
mean_guess_0of3growth_NoSS_SSsecond <- list()

for(i in 1:length(first_experiment)){
  if(first_experiment[i] == "superstars"){ 
    mean_guess_0of3growth_SS_SSfirst <- append(mean_guess_0of3growth_SS_SSfirst, mean_guess_0of3growth_SS[i])
    mean_guess_0of3growth_NoSS_SSfirst <- append(mean_guess_0of3growth_NoSS_SSfirst, mean_guess_0of3growth_NoSS[i])
  } else {
    mean_guess_0of3growth_SS_SSsecond <- append(mean_guess_0of3growth_SS_SSsecond, mean_guess_0of3growth_SS[i])
    mean_guess_0of3growth_NoSS_SSsecond <- append(mean_guess_0of3growth_NoSS_SSsecond, mean_guess_0of3growth_NoSS[i])
  }
}

ci.2x2.mean.mixed(0.05, unlist(mean_guess_0of3growth_SS_SSfirst), unlist(mean_guess_0of3growth_NoSS_SSfirst), unlist(mean_guess_0of3growth_SS_SSsecond), unlist(mean_guess_0of3growth_NoSS_SSsecond))
mean(unlist(mean_guess_0of3growth_SS_SSfirst)) - mean(unlist(mean_guess_0of3growth_NoSS_SSfirst))
mean(unlist(mean_guess_0of3growth_SS_SSsecond)) - mean(unlist(mean_guess_0of3growth_NoSS_SSsecond))



# Analyzing stocks that start at 7 or 13 rather than the usual 10.

# 3 of 3 Growth

trim <- 0.1

mean(unlist(mean_guess_3of3growth_SS), trim = trim)
mean(unlist(mean_bid_3of3growth_SS), trim = trim)

mean(unlist(guess_3_2_SS_7_13_2))  # Only the second pick in round 2 had 3 of 3 growth.  
mean(unlist(bid_3_2_SS_7_13_2))

hist(unlist(guess_3_2_SS_7_13_2) - unlist(bid_3_2_SS_7_13_2), breaks = 10, main = "Guess - Bid (3 of 3 Growth), Starting Point: 7", xlab = "Guess - Bid")
hist(unlist(mean_guess_3of3growth_SS) - unlist(mean_bid_3of3growth_SS), breaks = 10, main = "Guess - Bid (3 of 3 Growth), Starting Point: 10", xlab = "Guess - Bid")

t.test(unlist(guess_3_2_SS_7_13_2), unlist(bid_3_2_SS_7_13_2), paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_3of3growth_SS), unlist(mean_bid_3of3growth_SS), paired = T, alternative = "two.sided")


mean(unlist(mean_guess_3of3growth_SS), trim = trim) - mean(unlist(mean_bid_3of3growth_SS), trim = trim)
median(unlist(median_guess_3of3growth_SS), trim = trim) - median(unlist(median_bid_3of3growth_SS), trim = trim)

mean(unlist(guess_3_2_SS_7_13_2), trim = trim) - mean(unlist(bid_3_2_SS_7_13_2), trim = trim)
median(unlist(guess_3_2_SS_7_13_2)) - median(unlist(bid_3_2_SS_7_13_2))


# 0 of 3 Growth

m <- mean(unlist(guess_3_SS_7_13_2))  # This is the first pick in round 1.  It had 0 of 3 growth
b <- mean(unlist(bid_3_SS_7_13_2))

df <- data.frame(guess = matrix(unlist(guess_3_SS_7_13_2)), mean_guess = m, bid = matrix(unlist(bid_3_SS_7_13_2)), mean_bid = b)
model <- lm(df$guess ~ df$mean_guess)
studres(model)[23]
sort(studres(model))
guess <- df$guess[-23]  # The item at line 23 is likely an input error (probability instead of guess), so it is eliminated.
mean(guess)
length(guess)

model2 <- lm(df$bid ~ df$mean_bid)
sort(studres(model2))
mean(df$bid[-23])


t.test(guess, df$bid[-23], paired = T, alternative = "two.sided")
t.test(unlist(mean_guess_0of3growth_SS), unlist(mean_bid_0of3growth_SS), paired = T, alternative = "two.sided")


mean(unlist(mean_guess_0of3growth_SS))
mean(unlist(mean_bid_0of3growth_SS))



# Histograms showing the distributions of probability estimates

hist(unlist(mean_prob_0of3growth_SS), main = "Estimated Probability of Superstar with 0 of 3 Growth", xlab = "Estimated Probability")
hist(unlist(mean_prob_1of3growth_SS), main = "Estimated Probability of Superstar with 1 of 3 Growth", xlab = "Estimated Probability")
hist(unlist(mean_prob_3of3growth_SS), main = "Estimated Probability of Superstar with 3 of 3 Growth", xlab = "Estimated Probability")

median(unlist(median_prob_0of3growth_SS))
median(unlist(median_prob_1of3growth_SS))
median(unlist(median_prob_2of3growth_SS))
median(unlist(median_prob_3of3growth_SS))

hist(unlist(mean_prob_2of4growth_SS), main = "Estimated Probability of Superstar with 2 of 4 Growth", xlab = "Estimated Probability")
hist(unlist(mean_prob_3of4growth_SS), main = "Estimated Probability of Superstar with 3 of 4 Growth", xlab = "Estimated Probability")
hist(unlist(mean_prob_4of4growth_SS), main = "Estimated Probability of Superstar with 4 of 4 Growth", xlab = "Estimated Probability")

median(unlist(median_prob_2of4growth_SS))
median(unlist(median_prob_3of4growth_SS))
median(unlist(median_prob_4of4growth_SS))


median(unlist(median_prob_3of5growth_SS))
median(unlist(median_prob_4of5growth_SS))
median(unlist(median_prob_5of5growth_SS))


median(unlist(median_prob_1of6growth_SS))
median(unlist(median_prob_2of6growth_SS))
median(unlist(median_prob_3of6growth_SS))
median(unlist(median_prob_5of6growth_SS))
median(unlist(median_prob_6of6growth_SS))


# Test to see if probability guesses are different when incentives are given for accurate probability estimates.

# The first 29 subjects did not have such incentives.

t.test(unlist(mean_prob_3of3growth_SS)[1:29], unlist(mean_prob_3of3growth_SS)[30:68], alternative = "two.sided")


# Test to see if the slope of the regression line when regressing valuation on growth differs from 0.

num_subjects <- length(bid_3_SS_5)
begin_subjects <- 30 #The first 29 subjects had a different draw.

# Test for different levels of growth at period 3 when SS are possible.

last_bid_3of3growth <- bid_3_SS_5[begin_subjects:num_subjects]
last_guess_3of3growth <- guess_3_SS_5[begin_subjects:num_subjects]
valuation_3of3growth <- unlist(last_guess_3of3growth) - unlist(last_bid_3of3growth)

last_bid_2of3growth <- bid_3_SS_4[begin_subjects:num_subjects]
last_guess_2of3growth <- guess_3_SS_4[begin_subjects:num_subjects]
valuation_2of3growth <- unlist(last_guess_2of3growth) - unlist(last_bid_2of3growth)

last_bid_1of3growth <- bid_3_2_SS_2[begin_subjects:num_subjects]
last_guess_1of3growth <- guess_3_2_SS_2[begin_subjects:num_subjects]
valuation_1of3growth <- unlist(last_guess_1of3growth) - unlist(last_bid_1of3growth)

last_bid_0of3growth <- bid_3_2_SS_5[begin_subjects:num_subjects]
last_guess_0of3growth <- guess_3_2_SS_5[begin_subjects:num_subjects]
valuation_0of3growth <- unlist(last_guess_0of3growth) - unlist(last_bid_0of3growth)


library(tidyr)

# Create a dataframe in wide format
df_wide <- data.frame(
  id = c(1:length(valuation_0of3growth)),
  val_0of3_growth = valuation_0of3growth,
  val_1of3_growth = valuation_1of3growth,
  val_2of3_growth = valuation_2of3growth,
  val_3of3_growth = valuation_3of3growth
)

# Convert the dataframe from wide to long format
df_long <- pivot_longer(df_wide, cols = c(val_0of3_growth, val_1of3_growth, val_2of3_growth,val_3of3_growth), 
                        names_to = "variable", values_to = "valuation")
df_long$growth = rep(c(0,1,2,3),length(df_long$id)/4)

attach(df_long)
out <- gls(valuation ~ growth, correlation = corSymm(form = ~1| id))
print(out)

summary(out)
confint(out)

# Test for different levels of growth at period 3 when SS are not possible.

last_bid_3of3growth <- bid_3_NoSS_4[begin_subjects:num_subjects]
last_guess_3of3growth <- guess_3_NoSS_4[begin_subjects:num_subjects]
valuation_3of3growth <- unlist(last_guess_3of3growth) - unlist(last_bid_3of3growth)

last_bid_2of3growth <- bid_3_NoSS_5[begin_subjects:num_subjects]
last_guess_2of3growth <- guess_3_NoSS_5[begin_subjects:num_subjects]
valuation_2of3growth <- unlist(last_guess_2of3growth) - unlist(last_bid_2of3growth)

last_bid_1of3growth <- bid_3_2_NoSS_2[begin_subjects:num_subjects]
last_guess_1of3growth <- guess_3_2_NoSS_2[begin_subjects:num_subjects]
valuation_1of3growth <- unlist(last_guess_1of3growth) - unlist(last_bid_1of3growth)

last_bid_0of3growth <- bid_3_2_NoSS_5[begin_subjects:num_subjects]
last_guess_0of3growth <- guess_3_2_NoSS_5[begin_subjects:num_subjects]
valuation_0of3growth <- unlist(last_guess_0of3growth) - unlist(last_bid_0of3growth)

# Create a dataframe in wide format
df_wide <- data.frame(
  id = c(1:length(valuation_0of3growth)),
  val_0of3_growth = valuation_0of3growth,
  val_1of3_growth = valuation_1of3growth,
  val_2of3_growth = valuation_2of3growth,
  val_3of3_growth = valuation_3of3growth
)

# Convert the dataframe from wide to long format
df_long <- pivot_longer(df_wide, cols = c(val_0of3_growth, val_1of3_growth, val_2of3_growth,val_3of3_growth), 
                        names_to = "variable", values_to = "valuation")
df_long$growth = rep(c(0,1,2,3),length(df_long$id)/4)

attach(df_long)
out <- gls(valuation ~ growth, correlation = corSymm(form = ~1| id))
print(out)

summary(out)
confint(out)


# Test for different levels of growth at period 3 when SS are possible and assets start at 7 or 13.

last_bid_3of3growth <- bid_3_2_SS_7_13_2
last_guess_3of3growth <- guess_3_2_SS_7_13_2
valuation_3of3growth <- unlist(last_guess_3of3growth) - unlist(last_bid_3of3growth)

last_bid_2of3growth <- bid_3_2_SS_7_13_1
last_guess_2of3growth <- guess_3_2_SS_7_13_1
valuation_2of3growth <- unlist(last_guess_2of3growth) - unlist(last_bid_2of3growth)

last_bid_0of3growth <- bid_3_SS_7_13_2
last_guess_0of3growth <- guess_3_SS_7_13_2
valuation_0of3growth <- unlist(last_guess_0of3growth) - unlist(last_bid_0of3growth)

# Create a dataframe in wide format
df_wide <- data.frame(
  id = c(1:length(valuation_0of3growth)),
  val_0of3_growth = valuation_0of3growth,
  #val_1of3_growth = valuation_1of3growth,  No data exists for 1 of 3 growth in this situation.
  val_2of3_growth = valuation_2of3growth,
  val_3of3_growth = valuation_3of3growth
)

# Convert the dataframe from wide to long format
df_long <- pivot_longer(df_wide, cols = c(val_0of3_growth, val_2of3_growth,val_3of3_growth), 
                        names_to = "variable", values_to = "valuation")
df_long$growth = rep(c(0,2,3),length(df_long$id)/3)

attach(df_long)
out <- gls(valuation ~ growth, correlation = corSymm(form = ~1| id))
print(out)

summary(out)
confint(out)

mean(valuation_3of3growth)
