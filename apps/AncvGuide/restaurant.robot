*** Settings ***
Resource    resource.resource

*** Test Cases ***
Get all restaurants in Rennes
    [Documentation]    This test case retrieves all restaurants in Rennes using the ANCV Guide website
    Search For All Restaurants In Rennes City
    @{restaurants}=    Get All Restaurants
    Save Restaurants    ${restaurants}