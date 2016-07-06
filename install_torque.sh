#!/bin/sh

# extract/copy files
sudo ./torque-package-mom-linux-x86_64.sh --install
sudo ./torque-package-server-linux-x86_64.sh --install
sudo ldconfig
sudo mkdir /opt/local/bin/
sudo tar xzvf opt-local-bin.tgz -C /
sudo cp trqauthd /opt/local/sbin
sudo cp debian.trqauthd /etc/init.d/trqauthd
sudo cp debian.pbs_mom /etc/init.d/pbs_mom
sudo cp debian.pbs_sched /etc/init.d/pbs_sched

# torque configuration
hostname | sudo tee /var/spool/torque/server_name
echo y | sudo /opt/local/sbin/pbs_server -t create

sudo /etc/init.d/trqauthd start
sudo /opt/local/bin/qterm

echo "pbs_server = 127.0.0.1" | sudo tee /var/spool/torque/mom_priv/config
echo "localhost np=2" | sudo tee /var/spool/torque/server_priv/nodes
echo "`hostname` np=2" | sudo tee -a /var/spool/torque/server_priv/nodes


# start server
sudo /opt/local/sbin/pbs_server 
sudo /etc/init.d/pbs_mom start
sudo /etc/init.d/pbs_sched start


cd run
qsub torque.sim


