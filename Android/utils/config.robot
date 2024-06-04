*** Settings ***

Resource    ../base.robot

*** Variables ***

${ANDROID_AUTOMATION_NAME}     UIAutomator2
${ANDROID_PLATFORM_NAME}       Android
${ANDROID_PLATFORM_VERSION}    14
${APP_PACKAGE}                 br.com.pztec.estoque
${APP_ACTIVITY}                .Inicio


*** Keywords ***
*** Keywords ***
Abrir Aplicativo
    Open Application     http://127.0.0.1:4723    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}     
    ...    platformVersion=${ANDROID_PLATFORM_VERSION}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    autoGrantPermissions=${true}
    
Fechar Aplicativo   
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications