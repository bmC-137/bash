#!/bin/bash


# There are two main ways to get an agent set up.  The first is at the start of an X session, where all other windows or programs are started as children of the ssh-agent program.  The agent starts a
# command under which its environment variables are exported, for example ssh-agent xterm &.  When the command terminates, so does the agent.

# The second method is used for a login session.  When ssh-agent is started, it prints the shell commands required to set its environment variables, which in turn can be evaluated in the calling shell,
# for example eval `ssh-agent -s`.


ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found running shh Agent:
      ssh-add -l
      return
    fi
  done
  echo "Cannot find ssh agent"
  echo "maybe you should reconnect and forward it?"
}
