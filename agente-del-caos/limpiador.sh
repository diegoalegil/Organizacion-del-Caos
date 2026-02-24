#!/bin/bash

if [ -z "$1" ]; then
    DIRECTORIO=$(pwd)
else
    DIRECTORIO=$1
fi

if [ ! -d "$DIRECTORIO" ]; then
    echo "El directorio no existe."
    exit 1
fi

cd "$DIRECTORIO"

mkdir -p IMGS
mkdir -p DOCS
mkdir -p TXTS
mkdir -p PDFS
mkdir -p VACIOS    

mv *.jpg *.png *.gif IMGS/ 2>/dev/null
mv *.docx *.odt DOCS/ 2>/dev/null
mv *.txt TXTS/ 2>/dev/null
mv *.pdf PDFS/ 2>/dev/null

for archivo in *; do
    if [ -f "$archivo" ] && [ ! -s "$archivo" ]; then
        mv "$archivo" VACIOS
    fi
done

echo "Limpieza terminada."
