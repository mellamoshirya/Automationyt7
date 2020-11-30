*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://www.candidate.zillow.net/


*** Test Cases ***
LoginTest
    open browser  ${url}     ${browser}
    set browser implicit wait   10sec
    maximize browser window
    click link  xpath://body[@class='znav-transparent']/div/div[@id='pfs-nav-wrapper']/div[@id='page-header-container']/header[@class='sc-iwsKbI bdaSGU znav']/nav[@class='sc-bwzfXH eAcLXO']/div[@class='sc-bxivhb ctPEyS']/ul[@class='sc-cSHVUG sc-kAzzGY sc-eNQAEJ cXCoBJ']/li[5]/a[1]
    input text  name:locationText     san jose ca
    press key   name:locationText   u'\ue007'


*** Keywords ***
closethebrowseratlast
    close browser