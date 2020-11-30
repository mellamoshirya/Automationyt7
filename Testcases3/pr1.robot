*** Settings ***
Library     SeleniumLibrary
#Library  Selenium2Library
Library           Collections
Library           String
Library     AutoitLibrary
Resource  ..//Resources/ProfileKeywords.robot
Library           OperatingSystem
#Library     DataDriver  ../TestData/LoginDataPr.xlsx    sheet_name=Sheet1
Library    FakerLibrary

*** Variables ***
${env}  https://www.qa.zillow.net
${env_tes600}  https://www.tes600.zillow.net
${browser}  chrome
${CityName}  San Jose CA
${usernamepr}   us1@15.com
${pwdpr}        zillow01
${fn_Registration}      this_is_fn_test
${ln_Registration}      this_is_ln_test
${zip}      98115
${ServiceArea}     98116

*** Test Cases ***
tc1
#    OpenMyBrowser   ${env}  ${browser}
#    GOTOAGENTFINDER
#    SearchByRegion&Name  ${RegionBox}       ${CityName}
#    SearchByzip
#    SearchByLastName
#    SearchByState
#    SearchByFN
#    close browser
    log to console  tc1 ran till end
tc2

#    OpenMyBrowser   ${env}  ${browser}
#    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
#    advsearch
#    ForLoopTovisitAll10Profilelinks
    log to console  tc2 ran till end

tc3
#    OpenMyBrowser   ${env}  ${browser}
#    AddAgent
#    GOTOAGENTFINDER
#    SearchByzipAndName
    log to console  tc3 ran till end

tc6Modified
#    OpenMyBrowser   ${env}  ${browser}
#    GOTOAGENTFINDER
#    SearchByzip
#    paginate
#    Sorting
#    Paginate
    log to console  tc6 ran till end

tc8
#    OpenMyBrowser   ${env}  ${browser}
#    GOTOAGENTFINDER
#    SearchByzip
#    wait until page contains    Abrahamsonn
#    set selenium speed  2sec
#    click element   ${lead}
#    page should contain     Contact us
#    click element   ${badge}
#    Chk_URL_CONTAINS
#    go back
    log to console  tc8 ran till end

tc9
#    OpenMyBrowser   ${env}  ${browser}
#    Sign_in_Agent-131133007
#    GoingToProfile
#    Going to edit profile
#    press keys      ${ServiceAreas}     Carnation      TAB     SPACE
#    click element   ${SubmitButton}
#    page should contain     Carnation, WA
    log to console  tc9 ran till end

tc14
    OpenMyBrowser   ${env}  ${browser}
    Faker_profile
    set selenium speed  2sec
    Register
    go to   https://www.qa.zillow.net/profile/81179279ScreenName/
    WrittingAReview


    log to console  tc14 ran till end
