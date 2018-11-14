# hits Canvas API and pulls in bio and imports to Exasol with the new exasol python library

import requests
import pandas as pd
import json
import pyexasol as e

token = ''

def get_user_df(userid):
    response = requests.get('https://ucdenver.instructure.com/api/v1/users/'+userid + '/profile', headers={'Authorization': 'Bearer '+token})
    json_details = (response.json())
    df = pd.io.json.json_normalize(json_details)
    return df

exaconnect = e.connect(dsn='', user='', password='', schema='CANVAS_RESEARCH', compression=True)

if __name__ == '__main__':

    user_ids = ['1','3']
    for id in user_ids:
        user_df = get_user_df(id)
        user_profile = user_df[[
            'id',
            'name',
            'bio'
        ]]
        user_profile['bio_length'] = user_profile['bio'].str.split().str.len()
        print(user_profile)
        # user_profile.to_csv('CanvasGetCrystalData.csv')

        exaconnect.import_from_pandas(user_profile, 'FACULTY_STG')
