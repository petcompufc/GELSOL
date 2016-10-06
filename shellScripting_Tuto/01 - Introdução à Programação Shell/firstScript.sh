#!/bin/bash
#
# Testes de Scripts Shell
#
clear
echo -e "Hello $USER!"
echo -e "Today is \c ";date
echo -e "Number of user login: \c"; who | wc -l
echo -e "\nCalendar"; cal
exit 0
