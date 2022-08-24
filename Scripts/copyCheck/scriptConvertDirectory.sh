#!/bin/bash

for d in ./*/ 
do
	echo $d
    (cd "$d"  && paps Comentarios.txt | ps2pdf - Comentarios.pdf)
done
