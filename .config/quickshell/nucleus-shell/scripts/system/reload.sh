#!/bin/bash

killall qs
nohup qs -c nucleus-shell > /dev/null 2>&1 & disown