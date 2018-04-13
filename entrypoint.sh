#!/usr/bin/env bash

set -e

ln -sf /usr/local/lib/python2.7/site-packages /src

if [ -e /code/setup.py ]; then
  echo Install from code...
  pip install -e /code
fi

if [ ! -z "$COMMAND" ]; then
  echo Execute command $COMMAND...
  bash -c "$COMMAND"
fi

echo Start supervisord
supervisord
