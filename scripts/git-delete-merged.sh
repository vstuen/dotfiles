#!/bin/bash

for dir in $@; do
        git="git -C $dir"
        current=$($git branch | grep \* | cut -d ' ' -f2)
        if [[ $current = "master" ]]; then
                echo "$dir: Omitting branch 'master'"
        else
                echo "$dir: Omitting current branch '$current' and 'master'"
        fi

        merged=$($git branch --merged | \
                grep -v master | \
                grep -v $current)

        if [ -n "$merged"  ]; then
                $git branch -d $merged
        else
                echo "$dir: No merged branches"
        fi
done
