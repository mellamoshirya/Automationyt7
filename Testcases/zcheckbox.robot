*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://www.candidate.zillow.net/homes/for_sale/_rb/


*** Test Cases ***
TestingInputBox
    open browser  ${url}     ${browser}
    set browser implicit wait   5sec
    maximize browser window
    set selenium speed  1seconds
    #click button  xpath://button[@id='listing-type']//span[contains(text(),'For Sale')]
    click button  xpath://button[@id='more']
    select checkbox  homeTours_isOpenHousesOnly


#    title should be  98116 Seattle - Realtor & Real Estate Agent Reviews | Zillow
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