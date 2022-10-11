#!/bin/bash
/etc/init.d/ssh start
python3 wssh.py --address='0.0.0.0' --port=8029
