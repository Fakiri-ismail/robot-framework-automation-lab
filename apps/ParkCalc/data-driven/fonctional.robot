*** Settings ***
Documentation     A test suite with functional tests for ParkCalc in a data-driven format.
Suite Setup       Open Park Calc Page
Suite Teardown    Close Browser
Force Tags        DDT
Resource          resource.resource

*** Variables ***
#                ${entryDate} \ ${entryTime} \ ${entryAmPm} \ ${exitDate} \ ${exitTime} \ ${exitAmPm}
@{FOR_ONE_HOUR}    05/04/2010    12:00    AM    05/04/2010    01:00    AM
@{FOR_ONE_AND_A_HALF_HOUR}    05/04/2010    12:00    AM    05/04/2010    01:30    AM
@{FOR_THREE_HOURS}    05/04/2010    12:00    AM    05/04/2010    03:00    AM
@{FOR_FOUR_HOURS}    05/04/2010    12:00    AM    05/04/2010    04:00    AM
@{FOR_FIVE_HOURS}    05/04/2010    12:00    AM    05/04/2010    05:00    AM
@{FOR_SIX_HOURS}    05/04/2010    12:00    AM    05/04/2010    06:00    AM
@{FOR_SEVEN_HOURS}    05/04/2010    12:00    AM    05/04/2010    07:00    AM
@{FOR_TWELVE_HOURS}    05/04/2010    12:00    AM    05/04/2010    12:00    PM
@{FOR_TWENTY_THREE_HOURS}    05/04/2010    12:00    AM    05/04/2010    11:00    PM
@{FOR_ONE_DAY}    05/04/2010    12:00    AM    05/05/2010    12:00    AM
@{FOR_TWO_DAYS}    05/04/2010    12:00    AM    05/06/2010    12:00    AM
@{FOR_THREE_DAYS}    05/04/2010    12:00    AM    05/07/2010    12:00    AM
@{FOR_SIX_DAYS}    05/04/2010    12:00    AM    05/10/2010    12:00    AM
@{FOR_ONE_WEEK}    05/04/2010    12:00    AM    05/11/2010    12:00    AM
@{FOR_THREE_WEEKS}    05/04/2010    12:00    AM    05/25/2010    12:00    AM

*** Test Cases ***
Valet Parking Tests
    [Template]    Valet Parking
    @{FOR_ONE_HOUR}    $ 12.00
    @{FOR_FIVE_HOURS}    $ 12.00
    @{FOR_ONE_DAY}    $ 42.00
    @{FOR_THREE_DAYS}    $ 102.00

Short-Term Parking Tests
    [Template]    Short-Term Parking
    @{FOR_ONE_HOUR}    $ 2.00
    @{FOR_ONE_AND_A_HALF_HOUR}    $ 4.00
    @{FOR_THREE_HOURS}    $ 6.00
    @{FOR_TWELVE_HOURS}    $ 24.00
    @{FOR_TWENTY_THREE_HOURS}    $ 26.00
    @{FOR_TWO_DAYS}    $ 54.00

Long-Term Garage Parking Tests
    [Template]    Long-Term Garage Parking
    @{FOR_ONE_HOUR}    $ 2.00
    @{FOR_THREE_HOURS}    $ 6.00
    @{FOR_SIX_HOURS}    $ 12.00
    @{FOR_SEVEN_HOURS}    $ 14.00
    @{FOR_SIX_DAYS}    $ 72.00
    @{FOR_ONE_WEEK}    $ 72.00
    @{FOR_THREE_WEEKS}    $ 216.00

Long-Term Surface Parking Tests
    [Template]    Long-Term Surface Parking
    @{FOR_ONE_HOUR}    $ 2.00
    @{FOR_THREE_HOURS}    $ 6.00
    @{FOR_FIVE_HOURS}    $ 10.00
    @{FOR_SIX_HOURS}    $ 12.00
    @{FOR_SIX_DAYS}    $ 60.00
    @{FOR_ONE_WEEK}    $ 60.00
    @{FOR_THREE_WEEKS}    $ 180.00

Economy Parking
    [Template]    Economy Parking
    @{FOR_ONE_HOUR}    $ 4.00
    @{FOR_THREE_HOURS}    $ 12.00
    @{FOR_FOUR_HOURS}    $ 16.00
    @{FOR_FIVE_HOURS}    $ 20.00
    @{FOR_SIX_HOURS}    $ 24.00
    @{FOR_SIX_DAYS}    $ 54.00
    @{FOR_ONE_WEEK}    $ 54.00
    @{FOR_THREE_WEEKS}    $ 162.00
