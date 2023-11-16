from os import environ
import random
#import sys
#from termcolor import colored



#This code block is to clear cache.
import requests
from requests.structures import CaseInsensitiveDict

url = "https://reqbin.com/echo"

headers = CaseInsensitiveDict()
headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
headers["Pragma"] = "no-cache"
headers["Expires"] = "0"

resp = requests.get(url, headers=headers)
#End clear cache code block.

number = round(random.randint(0,1))  # Change this at random.  This determines which app comes first.


#number = 1    # Put 1 if you want superstars to come first


app_1 = ""
app_2 = ""
if number == 1:
    app_1 = 'asset_experiment_cliff_nelson'                 # Superstar assets are possible in this app.
    app_2 = 'asset_experiment_cliff_nelson_no_superstars'   # Superstar assets are not possible in this app.
    print("Superstars.")
elif number == 0:
    app_1 = 'asset_experiment_cliff_nelson_no_superstars'
    app_2 = 'asset_experiment_cliff_nelson'
    print("No superstars.")



SESSION_CONFIGS = [
    dict(
        name='asset_experiment_cliff_nelson',
        display_name="Asset Experiment",
        app_sequence=['consent_form', 'directions', app_1, app_2, 'final_instructions'], # 'consent_form', 'directions', app_1, app_2, 'asset_experiment_with_distribution'
        num_demo_participants=20,
        number=number,
    ),
]

# if you set a property in SESSION_CONFIG_DEFAULTS, it will be inherited by all configs
# in SESSION_CONFIGS, except those that explicitly override it.
# the session config can be accessed from methods in your apps as self.session.config,
# e.g. self.session.config['participation_fee']

SESSION_CONFIG_DEFAULTS = dict(
    real_world_currency_per_point=1.00, participation_fee=0.00, doc=""
)

PARTICIPANT_FIELDS = [
    'round',
    'final_earnings',
    'final_earnings_app2',
    'final_earnings_bonus'
]
SESSION_FIELDS = []

# ISO-639 code
# for example: de, fr, ja, ko, zh-hans
LANGUAGE_CODE = 'en'

# e.g. EUR, GBP, CNY, JPY
REAL_WORLD_CURRENCY_CODE = 'USD'
USE_POINTS = True



SECRET_KEY = '7829773786560'

INSTALLED_APPS = ['otree']
