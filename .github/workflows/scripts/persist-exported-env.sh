#!/bin/bash
export | awk '{$1=$2=""; print substr($0, 3)}' | grep -vE '^[A-Z]+=*' > /tmp/env_vars
while read -r env_var_declaration
do
    echo "${env_var_declaration}"
    echo "${env_var_declaration}" | grep "=" >> $GITHUB_ENV
done < /tmp/env_vars