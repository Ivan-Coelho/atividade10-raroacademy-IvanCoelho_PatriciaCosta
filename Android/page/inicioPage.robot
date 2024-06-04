*** Settings ***

Resource    ../base.robot
Library    String

*** Variables ***

${INCOMPATIBILIDADE_ANDROID}            android:id/button1 
${PERMISSÃO_CAMERA}                     com.android.permissioncontroller:id/permission_allow_one_time_button         
${PERMISSÃO_ARQUIVOS}                   com.android.permissioncontroller:id/permission_allow_button 

${TELA_INICIAL}                         //android.widget.TextView[@text="Cadastro de Produtos"]
${BUTTON_NOVO}                          br.com.pztec.estoque:id/Button1 
${OPEN_MENU}                            br.com.pztec.estoque:id/Button3 
${BUTTON_PESQUISAR}                     android:id/search_button
${INPUT_PESQUISA}                       android:id/search_src_text

${TELA}                                 br.com.pztec.estoque:id/textView3            
${TITULO_TELA}                          br.com.pztec.estoque:id/lbl_titulo

#PRODUTO

${BUTTON_DELETAR}            br.com.pztec.estoque:id/deletar
${BUTTON_EDITAR}             br.com.pztec.estoque:id/editar
${BUTTON_ENTRADA}            br.com.pztec.estoque:id/entrada
${BUTTON_SAIDA}              br.com.pztec.estoque:id/saida 

${TEXTO_QUANTIDADE_ATUAL}    new UiSelector().text("Quantidade atual")
${TEXTO_ADICIONAR_ESTOQUE}   (//android.widget.TextView[@text="Adicionar estoque"])[2]
${INPUT_NOVA_QTD_SOMA}       br.com.pztec.estoque:id/txt_qtdentrada 
${TEXTO_DIMINUIR_ESTOQUE}    (//android.widget.TextView[@text="Diminuir estoque"])[2]
${INPUT_NOVA_QTD_SUB}        br.com.pztec.estoque:id/txt_qtdsaida  
${TEXTO_MOTIVO}              //android.widget.TextView[@text="Motivo"]
${TEXTO_DOC_REFERENCIA}      //android.widget.TextView[@text="Doc/Ref."]

${BUTTON_SALVAR_AUT}         br.com.pztec.estoque:id/btn_salvar   

${MENSAGEM_ALERTA}           android:id/alertTitle
${TEXTO_MENSAGEM_ALERTA}     android:id/message
${BUTTON_NAO}                android:id/button2
${BUTTON_SIM}                android:id/button1

*** Keywords ***

Incompatibilidade de versão
    Wait Until Page Contains Element    ${INCOMPATIBILIDADE_ANDROID}
    clica e espera carregar             ${INCOMPATIBILIDADE_ANDROID}     ${TELA_INICIAL}
    # clica e espera carregar             ${PERMISSÃO_CAMERA}             ${PERMISSÃO_ARQUIVOS}
    # clica e espera carregar             ${PERMISSÃO_ARQUIVOS}           ${TELA_INICIAL}

Dado que o usuário acessa o Aplicativo
    verifica tela inicial
    Element Should Contain Text    ${TELA_INICIAL}    Cadastro de Produtos

Dado que o usuário está na página inicial
    Element Should Contain Text    ${TELA_INICIAL}    Cadastro de Produtos

Quando acessa a area
    [Arguments]        ${elemento}    ${tela}    ${texto}
    clica e espera carregar    ${elemento}    ${TELA}
    Element Should Contain Text    ${tela}    ${texto}



#TEXTE DE BUSCA POR PRODUTO

Quando o usuário pesquisar por um produto
    [Arguments]    ${texto_pesquisado}
    espera carregar e clica    ${BUTTON_PESQUISAR}   ${BUTTON_PESQUISAR}
    espera carregar e digita    ${INPUT_PESQUISA}    ${texto_pesquisado}
    Press Keycode    66

Então deve será possivel visualizar o produto pesquisado
    
    Element Should Contain Text    ${INPUT_DESCRICAO}         Playstation3    
    Element Should Contain Text    ${INPUT_QUANTIDADE}        2
    Element Should Contain Text    ${INPUT_VALOR_UNITARIO}    3.000,00

Então não devera encontrar nenhum produto
    Page Should Not Contain Element    ${PRODUTO}
