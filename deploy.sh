#!/bin/sh

TGT=~/.config/rebar3/templates/rebar3_cowboy
rm -rf $TGT
mkdir -p $TGT

cp *.template $TGT
cp *.erl $TGT
cp *.config $TGT
cp *.src $TGT
cp _README.md $TGT
cp gitignore $TGT
cp LICENSE $TGT
