#!/usr/bin/env bash

# Bash PHP Unit Task Runner
#
# Exit 0 if no errors found
# Exit 1 if errors were found
#
# Requires
# - php
#
# Arguments
# See: https://phpunit.readthedocs.io/en/9.0/textui.html

# Plugin title
title="PHP Unit Task Runner"

# Possible command names of this tool
local_command="phpunit.phar"
vendor_command="vendor/bin/phpunit"
global_command="phpunit"

# Print a welcome and locate the exec for this tool
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/helpers/colors.sh
source $DIR/helpers/formatters.sh
source $DIR/helpers/welcome.sh
source $DIR/helpers/locate.sh

command_args=$1
command_to_run="${exec_command} ${command_args}"

echo -e "${bldwht}Running command ${txtgrn} ${exec_command} ${command_args}"
hr
command_result=`eval $command_to_run`
if [[ $command_result =~ FAILURES ]]
then
    hr
    echo "Failures detected in unit tests..."
    hr
    echo "$command_result"
    exit 1
fi
exit 0
