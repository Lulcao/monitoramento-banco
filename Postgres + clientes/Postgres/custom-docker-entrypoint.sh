#!/bin/bash
set -e

function customize {
#	id
	cp -R /tmp/.ssh/* /root/.ssh/
#	ls -ltr /tmp/.ssh
#	ls -ltr /root/.ssh
	chmod 700 /root/.ssh
	chmod 644 /root/.ssh/id_rsa.pub
	chmod 600 /root/.ssh/id_rsa
	chmod 600 /root/.ssh/authorized_keys

	su - postgres -c "cp -R /tmp/.ssh/* ~postgres/.ssh/ && chmod 700 ~postgres/.ssh && chmod 644 ~postgres/.ssh/id_rsa.pub && chmod 600 ~postgres/.ssh/id_rsa && chmod 600 ~postgres/.ssh/authorized_keys"

	/usr/sbin/sshd 2>&1
}

function runTemboardAgente {
	sleep 15
	if [ ! -f "/var/lib/postgresql/data/configured" ]
	then
		/usr/local/share/temboard-agent/purge.sh data/pgdata;
		/usr/local/share/temboard-agent/auto_configure.sh http://temboard:3010;
		sudo -u postgres temboard-agent -c /etc/temboard-agent/data/pgdata/temboard-agent.conf fetch-key --force;
	else
		echo "Temboard Agente Configured"
	fi;
    sudo -u postgres temboard-agent -c /etc/temboard-agent/data/pgdata/temboard-agent.conf;
}

customize  &

runTemboardAgente &

/usr/local/bin/docker-entrypoint.sh "$@" &

sleep infinity 
