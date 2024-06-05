*** Settings ***

Resource    ../base.robot

*** Variables ***

${BUTTON_GRUPO_PRODUTOS}        br.com.pztec.estoque:id/btn_grupo
${BUTTON_RELATORIO}             br.com.pztec.estoque:id/btn_relatorios
${BUTTON_BACKUP}                br.com.pztec.estoque:id/btn_backup
${BUTTON_RESTORE}               br.com.pztec.estoque:id/btn_restore
${BUTTON_EXPORTAR}              br.com.pztec.estoque:id/btn_exportar
${BUTTON_IMPORTAR}              br.com.pztec.estoque:id/btn_importar
${BUTTON_ESTOQUE}               br.com.pztec.estoque:id/btn_movmto
${BUTTON_INDICAR_APP}           br.com.pztec.estoque:id/btn_share
${BUTTON_AJUDA}                 br.com.pztec.estoque:id/btn_ajuda
${BUTTON_INFORMACAO}            br.com.pztec.estoque:id/btn_vejamais

*** Keywords ***

Dado que usuário acessa a tela de menu
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${OPEN_MENU}    ${TELA}    Menu
    

Então o usuário deverá ter acesso a todas as funções do menu
    Element Should Be Visible    ${BUTTON_GRUPO_PRODUTOS}
    Element Should Be Enabled    ${BUTTON_GRUPO_PRODUTOS}
    Element Should Be Visible    ${BUTTON_RELATORIO}
    Element Should Be Enabled    ${BUTTON_RELATORIO}  
    Element Should Be Visible    ${BUTTON_BACKUP}     
    Element Should Be Enabled    ${BUTTON_BACKUP} 
    Element Should Be Visible    ${BUTTON_RESTORE}
    Element Should Be Enabled    ${BUTTON_RESTORE}
    Element Should Be Visible    ${BUTTON_EXPORTAR} 
    Element Should Be Enabled    ${BUTTON_EXPORTAR} 
    Element Should Be Visible    ${BUTTON_IMPORTAR}
    Element Should Be Enabled    ${BUTTON_IMPORTAR}
    Element Should Be Visible    ${BUTTON_ESTOQUE}
    Element Should Be Enabled    ${BUTTON_ESTOQUE}
    Element Should Be Visible    ${BUTTON_INDICAR_APP}
    Element Should Be Enabled    ${BUTTON_INDICAR_APP}
    Element Should Be Visible    ${BUTTON_AJUDA}
    Element Should Be Enabled    ${BUTTON_AJUDA}
    Element Should Be Visible    ${BUTTON_INFORMACAO}
    Element Should Be Enabled    ${BUTTON_INFORMACAO}
