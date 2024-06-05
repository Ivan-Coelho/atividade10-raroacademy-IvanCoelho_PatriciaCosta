*** Settings ***

Resource    ../base.robot


*** Variables ***

${BUTTON_GERAR}             br.com.pztec.estoque:id/btn_gerar  
${ARQUIVO_GERADO}           br.com.pztec.estoque:id/datafile

${TEXTO_PAGINAS}            br.com.pztec.estoque:id/textView4

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

${BUTTON_SELECIONAR_ARQUIVO}      br.com.pztec.estoque:id/btn_procurar
${ESTOQUE}                        xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]  
${ARQUIVO_BKP}                    xpath=//android.widget.TextView[contains(@text,'APP')][last()]


# TELA EXPORTAR DADOS

${ARQUIVO_EXPORTAR}            br.com.pztec.estoque:id/datafileprod
${BUTTON_ENVIAR_EXPORT}        br.com.pztec.estoque:id/btn_prod

${TEXTO_MSN_RESTORE}           br.com.pztec.estoque:id/lbl_mensagem 

${TITULO_MSN_RESTAURACAO}        //android.widget.TextView[@resource-id="android:id/alertTitle"]
${TEXTO_MSN_RESTAURACAO}




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

Dado que usuário acessa a tela de backup
    Dado que usuário acessa a tela de menu
    clica e espera carregar    ${BUTTON_BACKUP}    ${TELA}

Quando acessa a tela de BACKUP
    clica e espera carregar    ${BUTTON_BACKUP}    ${TELA}
    
Quando gerar um backup
    clica e espera carregar    ${BUTTON_GERAR}    ${MENSAGEM_ALERTA}

Então o usuário deverá ter acesso as funcionalidades de BACKUP
    Element Should Contain Text    ${TELA}    Gerar backup
    Element Should Be Visible      ${BUTTON_GERAR} 
    Element Should Be Enabled      ${BUTTON_GERAR} 
    Element Should Be Visible      ${BUTTON_ENVIAR_BACKUP}
    Element Should Be Enabled      ${BUTTON_ENVIAR_BACKUP}
    Element Should Contain Text    ${TEXTO_PAGINAS}     Envie o arquivo de backup para o drive virtual. Caso tenha problemas com seu aparelho seus dados poderão ser restaurados. Atenção, não altere o arquivo original, sob o risco de não conseguir restaurá-lo novamente.

Então o backup deverá ser gerado com sucesso
    Element Should Contain Text    ${MENSAGEM_ALERTA}    Operação concluída!
    Element Should Contain Text    ${TEXTO_MENSAGEM_ALERTA}    Enviar
    clica e espera carregar        ${BUTTON_SIM}    ${ARQUIVO_GERADO}

Então deverá ser possível enviar o backup com sucesso
    clica e espera carregar        ${BUTTON_SIM}    ${ARQUIVO_GERADO}
    Element Should Be Enabled      ${BUTTON_ENVIAR_BACKUP}

# TELA RESTORE

Dado que usuário fez um backup
    Dado que usuário acessa a tela de backup
    Quando gerar um backup
    Então o backup deverá ser gerado com sucesso

Quando acessa a tela de RESTORE
    clica e espera carregar    ${BUTTON_RESTORE}    ${BUTTON_SELECIONAR_ARQUIVO}

Quando acessar a tela de RESTORE
    Press Keycode    4
    Wait Until Page Contains Element    ${BUTTON_RESTORE}
    Quando acessa a tela de RESTORE

E acessar a funcionalidade de selecionar arquivo
    Click Element   ${BUTTON_SELECIONAR_ARQUIVO}    

Então será possível buscar um arquivo
    espera carregar e clica    ${ESTOQUE}    ${ESTOQUE}

E será possivel restaurar um backup
    espera carregar e clica    ${ARQUIVO_BKP}    ${ARQUIVO_BKP}

E confirmar a restauração
    Wait Until Page Contains Element    ${MENSAGEM_ALERTA}
    Element Should Contain Text         ${MENSAGEM_ALERTA}           Confirma a restauração
    Element Should Contain Text         ${TEXTO_MENSAGEM_ALERTA}     Atenção: você não poderá desfazer esta operação. Tem certeza que deseja continuar?
    clica e espera carregar             ${BUTTON_SIM}        ${MENSAGEM_ALERTA}
    Element Should Contain Text         ${TEXTO_MENSAGEM_ALERTA}     Operação concluída!
    Click Element    ${BUTTON_SIM}

Então o usuário deverá ter acesso as funcionalidades de restore
    Element Should Contain Text    ${TELA}    Restaurar backup
    Element Should Be Enabled      ${BUTTON_SELECIONAR_ARQUIVO}
    Element Should Be Visible      ${BUTTON_SELECIONAR_ARQUIVO}    
    Element Should Contain Text    ${BUTTON_SELECIONAR_ARQUIVO}    SELECIONAR ARQUIVO
    Element Should Contain Text    ${TEXTO_MSN_RESTORE}    Atenção: você só deve executar esta operação caso tenha trocado de aparelho ou reinstalado o aplicativo.



# TELA EXPORTAR DADOS



# TELA IMPORTAR DADOS



