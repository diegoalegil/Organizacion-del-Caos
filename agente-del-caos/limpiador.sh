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

mkdir -p IMGS DOCS TXTS PDFS VACIOS    

imagenes=0
documentos=0
textos=0
pdfs=0
vacios=0

for archivo in *.jpg *.png *.gif; do
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

for carpeta in */; do
    if [ -d "$carpeta" ] && [ -z "$(ls -A "$carpeta")" ]; then
        vacios=$((vacios+1))
    fi
done

echo
echo "------ INFORME ------"
echo "Se han movido $imagenes imágenes."
echo "Se han movido $documentos documentos."
echo "Se han movido $textos archivos de texto."
echo "Se han movido $pdfs PDFs."
echo "Se encontraron $vacios elementos vacíos."
echo "---------------------"

if [ "$vacios" -gt 0 ]; then
    echo
    read -p "¿Deseas eliminar los elementos vacíos? (s/n): " respuesta

    if [ "$respuesta" = "s" ]; then
        rm -rf VACIOS/*
        
        for carpeta in */; do
            if [ -d "$carpeta" ] && [ -z "$(ls -A "$carpeta")" ]; then
                rmdir "$carpeta"
            fi
        done
        
        echo "Elementos vacíos eliminados."
    else
        echo "No se eliminaron los elementos vacíos."
    fi
fi

echo
echo "Limpieza terminada."
