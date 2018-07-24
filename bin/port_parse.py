#!/usr/bin/env python
"""Script for parsing piped input."""
from __future__ import print_function

import sys
import subprocess
import time

shell_input = sys.stdin.read()
line_by_line = shell_input.splitlines()

def check_input():
    """Check the input.

    Return 0 if docker port, 1 if not
    """
    if len(line_by_line) == 1:
        try:
            int_input = int(line_by_line[0])
        except ValueError:
            return 1
        if 1000 < int_input < 40000:
            print('Opening Docker port: {}'.format(int_input))
            proc = subprocess.Popen(
                    ['ssh', '-nNT', '-L', '{}:localhost:{}'.format(int_input, int_input), 'linode'],
                    stdout=subprocess.PIPE
                    )
            time.sleep(1)  # Wait for SSH to connect
            proc = subprocess.Popen(
                    # ['/usr/bin/open', '-a', '/Applications/Google Chrome.app', 'http://localhost:{}'.format(int_input)],
                    ['chromium', 'http://localhost:{}'.format(int_input)],
                    stdout=subprocess.PIPE
                    )
            return 0
    return 1

res = check_input()
if res == 1:
    print(shell_input, end='')

sys.exit()
