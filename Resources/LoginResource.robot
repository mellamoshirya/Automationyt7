*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}  chrome
${login_url}  https://www.candidate.zillow.net/user/acct/login/

*** Keywords ***
Open my browser
    open browser  ${login_url}    ${browser}
    maximize browser window
    sleep  3
Close my browser
    close all browsers
Open login page
    go to       ${login_url}
Input username
    reload page
    sleep  5sec
    [Arguments]     ${username}
    input text  id:reg-login-email      ${username}
input password
    [Arguments]  ${pwd}
    input text  id:inputs-password      ${pwd}
click login button
    click button  xpath://input[@class='zsg-button_primary zsg-button_fullsize']
    sleep  5
Error msg should be visible
    page should contain     Incorrect email or password. Please try again or
    sleep  3
Homepage shoule be open
    homepage shoule be open      https://www.candidate.zillow.net/
