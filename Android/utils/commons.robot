*** Settings ***

Resource    ../base.robot

*** Keywords ***

clica e espera carregar
    [Arguments]    ${elemento}    ${elementoCarregado}   
    Click Element    ${elemento}
    Wait Until Element Is Visible    ${elementoCarregado}

espera carregar e clica
    [Arguments]    ${elemento}    ${elementoCarregado}
    Wait Until Element Is Visible    ${elementoCarregado}   
    Click Element    ${elemento}

espera carregar e visualiza
    [Arguments]    ${elemento} 
    Wait Until Element Is Visible     ${elemento}
    Element Should Be Visible         ${elemento}

Verifica texto
    [Arguments]    ${elemento}    ${texto}
    ${contenDesc}=     AppiumLibrary.Get Element Attribute    ${elemento}    content-desc    
    Should Contain    ${contenDesc}    ${texto}

espera carregar e digita
    [Arguments]    ${elemento}    ${texto}
    Wait Until Element Is Visible   ${elemento}
    Input Text    ${elemento}    ${texto}