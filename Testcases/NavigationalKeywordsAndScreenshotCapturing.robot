*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  firefox
${url1}  https://www.develop.zillow.net/medina-wa/
${url2}  https://www.google.com


*** Test Cases ***
TestingInputBox
    open browser  ${url1}     ${browser}
    maximize browser window
    sleep   3

    go to       ${url2}
    ${loc}      get location
    log to console      ${loc}

    go back
    ${loc2}     get location
    log to console  ${loc2}

    capture page screenshot  C:/Users/Shriraj.Joshi/Pictures/Screenshots/D.png
    capture element screenshot      xpath://a[@class='Anchor-hn4bge-0 sc-ifAKCX hUKXFP znav-topnav-logo']//*[local-name()='svg']       C:/Users/Shriraj.Joshi/Pictures/Screenshots/G.png







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