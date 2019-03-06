#!/usr/bin/env bash
set -e
ssh -T  -p 10044 -i key1_rsa upload@localhost  2>&1|grep rssh && echo key1 works
ssh -T  -p 10044 -i key2_rsa upload@localhost  2>&1|grep rssh && echo key2 works
