#!/bin/bash

diretorio_atual="$(pwd)"

for arquivo in "$diretorio_atual"/*.mp4 "$diretorio_atual"/*.mkv; do
    [ -e "$arquivo" ] || continue

    nome_base="$(basename "$arquivo")"
    extensao="${nome_base##*.}"
    nome_sem_extensao="${nome_base%.*}"
    arquivo_saida="${nome_sem_extensao}_720p.${extensao}"

    ffmpeg -i "$arquivo" -vf scale=1280:720 -c:v libx264 -crf 22 -preset slow -c:a copy "$arquivo_saida"
done
