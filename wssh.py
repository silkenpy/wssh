#!/home/ali/.cache/pypoetry/virtualenvs/signal-3IBh7qMX-py3.10/bin/python
# -*- coding: utf-8 -*-
import re
import sys
from webssh.main import main
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(main())
