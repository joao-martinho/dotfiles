#!/bin/bash

PENDRIVE="/media/joao/C53B-3E70/Filmes (3)"
LOCAL="/home/joao/Área de trabalho/Filmes"

if [ "$1" != "push" ] && [ "$1" != "pull" ]; then
    echo "Uso:"
    echo "  $0 push  -> copia do disco local para o pen-drive"
    echo "  $0 pull  -> copia do pendrive para o disco local"
    exit 1
fi

if ! mountpoint -q "$(dirname "$PENDRIVE")"; then
    echo "Pen-drive não está montado em $(dirname "$PENDRIVE")"
    exit 1
fi

if [ "$1" = "push" ]; then
    ORIGEM="$LOCAL"
    DESTINO="$PENDRIVE"
    echo "Copiando do disco local para o pen-drive..."
else
    ORIGEM="$PENDRIVE"
    DESTINO="$LOCAL"
    echo "Copiando do pen-drive para o disco local..."
fi

rsync -av --no-perms --no-owner --no-group "$ORIGEM"/ "$DESTINO"/

echo "Transferência concluído com sucesso."

