*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Resource  ../Resources/LoginResource.robot
Suite Setup  Open my browser
Suite Teardown  Close my browser
Test Template  InvalidLogin

*** Test Cases ***      username                password
Right user empty pwd    19@1.com                ${empty}
Right user wrong pwd    19@1.com                zillow0
wrong user right pwd    19@11.com               zillow01
Wrong user empty pwd    19@111.com              ${empty}
Wrong user wrong pwd    19@111.com              zillow012345

*** Keywords ***
InvalidLogin
    [Arguments]     ${username}     ${pwd}
    Input username  ${username}
    input password  ${pwd}
    click login button
    Error msg should be visible