*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url1}  https://www.develop.zillow.net/medina-wa/
${url2}  https://www.develop.zillow.net/homes/nyc_rb/


*** Test Cases ***
TestingInputBox
    open browser  ${url1}     ${browser}
    maximize browser window
    sleep   3

    open browser  ${url2}   ${browser}
    maximize browser window
    sleep   3

    switch browser  1
    ${title1}=   get title
    log to console      ${title1}

    sleep      2
    switch browser  2
    ${title2}=   get title
    log to console      ${title2}

    sleep   3







#
##    title should be  98116 Seattle - Realtor & Real Estate Agent Reviews | Zillow
#
#    ${"agentname"}  set variable  name:name
#    element should be visible       ${"agentname"}
#    element should be enabled       ${"agentname"}
#    input text  name:name       ${"agentname"}
#    sleep  5
#    clear element text  ${"agentname"}
#    sleep  5
#
#
#    closethebrowseratlast

#    close all browsers
*** Keywords ***
closethebrowseratlast
    close  browser