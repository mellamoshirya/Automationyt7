*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  firefox
${url}  http://testautomationpractice.blogspot.com/


*** Test Cases ***
TestingAlert
    open browser  ${url}     ${browser}
    maximize browser window
    sleep  5
    click button  xpath://button[contains(text(),'Click Me')]
    sleep  5
    #handle alert  accept
    #handle alert  dismiss alert
    #handle alert  leave
    alert should be present  Press a button!


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
