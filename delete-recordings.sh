#!/bin//bash

#extrai data pra variaveis
IFS=- read -r ano mes dia hora <<< $(date '+%Y-%m-%d-%H')

SRS_DIR="/root/srs/live"

cd $SRS_DIR

#lê quantas cameras o cliente tem
QTD_CAMS=$(ls $SRS_DIR | wc -w)

#subtrai as cameras em 1 para o for loop
cams_for_loop=$(expr $QTD_CAMS - 1)

#pega qual é a ultima hora
LAST_HOUR=$(expr $hora - 1)

#valida se a hora possui 2 digitos
if [[ "$LAST_HOUR" -lt 10 ]]; then
	LAST_HOUR="0$LAST_HOUR"
fi

#loop para excluir de todos os diretorios(necessário alteração baseado no padrao de nomenclatura que as cameras seguirão)
for i in $(seq 0 $cams_for_loop); do
	cd $SRS_DIR/cam2$i/$ano/$mes/$dia/
	rm -rf $LAST_HOUR
	ls
done


