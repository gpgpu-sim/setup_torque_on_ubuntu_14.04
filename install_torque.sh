#!/bin/sh

sudo ./torque-package-mom-linux-x86_64.sh --install
sudo ./torque-package-server-linux-x86_64.sh --install
ps aux | grep pbs
