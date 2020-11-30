*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Library  SikuliLibrary
Variables   ..//PageObjects/Locators.py

*** Keywords ***
OpenMyBrowser
    [Arguments]  ${URL}     ${browser}
    open browser    ${URL}     ${browser}
    maximize browser window

EnterUserName
    [Arguments]  ${username}
    input text      ${txt_login_username}   ${username}

EnterPassword
    [Arguments]  ${password}
    input text      ${txt_login_password}   ${password}

ClickSignIn
    click button    ${BTN_login}

