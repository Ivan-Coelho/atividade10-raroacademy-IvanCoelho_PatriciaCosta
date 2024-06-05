*** Settings ***

Resource    ../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Fechar Aplicativo

*** Test Cases ***

CT001 - Deve ser possível acessar a tela de menu
    Dado que o usuário acessa o Aplicativo
    Quando acessa a area    ${OPEN_MENU}    ${TELA}    Menu
    Então o usuário deverá ter acesso a todas as funções do menu

CT002 - Deve ser possível acessar a página de relatórios
    Dado que usuário acessa a tela de menu
    Quando acessa a tela de relatorios
    Então o usuário deverá ter acesso a todas as funçõs de relatório

CT003 - Deve ser possíve gerar um relatório de inventário de estoque
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_INVENTARIO}    ${BUTTON_GERAR}
    Então deverá ser possível gerar um relatório    Inventário de estoque
    E será possivel vizualizar o relatório gerado    inventario.pdf gerado

CT004 - Deve ser possível visualizar e enviar por email um relatório de inventário de estoque
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_INVENTARIO}    ${BUTTON_GERAR}
    Então deverá ser possível gerar um relatório    Inventário de estoque
    E será possível visualizar o PDF e também enviar por email

CT005 - Não deve ser possível gerar um relatório de entradas no estoque sem informar um periodo de datas
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_REL_ENTRADA}    ${TITULO_TELA}
    E acessa a função de gerar relatório    
    Então o sistema deverá retorna uma mensagem de alerta

CT006 - Deve ser possível gerar um relatório de entradas no estoque 
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_REL_ENTRADA}    ${TITULO_TELA}
    E seleciona um intervalo de datas    
    Então deverá ser possível gerar um relatório    Entradas no estoque
    E será possivel vizualizar o relatório gerado    relatentrada.pdf gerado em

CT007 - Deve ser possível vizualizar e enviar por email um relatório de entradas no estoque
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_REL_ENTRADA}    ${TITULO_TELA}
    E seleciona um intervalo de datas    
    Então deverá ser possível gerar um relatório    Entradas no estoque
    E será possível visualizar o PDF e também enviar por email

CT008 - Não deve ser possível gerar um relatório de saídas no estoque sem informar um periodo de datas
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_REL_SAIDA}    ${TITULO_TELA}
    E acessa a função de gerar relatório    
    Então o sistema deverá retorna uma mensagem de alerta


CT009 - Deve ser possível gerar um relatório de saídas no estoque 
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_REL_SAIDA}    ${TITULO_TELA}
    E seleciona um intervalo de datas    
    Então deverá ser possível gerar um relatório    Saídas do estoque
    E será possivel vizualizar o relatório gerado    relatsaida.pdf gerado em

CT010 - Deve ser possível vizualizar e enviar por email um relatório de saídas no estoque
    Dado que usuário acessa a tela de relatórios
    Quando acessa a opção de relatório desejada    ${BUTTON_REL_SAIDA}    ${TITULO_TELA}
    E seleciona um intervalo de datas    
    Então deverá ser possível gerar um relatório    Saídas do estoque
    E será possível visualizar o PDF e também enviar por email

