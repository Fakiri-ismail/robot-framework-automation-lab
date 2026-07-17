*** Settings ***
library    SeleniumLibrary
resource    ../variables/login_page.resource
resource    ../variables/urls.resource


*** Keywords ***
Open Login Page
    [Documentation]    Opens the login page of the application.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Insert Username
    [Documentation]    Inserts the username into the username input field.
    [Arguments]        ${USERNAME}
    Input Text    ${USERNAME_INPUT}    ${USERNAME}

Insert Password
    [Documentation]    Inserts the password into the password input field.
    [Arguments]        ${PASSWORD}
    Input Password    ${PASSWORD_INPUT}    ${PASSWORD}