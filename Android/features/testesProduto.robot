*** Settings ***
Resource    ../base.robot
Resource    ../page/inicioPage.robot

Test Setup       Abrir Aplicativo
Test Teardown    Fechar Aplicativo

*** Test Cases ***

CT001 - não deve ser possível cadastrar um novo produto sem preencher o campo descrição
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o campo quantidade    10
    E preenche o campo valor unitário    14.99
    E salva a operação
    Então o sistema deverá retornar uma mensagem de erro e permanecer na página de produtos    ${INPUT_DESCRICAO}

CT002 - não deve ser possível cadastrar um novo produto sem preencher o campo quantidade
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o campo descrição    Mouse
    E preenche o campo valor unitário    14.99
    E salva a operação
    Então o sistema deverá retornar uma mensagem de erro e permanecer na página de produtos    ${INPUT_QUANTIDADE}

CT003 - não deve ser possível cadastrar um novo produto sem preencher o campo valor unitário
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o campo descrição    Mouse
    E preenche o campo quantidade    10
    E salva a operação
    Então o sistema deverá retornar uma mensagem de erro e permanecer na página de produtos    ${INPUT_VALOR_UNITARIO}

CT004 - deve ser possível cadastrar um novo produto preenchendo todos os campos do formulário corretamente 
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o formulário    1010    sem fio    mouse    10    74.99    001
    E salva a operação
    Então o usuário será redirecionado para a página inicial
    E o produto deve deverá ser cadastrado com sucesso

CT005 - deve ser possível cadastrar um novo produto preenchendo apenas os campos obrigatórios 
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${BUTTON_NOVO}    ${TELA}    Produto
    E preenche o formulário    ${EMPTY}    sem fio    ${EMPTY}    10    74.99    ${EMPTY}
    E salva a operação
    Então o usuário será redirecionado para a página inicial
    E o produto deve deverá ser cadastrado

CT006 - Cadastro de produto    
    [Template]    Cadastro de produto    
       
        1010     com fio      mouse       10         14.99      001
        2020     sem fio      teclado     ${EMPTY}    100       001
        2020     sem fio      teclado     05       ${EMPTY}     001
        2020     com fio      teclado     15         25.99      001
        2020     sem fio      teclado     05          100       001
        2020     ${EMPTY}     teclado     05          100       001
        1010     sem fio      mouse       10         74.99      001

      
  

CT007 - Deve ser possível acrescentar produtos ao estoque
    Dado que existe um produto cadastrado    sem fio    10    74.99    
    Quando o usuário acessar a opção de entrada de produtos
    E informar a quantidade de produtos a ser modificada    ${INPUT_NOVA_QTD_SOMA}    5
    E confirmar a operação
    Então o sistema deverá mostar a quantidade de produtos atualizada

CT008 - Deve ser possível diminuir produtos do estoque
    Dado que existe um produto cadastrado    sem fio    10    74.99    
    Quando o usuário acessar a opção de saida de produtos
    E informar a quantidade de produtos a ser modificada    ${INPUT_NOVA_QTD_SUB}    5
    E confirmar a operação
    Então o sistema deverá mostar a quantidade de produtos atualizada

CT009 - Não deve ser possível diminuir produtos deixando o estoque negativo
    Dado que existe um produto cadastrado    sem fio    10    74.99   
    Quando o usuário acessar a opção de saida de produtos
    E informar a quantidade de produtos a ser modificada    ${INPUT_NOVA_QTD_SUB}    15
    E tenta confirmar a operação 
    Então o sistema deverá retornar uma mensagem de erro  
    E a quantidade de produtos no estoque não deve ser alterada


CT010 - Deve ser possível deletar produtos do estoque
    Dado que existe um produto cadastrado    sem fio    10    74.99   
    Quando usuário acessa a opção de deletar produtos
    E confirma a exclução    
    Então o produto não deve existir no sistema

CT011 - Deve ser possível editar as informações de um produto
    Dado que existe um produto cadastrado    sem fio    10    74.99
    Quando usuário acessa a opção de editar produtos
    E preenche o formulário    2020    com fio    teclado    15    24.99    001
    E salva a operação
    Então os dados do produto deverão ser atualizados

CT012 - Deve ser possível zerar produtos do estoque
    Dado que existe um produto cadastrado    sem fio    10    74.99   
    Quando o usuário acessar a opção de saida de produtos
    E informar a quantidade de produtos a ser modificada    ${INPUT_NOVA_QTD_SUB}    10
    E confirmar a operação
    Então o sistema deverá mostar que existe zero produtos no estoque


CT013 - Deve ser possível pesquisar por um produto    
    Dado que exitem varios produtos cadastrados
    Quando o usuário pesquisar por um produto    Playstation3
    Então deve será possivel visualizar o produto pesquisado

CT014 - Pesquisar por um produto não cadastrado não deve encontrar nenhum produto
    Dado que exitem varios produtos cadastrados
    Quando o usuário pesquisar por um produto    Mouse
    Então não devera encontrar nenhum produto
        
