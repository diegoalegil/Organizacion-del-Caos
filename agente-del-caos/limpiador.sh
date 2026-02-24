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

imagenes=0
documentos=0
textos=0
pdfs=0
vacios=0    

or archivo in *.jpg *.png *.gif; do
    if [ -f "$archivo" ]; then
        mv "$archivo" IMGS/
        imagenes=$((imagenes+1))
    fi
done

for archivo in *.docx *.odt; do
    if [ -f "$archivo" ]; then
        mv "$archivo" DOCS/
        documentos=$((documentos+1))
    fi
done

for archivo in *.txt; do
    if [ -f "$archivo" ]; then
        mv "$archivo" TXTS/
        textos=$((textos+1))
    fi
done

for archivo in *.pdf; do
    if [ -f "$archivo" ]; then
        mv "$archivo" PDFS/
        pdfs=$((pdfs+1))
    fi
done

for archivo in *; do
    if [ -f "$archivo" ] && [ ! -s "$archivo" ]; then
        mv "$archivo" VACIOS/
        vacios=$((vacios+1))
    fi
done

echo
echo "------ INFORME ------"
echo "Se han movido $imagenes imágenes."
echo "Se han movido $documentos documentos."
echo "Se han movido $textos archivos de texto."
echo "Se han movido $pdfs PDFs."
echo "Se encontraron $vacios archivos vacíos."
echo "---------------------"
echo "Limpieza terminada."
