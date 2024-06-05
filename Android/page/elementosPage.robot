*** Settings ***

Resource    ../base.robot


*** Variables ***

${BUTTON_GERAR}             br.com.pztec.estoque:id/btn_gerar  
${ARQUIVO_GERADO}           br.com.pztec.estoque:id/datafile

${TEXTO_PAGINAS}        br.com.pztec.estoque:id/textView4

# TELA RELATÓRIO

${BUTTON_INVENTARIO}        br.com.pztec.estoque:id/inventario
${BUTTON_REL_ENTRADA}       br.com.pztec.estoque:id/relentrada 
${BUTTON_REL_SAIDA}         br.com.pztec.estoque:id/relsaida 

${BUTTON_PDF_VISUALIZAR}    br.com.pztec.estoque:id/btn_abrir
${BUTTON_PDF_ENVIAR}        br.com.pztec.estoque:id/btn_email

${BUTTON_DATA_INICIAL}      br.com.pztec.estoque:id/data1
${BUTTON_DATA_FINAL}        br.com.pztec.estoque:id/data2

${DATA_ENTRADA}            //android.view.View[@content-desc="03 junho 2024"]
${DATA_SAIDA}              //android.view.View[@content-desc="07 junho 2024"]  
${CALENDÁRIO}              android:id/month_view  


# TELA BACKUP


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

Dado que usuário acessa a tela de relatórios
    Dado que usuário acessa a tela de menu
    Quando acessa a tela de relatorios

Quando acessa a tela de relatorios
    clica e espera carregar    ${BUTTON_RELATORIO}    ${TITULO_TELA}
    Element Should Contain Text    ${TITULO_TELA}       Relatórios

Quando acessa a opção de relatório desejada
    [Arguments]    ${PAGINA}        ${PAGINA_DESTINO}
    clica e espera carregar    ${PAGINA}     ${PAGINA_DESTINO}

 E acessa a função de gerar relatório     
     Click Element    ${BUTTON_GERAR}

E seleciona um intervalo de datas
    clica e espera carregar    ${BUTTON_DATA_INICIAL}    ${CALENDÁRIO}
    Click Element    ${DATA_ENTRADA}
    clica e espera carregar    ${BUTTON_SIM}    ${BUTTON_GERAR}
    clica e espera carregar    ${BUTTON_DATA_FINAL}    ${CALENDÁRIO}
    Click Element    ${DATA_SAIDA}    
    clica e espera carregar    ${BUTTON_SIM}    ${BUTTON_GERAR}


Então o usuário deverá ter acesso a todas as funçõs de relatório
    Wait Until Element Is Visible  ${BUTTON_REL_SAIDA}
    Element Should Be Enabled      ${BUTTON_INVENTARIO}
    Element Should Contain Text    ${BUTTON_INVENTARIO}     INVENTÁRIO DE ESTOQUE
    Element Should Be Enabled      ${BUTTON_REL_ENTRADA}
    Element Should Contain Text    ${BUTTON_REL_ENTRADA}        ENTRADAS NO ESTOQUE
    Element Should Be Enabled      ${BUTTON_REL_SAIDA}
    Element Should Contain Text    ${BUTTON_REL_SAIDA}          SAÍDAS DO ESTOQUE
    

Então deverá ser possível gerar um relatório
    [Arguments]    ${texto}
    Element Should Contain Text    ${TITULO_TELA}     ${texto}
    clica e espera carregar        ${BUTTON_GERAR}    ${ARQUIVO_GERADO}

E será possivel vizualizar o relatório gerado
    [Arguments]    ${texto}
    Element Should Be Visible    ${ARQUIVO_GERADO}
    Element Should Contain Text    ${ARQUIVO_GERADO}    ${texto}


E será possível visualizar o PDF e também enviar por email
    Element Should Contain Text    ${BUTTON_PDF_VISUALIZAR}    VISUALIZAR PDF
    Element Should Contain Text    ${BUTTON_PDF_ENVIAR}        ENVIAR PDF
    Element Should Be Enabled      ${BUTTON_PDF_VISUALIZAR}
    Element Should Be Enabled      ${BUTTON_PDF_ENVIAR}

Então o sistema deverá retorna uma mensagem de alerta
    Wait Until Element Is Visible    ${MENSAGEM_ALERTA}
    Element Should Contain Text    ${TEXTO_MENSAGEM_ALERTA}    Por favor selecione um período de datas.

# TELA BACKUP



# TELA RESTORE



# TELA EXPORTAR DADOS



# TELA IMPORTAR DADOS



