*** Settings ***
Library    Browser
Library    Collections
Library    OperatingSystem

*** Variables ***
${URL}    https://leguide.ancv.com/
${Search}    Restauration
${Zone}    Rennes
${file_path}    ${CURDIR}${/}restaurants.json

*** Keywords ***
Search For All Restaurants In Rennes City
    [Documentation]    This keyword searches for restaurants in Rennes City
    New Browser    headless=False
    New Page    ${URL}    domcontentloaded
    Type Text    css=#search    ${Search}
    Type Text   css=#where    ${Zone}
    Click    css=.submitFormHPSearch
    Click    css=[for="produits_acceptes_CVCO"]
    Wait For Condition    Text    css=#numResult    contains    107


Get All Restaurants
    [Documentation]    This keyword retrieves all restaurants from the search results
    ${all_restaurants}=    Create List
    ${loop_max}=    Get Max Pagination
    FOR    ${i}    IN RANGE    ${loop_max}
        # Get products on current page
        ${restaurants}    Get Elements    css=.list-card.ptl-card.mini-in-mobile
        Should Not Be Empty    ${restaurants}    No restaurants found on the page
        FOR    ${restaurant}    IN    @{restaurants}
            ${restaurant_info}    Get Restaurant Infos    ${restaurant}
            Append To List    ${all_restaurants}    ${restaurant_info}
        END
        
        #next page
        Run Keyword If    ${i} < ${loop_max} - 1    Go To The Next Page

    END
    RETURN    ${all_restaurants}
    

Get Restaurant Infos
    [Documentation]    This keyword retrieves the names of all restaurants
    [Arguments]    ${restaurant_locator}
    ${title}=    Get Text    ${restaurant_locator} >> css=.card-title
    ${href}=     Get Attribute    ${restaurant_locator}    href

    ${restaurant_info}=    Create Dictionary
    ...    title=${title}
    ...    link=${href}

    RETURN    ${restaurant_info}


Get Max Pagination
    [Documentation]    This keyword retrieves the last page number of the restaurant listings
    ${elements}=    Get Elements    css=#list-ptl-pagination [class="page-link"]
    ${last_page_element}=        Get From List    ${elements}    -1
    ${last_page_number}=    Get Text    ${last_page_element}
    #${max_pagination}=    Evaluate    int("${last_page_number}") - 1
    RETURN    ${last_page_number}


Go To The Next Page
    [Documentation]    This keyword navigates to the next page of restaurant listings
    ${active_page}=    Get Text    css=#ptl-list .pagination .page-item.active
    ${active_page}=    Convert To Integer    ${active_page}

    ${next_page}=      Evaluate    ${active_page} + 1
    ${next_page}=    Convert To String    ${next_page}

    Click    css=#list-ptl-pagination .page-link.page-link-nav >> text=">"
    Wait For Condition    Text    css=#ptl-list .pagination .page-item.active    contains    ${next_page}


Save Restaurants
    [Documentation]    This keyword saves the restaurant information to a JSON file
    [Arguments]    ${restaurants}
    ${json_data}=    Evaluate    json.dumps(${restaurants}, indent=4)    modules=json
    Create File    ${file_path}    ${json_data}    encoding=UTF-8

