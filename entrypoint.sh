#!/bin/bash

if [ -e requirements.txt ]; then
	yes w | pip3 install -r requirements.txt
fi

gunicorn app -b :80 --workers 2 --name app
