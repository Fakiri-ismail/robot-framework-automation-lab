*** Settings ***
Documentation     A test suite with tests for economy parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Test Setup        Input Parking Lot    Economy Parking
Resource          resource.resource
Force Tags        KDT

*** Test Cases ***
First Hour
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/04/2026    12:59    AM
    Calculated Cost Should Be    $ 4.00

Four Hours
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/04/2026    04:00    AM
    Calculated Cost Should Be    $ 16.00

Five Hours
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/04/2026    05:00    AM
    Calculated Cost Should Be    $ 20.00

First Day
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/05/2026    12:00    AM
    Calculated Cost Should Be    $ 9.00

Four Days
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/08/2026    12:00    AM
    Calculated Cost Should Be    $ 36.00

First Week
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/11/2026    12:00    AM
    Calculated Cost Should Be    $ 54.00

Three Weeks
    Input Entry Date    05/04/2026    12:00    AM
    Input Leaving Date    05/25/2026    12:00    AM
    Calculated Cost Should Be    $ 162.00
