#!/bin/bash

echo "Script will add USER to rvm group"

rvm group add rvm "$USER"
rvm fix-permissions

echo "Thanks to @mpapis from stackoverflow [http://stackoverflow.com/questions/26242712/installing-rvm-getting-error-there-was-an-error23]"
