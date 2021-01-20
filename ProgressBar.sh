#!/bin/bash
: 'Copyright (C) 2021 FuhrerLemon, Hewel Ochoa'
#!/bin/bash

# Funcion barra de progreso
function progress_bar() {
    ######
    if [ "${1}" = "0" ]
    then 
        TME=$(date +"%s") 
    fi
    ######
    SEC=`printf "%04d\n" $(($(date +"%s")-${TME}))`; SEC="$SEC sec"
    PRC=`printf "%.0f" ${1}`
    SHW=`printf "%3d\n" ${PRC}`
    LNE=`printf "%.0f" $((${PRC}/2))`
    LRR=`printf "%.0f" $((${PRC}/2-12))`; if [ ${LRR} -le 0 ]; then LRR=0; fi;
    LYY=`printf "%.0f" $((${PRC}/2-24))`; if [ ${LYY} -le 0 ]; then LYY=0; fi;
    LCC=`printf "%.0f" $((${PRC}/2-36))`; if [ ${LCC} -le 0 ]; then LCC=0; fi;
    LGG=`printf "%.0f" $((${PRC}/2-48))`; if [ ${LGG} -le 0 ]; then LGG=0; fi;
    LRR_=""
    LYY_=""
    LCC_=""
    LGG_=""
    ######
    for ((i=1;i<=13;i++))
    do
    	DOTS=""; for ((ii=${i};ii<13;ii++)); do DOTS="${DOTS}."; done
        ######
    	if [ ${i} -le ${LNE} ]
        then 
            LRR_="${LRR_}#"
        else 
            LRR_="${LRR_}."
        fi
        ######
    	echo -ne " [${verde_claro}${titulo} ${cyan}${SEC}  ${azul_claro}${LRR_}${DOTS}${rosado}............${blanco}............${morado}............ ${SHW}%${fin}]\r"
    	######
        if [ ${LNE} -ge 1 ]
        then 
            sleep .05
        fi
    done
    ######
    for ((i=14;i<=25;i++))
    do
    	DOTS=""; for ((ii=${i};ii<25;ii++)); do DOTS="${DOTS}."; done
        ######
    	if [ ${i} -le ${LNE} ]
        then 
            LYY_="${LYY_}#"
        else 
            LYY_="${LYY_}."
        fi
        ######
    	echo -ne " [${verde_claro}${titulo} ${cyan}${SEC}  ${azul_claro}${LRR_}${rosado}${LYY_}${DOTS}${blanco}............${morado}............ ${SHW}%${fin}]\r"
    	######
        if [ ${LNE} -ge 14 ]
        then 
            sleep .05
        fi
    done
    ######
    for ((i=26;i<=37;i++))
    do
    	DOTS=""; for ((ii=${i};ii<37;ii++)); do DOTS="${DOTS}."; done
        ######
    	if [ ${i} -le ${LNE} ]
        then 
            LCC_="${LCC_}#"
        else 
            LCC_="${LCC_}."
        fi
        ######
    	echo -ne " [${verde_claro}${titulo} ${cyan}${SEC}  ${azul_claro}${LRR_}${rosado}${LYY_}${blanco}${LCC_}${DOTS}${morado}............ ${SHW}%${fin}]\r"
    	######
        if [ ${LNE} -ge 26 ]
        then 
            sleep .05
        fi
    done
    ######
    for ((i=38;i<=49;i++))
    do
    	DOTS=""; for ((ii=${i};ii<49;ii++)); do DOTS="${DOTS}."; done
        ######
    	if [ ${i} -le ${LNE} ]
        then 
            LGG_="${LGG_}#"
        else 
            LGG_="${LGG_}."
        fi
        ######
    	echo -ne " [${verde_claro}${titulo} ${cyan}${SEC}  ${azul_claro}${LRR_}${rosado}${LYY_}${blanco}${LCC_}${morado}${LGG_}${DOTS} ${SHW}%${fin}]\r"
    	######
        if [ ${LNE} -ge 38 ]
        then 
            sleep .05
        fi
    done
    ######
}
######