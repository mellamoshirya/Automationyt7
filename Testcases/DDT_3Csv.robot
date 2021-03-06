*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Resource  ../Resources/LoginResource.robot
Library  DataDriver     ../TestData/LoginData2.csv
Suite Setup  Open my browser
Suite Teardown  Close my browser
Test Template  InvalidLogin

*** Test Cases ***
LoginTestWithExcel  ${username}     ${pwd}



*** Keywords ***
InvalidLogin
    [Arguments]     ${username}     ${pwd}
    Input username  ${username}
    input password  ${pwd}
    click login button
    Error msg should be visible