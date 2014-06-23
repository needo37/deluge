#!/bin/bash

deluged -c /config -L info -l /config/deluged.log
deluge-web -c /config
