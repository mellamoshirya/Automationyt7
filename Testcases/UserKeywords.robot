*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Resource  ../Resources/Resources.robot


*** Variables ***
${browser}  chrome
${url1}  https://www.develop.zillow.net/medina-wa/real-estate-agent-reviews/


*** Test Cases ***
TestingInputBox
    ${pagetitle}=   InitiateBrowser     ${url1}     ${browser}
    sleep  15 sec
    execute javascript  window.scrollTo(0,500)
    sleep  5 sec
    #scroll element into view  xpath://a[@id='doNotSell']

    log to console  ${pagetitle}
    log     ${pagetitle}

