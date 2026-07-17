*** Settings ***

library    SeleniumLibrary
resource    ../../resources/keywords/login_keywords.resource

Test Setup    Open Login Page    chrome
Test Teardown    Close Browser


*** Test Cases ***

User Locked Out
    [Documentation]    Test case to verify that a user cannot log in with locked out credentials
    Insert Username    locked_out_user
    Insert Password    secret_sauce
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    timeout=5s
    ${Error Text} =    Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${LOCKED_OUT_USER_ERROR}    ${Error Text}