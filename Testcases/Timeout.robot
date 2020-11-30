*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  firefox
${url}  https://www.candidate.zillow.net/homes/for_sale/_rb/


*** Test Cases ***
TestingInputBox
    open browser  ${url}     ${browser}
    maximize browser window
    wait until page contains  Ad
    #click button  xpath://button[@id='listing-type']//span[contains(text(),'For Sale')]
    click button  xpath://button[@id='more']

    select from list by index  parkingSpots     3

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

    close all browsers
*** Keywords ***
closethebrowseratlast
    close  browser