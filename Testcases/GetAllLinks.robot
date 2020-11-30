*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.develop.zillow.net/

*** Test Cases ***
CountAllLinksPresentOnThePage
    open browser  ${url}    ${browser}
    sleep  5
    maximize browser window
    sleep  5
    ${STORED_VAR_FOR_LINKS_COUNT}=  get element count   xpath://a
    log to console  Total- ${STORED_VAR_FOR_LINKS_COUNT}


    @{LinkedItemListVar}    create list
    : For   ${i}  IN RANGE      1   ${STORED_VAR_FOR_LINKS_COUNT}+1
    \   ${LinkText}=    get text  xpath:(//a)[${i}]
    \   log to console  ${LinkText}

*** Keywords ***
closethebrowseratlast
    close  browser