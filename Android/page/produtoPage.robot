** Settings ***

Resource    ../base.robot
Library    XML

*** Variables ***

${TEXTO_CODIGO}               //android.widget.TextView[@text="Código"]
${TEXTO_DESCRICAO}            //android.widget.TextView[@text="Descrição"]
${TEXTO_UNIDADE}              //android.widget.TextView[@text="Unidade"]
${TEXTO_QUANTIDADE}           //android.widget.TextView[@text="Quantidade"]   
${TEXTO_VALOR_UNITARIO}       //android.widget.TextView[@text="Val.Unit."]   
${TEXTO_LOTE}                 //android.widget.TextView[@text="Lote"]
${TEXTO_VALIDADE}             //android.widget.TextView[@text="Validade"]

${INPUT_CODIGO}               br.com.pztec.estoque:id/txt_codigo
${INPUT_DESCRICAO}            br.com.pztec.estoque:id/txt_descricao          
${INPUT_UNIDADE}              br.com.pztec.estoque:id/txt_unidade
${INPUT_QUANTIDADE}           br.com.pztec.estoque:id/txt_quantidade      
${INPUT_VALOR_UNITARIO}       br.com.pztec.estoque:id/txt_valunit              
${INPUT_LOTE}                 br.com.pztec.estoque:id/txt_lote
${INPUT_VALIDADE}             br.com.pztec.estoque:id/data

${PRODUTO_ID}                 br.com.pztec.estoque:id/txt_idprod
${PRODUTO_GERAL}              br.com.pztec.estoque:id/txt_descateg     

${BUTTON_SALVAR}              br.com.pztec.estoque:id/btn_gravar_assunto

${PRODUTO}                    br.com.pztec.estoque:id/linha_parte1

${LAYOUT}                     /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout


*** Keywords ***

E preenche o campo quantidade
    [Arguments]    ${quantidade}
    Input Text    ${INPUT_QUANTIDADE}    ${quantidade}

E preenche o campo descrição
    [Arguments]    ${descrição}    
    Input Text    ${INPUT_DESCRICAO}    ${descrição}

E preenche o campo valor unitário
    [Arguments]    ${valorUnit}
    Input Text    ${INPUT_VALOR_UNITARIO}    ${valorUnit}

E salva a operação
    Click Element    ${BUTTON_SALVAR}

Então o sistema deverá retornar uma mensagem de erro e permanecer na página de produtos
   [Arguments]    ${elemento}
   clica e espera carregar    ${elemento}    ${elemento}   
   Element Should Contain Text    ${TELA}    Produto

Então o usuário será redirecionado para a página inicial
    espera carregar e visualiza    ${TELA_INICIAL}
    Element Should Contain Text    ${TELA_INICIAL}    Cadastro de Produtos

E o produto deve deverá ser cadastrado com sucesso
    Element Should Contain Text    ${INPUT_CODIGO}            1010
    Element Should Contain Text    ${INPUT_DESCRICAO}         sem fio
    Element Should Contain Text    ${INPUT_UNIDADE}           mouse 
    Element Should Contain Text    ${INPUT_QUANTIDADE}        10
    Element Should Contain Text    ${INPUT_VALOR_UNITARIO}    74,99
    Element Should Contain Text    ${INPUT_LOTE}              001
    Element Should Be Visible      ${PRODUTO_ID}
    Element Should Be Visible      ${PRODUTO_GERAL}

E o produto deve deverá ser cadastrado    
    Element Should Contain Text    ${INPUT_DESCRICAO}         sem fio    
    Element Should Contain Text    ${INPUT_QUANTIDADE}        10
    Element Should Contain Text    ${INPUT_VALOR_UNITARIO}    74,99    
    Element Should Be Visible      ${PRODUTO_ID}
    Element Should Be Visible      ${PRODUTO_GERAL}

Então o produto não sera cadastrado e o usuário permanecerá na página de Produtos
    Element Should Contain Text    ${TELA}    Produto
    Press Keycode    4    
    Press Keycode    4
    Wait Until Page Contains Element    ${BUTTON_PESQUISAR}                     android:id/search_button
    Element Should Contain Text    ${TELA_INICIAL}    Cadastro de Produtos
    
verifica tela inicial
    FOR    ${index}    IN RANGE    1           
    ${INCOMPATIBILIDADE}=    Run Keyword And Return Status    Element Should Be Visible    ${INCOMPATIBILIDADE_ANDROID}
    ${INICIO}=               Run Keyword And Return Status    Element Should Be Visible    ${TELA_INICIAL}        
        Run Keyword If        '${INCOMPATIBILIDADE}'== "True"      Incompatibilidade de versão                      
        ...    ELSE    Run Keyword If    '${INICIO}'== "True"      Então o usuário será redirecionado para a página inicial                      
        END


# verifica telas iniciais
#     FOR   ${index}    IN RANGE    1    15
#        ${INCOMPATIBILIDADE}=     Run Keyword And Return Status    Element Should Be Visible    ${INCOMPATIBILIDADE_ANDROID}
#        ${INICIO}=               Run Keyword And Return Status    Element Should Be Visible    ${TELA_INICIAL}     
#             IF    '${INCOMPATIBILIDADE}'==     ${} NAO ACEITA O ELSE NESSE PONTO
#                 Call Keyword
#             ELSE IF
                
