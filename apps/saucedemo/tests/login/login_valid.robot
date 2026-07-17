*** Settings ***

library    SeleniumLibrary
resource    ../../resources/keywords/login_keywords.resource

Test Setup    Open Login Page    headlesschrome
Test Teardown    Close Browser


*** Test Cases ***

User Login Successfully
    [Documentation]    Test case to verify that a user can log in successfully with valid credentials.
    Insert Username    standard_user
    Insert Password    secret_sauce
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${PRODUCTS_PAGE_TITLE}    timeout=5s