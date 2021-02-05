#!/bin/sh -l

deck ping --kong-addr http://kong-ee:8001 --headers Kong-Admin-Token:kong

deck validate --kong-addr http://kong-ee:8001 --headers Kong-Admin-Token:kong -s kong/default.yaml
deck sync --kong-addr http://kong-ee:8001 --headers Kong-Admin-Token:kong -s kong/default.yaml

if [ deck ping --kong-addr http://kong-ee:8001 --headers Kong-Admin-Token:kong ]
then
  exit 0
fi