#             END
#     END

E preenche o formulário
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valorUnit}    ${lote}
    Clear Text     ${INPUT_DESCRICAO}
    Clear Text     ${INPUT_QUANTIDADE}
    Clear Text     ${INPUT_VALOR_UNITARIO}
    Input Text     ${INPUT_CODIGO}             ${codigo}
    Input Text     ${INPUT_DESCRICAO}          ${descricao}
    Input Text     ${INPUT_UNIDADE}            ${unidade}   
    Input Text     ${INPUT_QUANTIDADE}         ${quantidade}
    Swipe By Percent    50    50    50    20
    Input Text     ${INPUT_VALOR_UNITARIO}     ${valorUnit}
    Input Text     ${INPUT_LOTE}               ${lote}
    
Então o sistema devera responder de acordo
    FOR    ${index}    IN RANGE    1       
    ${TELA_INICIO}=     Run Keyword And Return Status    Element Should Be Visible    ${TELA_INICIAL}
    ${TELA_PRODUTO}=    Run Keyword And Return Status    Element Should Contain Text    ${TELA}    Produto            
        Run Keyword If                   '${TELA_INICIO}'== "True"       Então o usuário será redirecionado para a página inicial                     
        ...    ELSE    Run Keyword If    '${TELA_PRODUTO}'== "True"      Então o produto não sera cadastrado e o usuário permanecerá na página de Produtos                      
        END


Cadastro de produto   
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valorUnit}    ${lote}   
    verifica tela inicial
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o formulário    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valorUnit}    ${lote}
    E salva a operação
    Então o sistema devera responder de acordo


# TESTES DAS FUNCIONALIDADES DE PRODUTO

Dado que existe um produto cadastrado
    [Arguments]    ${descricao}    ${quantidade}    ${preço}
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o formulário    ${EMPTY}    ${descricao}    ${EMPTY}    ${quantidade}    ${preço}    ${EMPTY}
    E salva a operação
    Então o usuário será redirecionado para a página inicial


Dado que exitem varios produtos cadastrados
    FOR    ${counter}    IN RANGE    1    6    
        Dado que existe um produto cadastrado    Playstation${counter}    2    ${counter}000
        
    END

Quando o usuário acessar a opção de entrada de produtos
    espera carregar e clica    ${BUTTON_ENTRADA}    ${BUTTON_PESQUISAR}

Quando o usuário acessar a opção de saida de produtos
    espera carregar e clica    ${BUTTON_SAIDA}    ${BUTTON_PESQUISAR}

Quando usuário acessa a opção de deletar produtos
    espera carregar e clica    ${BUTTON_DELETAR}    ${BUTTON_PESQUISAR}

Quando usuário acessa a opção de editar produtos
    espera carregar e clica    ${BUTTON_EDITAR}    ${BUTTON_PESQUISAR}

E informar a quantidade de produtos a ser modificada
    [Arguments]    ${elemento}    ${QUANTIDADE_AUTERADA}    
    Input Text     ${elemento}    ${QUANTIDADE_AUTERADA}

E confirmar a operação
    clica e espera carregar    ${BUTTON_SALVAR_AUT}    ${BUTTON_PESQUISAR}

E tenta confirmar a operação
    clica e espera carregar    ${BUTTON_SALVAR_AUT}    ${MENSAGEM_ALERTA}

E confirma a exclução
    espera carregar e clica    ${BUTTON_SIM}    ${MENSAGEM_ALERTA}



Então o sistema deverá mostar a quantidade de produtos atualizada
    Element Should Contain Text    ${INPUT_QUANTIDADE}        5

Então o sistema deverá mostar que existe zero produtos no estoque
    Element Should Contain Text    ${INPUT_QUANTIDADE}        0

Então o sistema deverá retornar uma mensagem de erro
    Element Should Be Visible      ${MENSAGEM_ALERTA}
    Element Should Contain Text    ${MENSAGEM_ALERTA}          Mensagem
    Element Should Contain Text    ${TEXTO_MENSAGEM_ALERTA}    Estoque insuficiente
    Click Element       ${BUTTON_SIM}         


E a quantidade de produtos no estoque não deve ser alterada
    Press Keycode    4
    Press Keycode    4
    Wait Until Page Contains Element    ${BUTTON_PESQUISAR}
    Element Should Contain Text    ${INPUT_QUANTIDADE}        10

Então o produto não deve existir no sistema
    espera carregar e visualiza    ${BUTTON_PESQUISAR}
    Page Should Not Contain Element       ${PRODUTO_ID}

Então os dados do produto deverão ser atualizados
    Wait Until Element Is Visible    ${BUTTON_PESQUISAR}
    Element Should Contain Text      ${INPUT_CODIGO}            2020
    Element Should Contain Text      ${INPUT_DESCRICAO}         com fio
    Element Should Contain Text      ${INPUT_UNIDADE}           teclado 
    Element Should Contain Text      ${INPUT_QUANTIDADE}        15
    Element Should Contain Text      ${INPUT_VALOR_UNITARIO}    24,99
    Element Should Contain Text      ${INPUT_LOTE}              001
    Element Should Be Visible        ${PRODUTO_ID}
    Element Should Be Visible        ${PRODUTO_GERAL}


