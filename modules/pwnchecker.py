#!/usr/bin/python3

import argparse
import pprint
import requests

parser = argparse.ArgumentParser(description='A tool to check if an email address has been in a breach. By Jay Townsend')
parser.add_argument('-e', '--email-account', help='Email address to lookup', required=True)
parser.add_argument('-k', '--api-key', help='HIBP API key', required=True)
args = parser.parse_args()

headers = {'User-agent': 'Have I been pwn module',
           f'hibp-api-key': args.api_key}
API = f'https://haveibeenpwned.com/api/v3/breachedaccount/{args.email_account}?truncateResponse=false'
request = requests.get(API, headers=headers)

if request.status_code == 404:
    print('\nNo results found.')
elif request.status_code == 401:
    print('\n[!] Improperly formated API key.')
else:
    entries = request.json()
    for entry in entries:
        print('Domain:', entry['Domain'])
        print('DateAdded:', entry['AddedDate'])
        print('BreachDate:', entry['BreachDate'])
        pprint.pprint(entry['Description'])
        print('IsSensitive:', entry['IsSensitive'])
        print('IsVerified:', entry['IsVerified'])
        print('PwnCount:', entry['PwnCount'], '\n')
