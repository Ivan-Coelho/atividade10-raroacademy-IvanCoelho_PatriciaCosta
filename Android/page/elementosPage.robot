*** Settings ***

Resource    ../base.robot


*** Variables ***

${TEXTO_PAGINAS}        br.com.pztec.estoque:id/textView4

# TELA RELATÓRIO

${BUTTON_INVENTARIO}        br.com.pztec.estoque:id/inventario
${BUTTON_ENTRADA}           br.com.pztec.estoque:id/relentrada 
${BUTTON_SAIDA}             br.com.pztec.estoque:id/relsaida   

# TELA BACKUP

${BUTTON_GERAR_BACKUP}      br.com.pztec.estoque:id/btn_gerar  
${ARQUIVO_BACKUP}           br.com.pztec.estoque:id/datafile
${BUTTON_ENVIAR_BACKUP}     br.com.pztec.estoque:id/btn_send


# TELA RESTORE


${BUTTON_SELECIONAR_ARQUIVO}    br.com.pztec.estoque:id/btn_procurar


# TELA EXPORTAR DADOS

${ARQUIVO_EXPORTAR}            br.com.pztec.estoque:id/datafileprod
${BUTTON_ENVIAR_EXPORT}        br.com.pztec.estoque:id/btn_prod

# TELA IMPORTAR DADOS

${BUTTON_INPORT_PRODUTOS}        br.com.pztec.estoque:id/btn_produtos
${BUTTON_INPORT_ENTRADAS}        br.com.pztec.estoque:id/btn_entradas
${BUTTON_INPORT_SAIDAS}          br.com.pztec.estoque:id/btn_saidas
${BUTTON_GRUPO_PRODUTOS}         br.com.pztec.estoque:id/btn_grupos


*** Keywords ***

# TELA RELATÓRIO
            


# TELA BACKUP



# TELA RESTORE



# TELA EXPORTAR DADOS



# TELA IMPORTAR DADOS



