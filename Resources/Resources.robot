*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary

*** Keywords ***
InitiateBrowser
    [Arguments]     ${AppUrl}   ${AppBrowser}
    open browser  ${AppUrl}   ${AppBrowser}
    maximize browser window
    sleep   5 sec

    ${title}=    get title
    [Return]    ${title}