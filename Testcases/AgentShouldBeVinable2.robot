*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  headlesschrome
${url}  https://www.candidate.zillow.net/agent-finder/real-estate-agent-reviews/


*** Test Cases ***
TestingInputBox111
    open browser  ${url}     ${browser}
    set browser implicit wait   10sec
    maximize browser window
    log to console  "Done Finish complete 2nd cases successfully"




    #closethebrowseratlast

*** Keywords ***
closethebrowseratlast
    close browser