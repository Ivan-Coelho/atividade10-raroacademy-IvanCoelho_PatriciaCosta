*** Settings ***

Resource    ../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Fechar Aplicativo

*** Test Cases ***

CT001 - Deve ser possível acessar a pagina de BACKUP
    Dado que usuário acessa a tela de menu
    Quando acessa a tela de BACKUP
    Então o usuário deverá ter acesso as funcionalidades de BACKUP 

CT002 - Deve ser possível gerar um BACKUP
    Dado que usuário acessa a tela de backup
    Quando gerar um backup
    Então o backup deverá ser gerado com sucesso    

CT003 - Deve ser possível enviar um BACKUP
    Dado que usuário acessa a tela de backup
    Quando gerar um backup
    Então deverá ser possível enviar o backup com sucesso

CT004 - Deve ser possível acessar a página de RESTORE
    Dado que usuário acessa a tela de menu
    Quando acessa a tela de RESTORE
    Então o usuário deverá ter acesso as funcionalidades de restore

CT005 - Deve ser possível restaurar um arquivo de de BACKUP
    Dado que usuário fez um backup    
    Quando acessar a tela de RESTORE
    E acessar a funcionalidade de selecionar arquivo
    Então será possível buscar um arquivo
    E será possivel restaurar um backup
    E confirmar a restauração

