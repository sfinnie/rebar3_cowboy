#!/bin/sh
# Utility script for setup

REPO=rebar3_cowboy
R3_TEMPLATE_DIR=~/.config/rebar3/templates
TGT=${R3_TEMPLATE_DIR}/${REPO}

rm -rf $TGT
git clone https://github.com/sfinnie/${REPO}.git $TGT


# mkdir -p $TGT

# cp *.template $TGT
# cp *.erl $TGT
# cp *.config $TGT
# cp *.src $TGT
# cp _README.md $TGT
# cp gitignore $TGT
# cp LICENSE $TGT
