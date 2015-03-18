#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Copyright (c) 2015, Jay Townsend
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
# Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# Neither the name of the {organization} nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


try:
    import sys
    from email.message import Message as MIMEMessage
    import smtplib
    import feedparser as fp
except ImportError as e:
        print(e)
        sys.exit(1)


def main():
    try:
        smtpobj = smtplib.SMTP(host='localhost', port=25, timeout=10)
        url = "http://ubuntu.com/usn/rss.xml"
        data = fp.parse(url)
        for entry in data['entries']:
            message = MIMEMessage()
            name = 'Ubuntu Security'
            faddr = 'no-reply@example.com'
            taddr = 'your email here'
            message.add_header('From', '{0} <{1}>'.format(name, faddr))
            message.add_header('To', taddr)
            message.add_header('Subject', '{}'.format(entry['title']))
            message.set_payload("""{} """.format(entry['summary']))
            smtpobj.sendmail(faddr, taddr, str(message).encode())
    except OSError as e:
        print(e)


if __name__ == '__main__':
    main()
