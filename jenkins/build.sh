#!/bin/bash
docker stop flask-app || true
docker rm flask-app || true
docker build -t flask-app ./flask-app
docker run -d -p 5000:5000 --name flask-app flask-app
