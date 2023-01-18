from os import environ
import random



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





number = round(random.randint(0,1))  # Change this at random


number = 1


app_1 = ""
app_2 = ""
if number == 1:
    app_1 = 'stock_experiment_cliff_nelson'                 # Superstar stocks are possible in this app.
    app_2 = 'stock_experiment_cliff_nelson_no_superstars'   # Superstar stocks are not possible in this app.
    print("Superstars.")
elif number == 0:
    app_1 = 'stock_experiment_cliff_nelson_no_superstars'
    app_2 = 'stock_experiment_cliff_nelson'
    print("No superstars.")



SESSION_CONFIGS = [
    dict(
        name='stock_experiment_cliff_nelson',
        display_name="Stock Experiment",
        app_sequence=['Directions', app_1, app_2, 'final_instructions'],
        num_demo_participants=1,
        number=number,
    ),
#    dict(
#        name='trust_simple',
#        display_name="Trust Simple",
#        app_sequence=['trust_simple', 'payment_info'],
#        num_demo_participants=2,
#    ),
#    dict(
#        name='dictator',
#        display_name="dictator",
#        app_sequence=['dictator', 'payment_info'],
#        num_demo_participants=2,
#    ),


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
    'final_earnings'
]
SESSION_FIELDS = []

# ISO-639 code
# for example: de, fr, ja, ko, zh-hans
LANGUAGE_CODE = 'en'

# e.g. EUR, GBP, CNY, JPY
REAL_WORLD_CURRENCY_CODE = 'USD'
USE_POINTS = True

ROOMS = [
    dict(
        name='econ101',
        display_name='Econ 101 class',
        participant_label_file='_rooms/econ101.txt',
    ),
    dict(name='live_demo', display_name='Room for live demo (no participant labels)'),
]

ADMIN_USERNAME = 'admin'
# for security, best to set admin password in an environment variable
ADMIN_PASSWORD = environ.get('OTREE_ADMIN_PASSWORD')

DEMO_PAGE_INTRO_HTML = """
Here are some oTree games.
"""


SECRET_KEY = '7829773786560'

INSTALLED_APPS = ['otree']
