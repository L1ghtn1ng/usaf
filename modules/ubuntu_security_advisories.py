#!/usr/bin/python3
# -*- coding: utf-8 -*-
#Copyright (c) 2014, Jay Townsend
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#
#* Redistributions of source code must retain the above copyright notice, this
#  list of conditions and the following disclaimer.
#* Redistributions in binary form must reproduce the above copyright notice,
#  this list of conditions and the following disclaimer in the documentation
#  and/or other materials provided with the distribution.
#* Neither the name of the {organization} nor the names of its
#  contributors may be used to endorse or promote products derived from
#  this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


try:
    import requests
    from bs4 import BeautifulSoup
except ImportError as e:
        print('\nPlease make sure you have All Dependencies Installed, otherwise this script will not work correctly'),
        print(e)


def banner():
    print("""\tUBUNTU SECURITY ADVISORIES SCRAPER
        CREATED BY JAY TOWNSEND AKA(L1GHTN1NG)\n""")


def request():
    uri = "http://www.ubuntu.com/usn/"
    request = requests.get(uri)
    BeautifulSoup(request.content)


def parse():
    soup = BeautifulSoup
    soup.find_all("h3", "p")


def main():
    try:
        banner()
        request()
        parse()
    except Exception as e:
            print(e)


if __name__ == '__main__':
    main()
