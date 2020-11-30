*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://www.candidate.zillow.net/agent-finder/real-estate-agent-reviews/


*** Test Cases ***
TestingInputBox
    open browser  ${url}     ${browser}
    set browser implicit wait   10sec
    maximize browser window
    #click link  xpath://body[@class='znav-transparent']/div/div[@id='pfs-nav-wrapper']/div[@id='page-header-container']/header[@class='sc-iwsKbI bdaSGU znav']/nav[@class='sc-bwzfXH eAcLXO']/div[@class='sc-bxivhb ctPEyS']/ul[@class='sc-cSHVUG sc-kAzzGY sc-eNQAEJ cXCoBJ']/li[5]/a[1]
    input text  name:locationText   98116
    press key   name:locationText   \ue007
    sleep  10sec
    title should be  98116 Seattle - Realtor & Real Estate Agent Reviews | Zillow

    sleep  5

#TestingInputBox111
#    open browser  ${url}     ${browser}
#    set browser implicit wait   10sec
#    maximize browser window
#    log to console  "Done Finish complete 2nd cases successfully"




    #closethebrowseratlast

*** Keywords ***
closethebrowseratlast
    close browser