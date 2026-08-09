*** Settings ***
Documentation     A resource file containing the ParkCalc app specific keywords and variables for data-driven tests.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${DELAY}          0.2
${PARKCALCPAGE}   https://robotframework.transformidea.com/app/parkcalc/
${COST_ITEM}      css:span.SubHead b
${PAGE_TITLE}     Parking Calculator

*** Keywords ***
Open Park Calc Page
    Open Browser    ${PARKCALCPAGE}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be    ${PAGE_TITLE}

Park Calc
    [Arguments]    ${parkingLot}    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Select From List By Label    id:Lot    ${parkingLot}
    Input Text    id:EntryTime    ${entryTime}
    Select Radio Button    EntryTimeAMPM    ${entryAmPm}
    Input Text    id:EntryDate    ${entryDate}
    Input Text    id:ExitTime    ${exitTime}
    Select Radio Button    ExitTimeAMPM    ${exitAmPm}
    Input Text    id:ExitDate    ${exitDate}
    Click Button    name:Submit
    Calculated Cost Should Be    ${expectedPrice}

Calculated Cost Should Be
    [Arguments]    ${expectedCost}
    ${actualCost} =    Get Text    ${COST_ITEM}
    Log    Actual costs: ${actualCost}
    Page Should Contain    ${expectedCost}

Valet Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Valet Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Short-Term Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Short-Term Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Long-Term Garage Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Long-Term Garage Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Long-Term Surface Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Long-Term Surface Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Economy Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Economy Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
