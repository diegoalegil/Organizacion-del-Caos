#!/bin/bash

mensaje="$*"

git add .
git commit -m "$mensaje"
git push

echo "Cambios enviados al repo"