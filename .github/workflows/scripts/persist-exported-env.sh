#!/bin/sh
export | awk '{$1=$2=""; print substr($0, 3)}' > /tmp/env_vars
while read -r env_var_declaration
do
    echo "${env_var_declaration}"
    echo "${env_var_declaration}" >> $GITHUB_ENV
done < /tmp/env_vars