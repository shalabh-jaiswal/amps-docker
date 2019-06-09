#!/bin/bash
set -e

cd /amps/AMPS-5.3.0.5-Release-Linux/bin/ 

/amps/AMPS-5.3.0.5-Release-Linux/bin/ampServer --sample-config > ./config.xml
/amps/AMPS-5.3.0.5-Release-Linux/bin/ampServer ./config.xml