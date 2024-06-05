*** Settings ***

Resource    ../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Fechar Aplicativo

*** Test Cases ***

CT001 - Deve ser possível acessar a tela de exportar dados
    Dado que usuário acessa a tela de menu
    Quando acessa a area            ${BUTTON_EXPORTAR}    ${TELA}    Exportar dados    
    Então o usuário deverá ter acesso as funcionalidades de exportação

# CT002 - Não deve ser possível exportar dados sem ter gerado registros anteriormente

CT003 - Deve ser possível exportar os dados gerados
    Dado que existe um produto cadastrado    teclado    20    25
    E que o produto tenha movimentações de entrada e saida do estoque
    Quando o usuário acessar a área de exportar dados
    Então será possível exportar os dados 
    E será possível visualizar os PDFs gerados


CT004 - Deve ser possível enviar os dados gerados
    Dado que existe um produto cadastrado    Mouse    20    15
    E que o produto tenha movimentações de entrada e saida do estoque
    Quando o usuário acessar a área de exportar dados
    Então será possível exportar os dados
    E será possivel enviar os dados

CT005 - Deve ser possível acessar a tela de importar dados
    Dado que usuário acessa a tela de menu
    Quando acessa a area            ${BUTTON_IMPORTAR}    ${TELA2}    Importar dados    
    Então o usuário deverá ter acesso as funcionalidades de importação

CT006 - Deve ser possível importar os dados de produtos
    Dado que exista um produto com movimentação de estoque já exportado
    Quando o usuário acessar a área de importar dados
    Então deverá ser possível realizar a restauração dos produtos

CT007 - Deve ser possível importar os dados de entrada
    Dado que exista um produto com movimentação de estoque já exportado
    Quando o usuário acessar a área de importar dados
    Então deverá ser possível realizar a restauração das entradas de um produto

CT008 - Deve ser possível importar os dados de saída
    Dado que exista um produto com movimentação de estoque já exportado
    Quando o usuário acessar a área de importar dados
    Então deverá ser possível realizar a restauração das saídas de um produto

CT009 - Deve ser possível importar os dados de grupo de produtos
    Dado que exista um produto com movimentação de estoque já exportado
    Quando o usuário acessar a área de importar dados
    Então deverá ser possível realizar a restauração de um grupo de produtos

CT010 - Não deve ser possível importar os dados selecionando o arquivo csv errado
    Dado que exista um produto com movimentação de estoque já exportado
    Quando o usuário acessar a área de importar dados
    Então não será possível realizar a restauração