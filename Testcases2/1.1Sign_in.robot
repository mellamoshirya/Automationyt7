*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Resource  ..//Resources/LoginKeywords.robot

*** Variables ***
${URL}  https://www.qa.zillow.net/user/acct/login/
${browser}  chrome
${username}     12@12.com
${password}     zillow01

*** Test Cases ***
SignInTestSample
    OpenMyBrowser   ${URL}  ${browser}
    sleep  5sec
    EnterUserName   ${username}
    sleep  5sec
    EnterPassword   ${password}
    sleep  5sec
    ClickSignIn
    sleep  5sec

