1. Make the startup command look something like this:

   ``` sh
   #!/bin/sh

   # $FreeBSD$
   #
   # PROVIDE: zettarepl
   # REQUIRE: LOGIN
   # KEYWORD: shutdown
   #
   # Add these lines to /etc/rc.conf.local or /etc/rc.conf
   # to enable this service:
   #
   # zettarepl_enable (bool): Set to NO by default.
   #                          Set it to YES to enable zettarepl.
   # zettarepl_config (path): Set to /usr/local/etc/zettarepl/zettarepl.yaml
   #                          by default.

   . /etc/rc.subr

   name=zettarepl
   rcvar=zettarepl_enable

   load_rc_config $name

   : ${zettarepl_enable:="NO"}
   : ${zettarepl_config:="/usr/local/etc/zettarepl/zettarepl.yaml"}
   : ${zettarepl_user:="root"}


   pidfile=/var/run/zettarepl.pid
   command=/usr/local/bin/${name}
   #command_args="run $zettarepl_config"
   command_interpreter=/usr/local/bin/python3.8

   start_cmd=zettarepl_start
   stop_postcmd=zettarepl_cleanup

   zettarepl_start() {
       echo "Starting zettarepl."
       /usr/bin/touch ${pidfile} && /usr/sbin/chown ${zettarepl_user} ${pidfile}
           /usr/sbin/daemon -cS -p ${pidfile} -u ${zettarepl_user} /usr/local/bin/zettarepl run ${zettarepl_config}
   }

   zettarepl_cleanup() {
       [ -f ${pidfile} ] && %%RM%% ${pidfile}
   }

   run_rc_command "$1"
   ```

2. Test the port with something like this:

   ```
   sudo poudriere testport -j 12_1 -n sysutils/py-zettarepl -p /usr/local/poudriere/ports/ports_and_hartzell/
   ```
