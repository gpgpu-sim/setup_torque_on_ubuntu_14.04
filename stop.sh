#!/bin/sh

sudo /etc/init.d/pbs_mom stop
sudo /opt/local/bin/qterm
sudo /etc/init.d/trqauthd stop
sudo /etc/init.d/pbs_sched stop
