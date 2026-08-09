*** Settings ***
Documentation     A resource file containing the ParkCalc app specific keywords and variables for keyword-driven tests.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}         chrome
${DELAY}           0.1
${PARKCALC URL}    http://robotframework.transformidea.com/app/parkcalc/
${COST_ITEM}       xpath=//tr[td/div[@class='SubHead'] = 'COST']/td/span/font/b
${PAGE_TITLE}      Parking Calculator

*** Keywords ***
Open ParkCalc
    Open Browser    ${PARKCALC URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be    ${PAGE_TITLE}

Input Parking Lot
    [Arguments]    ${lot}
    Select From List By Label    Lot    ${lot}

Input Entry Date
    [Arguments]    ${date}    ${time}    ${ampm}
    Input Text    EntryDate    ${date}
    Input Text    EntryTime    ${time}
    Select Radio Button    EntryTimeAMPM    ${ampm}

Input Leaving Date
    [Arguments]    ${date}    ${time}    ${ampm}
    Input Text    ExitDate    ${date}
    Input Text    ExitTime    ${time}
    Select Radio Button    ExitTimeAMPM    ${ampm}

Calculated Cost Should Be
    [Arguments]    ${cost}
    Click Button    Submit
    ${actual} =    Get Text    ${COST_ITEM}
    Log    Actual costs: ${actual}
    Page Should Contain    ${cost}
