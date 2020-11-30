*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://www.candidate.zillow.net/homes/for_sale/_rb/


*** Test Cases ***
TestingInputBox
    open browser  ${url}     ${browser}
    ${spd}=     get selenium speed
    log to console      "speed=",${spd}
    set selenium speed  3 seconds
    #set browser implicit wait   5sec
    maximize browser window
    #click button  xpath://button[@id='listing-type']//span[contains(text(),'For Sale')]
    click button  xpath://button[@id='more']
    select from list by index  parkingSpots     3

    ${spd}=     get selenium speed
    log to console  "speed="${spd}
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

*** Keywords ***
closethebrowseratlast
    close browser