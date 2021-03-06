#!/usr/bin/python3

import requests
import pprint
import argparse

parser = argparse.ArgumentParser(description='A tool to check if your email account has been in a breach By Jay Townsend')
parser.add_argument('-e', '--email-account', help='Email account to lookup', required=True)
args = parser.parse_args()

headers = {'User-agent': 'Have I been pwn module'}
API = 'https://haveibeenpwned.com/api/v2/breachedaccount/{0}'.format(args.email_account)
request = requests.get(API, headers=headers)

if request.status_code == 404:
    print('Cannot find your account')
else:
    entries = request.json()
    for entry in entries:
        print('Domain:', entry['Domain'])
        print('DateAdded:', entry['AddedDate'])
        print('BreachDate:', entry['BreachDate'])
        pprint.pprint(entry['Description'])
        print('IsSensitive:', entry['IsSensitive'])
        print('IsVerified:', entry['IsVerified'])
        print('PwnCount:', entry['PwnCount'])
