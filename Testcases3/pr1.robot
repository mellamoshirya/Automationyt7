*** Settings ***
Library     SeleniumLibrary
#Library  Selenium2Library
Library           Collections
Library           String
#Library     AutoitLibrary
Resource  ..//Resources/ProfileKeywords.robot
Library           OperatingSystem
#Library     DataDriver  ../TestData/LoginDataPr.xlsx    sheet_name=Sheet1
Library    FakerLibrary
Library     AutoItLibrary

*** Variables ***
${env}  https://www.qa.zillow.net
${env_tes600}  https://www.tes600.zillow.net
${browser}  headlesschrome
${CityName}  San Jose CA
${usernamepr}   us1@15.com
${pwdpr}        zillow01
${fn_Registration}      t2his_is_fn_test
${ln_Registration}      t2his_is_ln_test
${zip}      98115
${ServiceArea}     98116
${ProPredefinedBreadcrumbs}       https://www.qa.zillow.net/profile/
${y}=       45897812ScreenName/
@{Example11}    45897812ScreenName/          10062541ScreenName/     100636365ScreenName/     10063828ScreenName/   100550441ScreenName/    10081381ScreenName/
*** Test Cases ***
tc1
#Testcase to verify Search by location,name is working as expected
    OpenMyBrowser   ${env}  ${browser}
    GotoAgentFinder
    SearchByRegion&Name  ${RegionBox}       ${CityName}
    SearchByzip
    SearchByLastName
    SearchByState
    SearchByFN
    close browser
    log to console  tc1 ran till end

tc2
#Testcase to verify advance search on agent finder is working as expected
    OpenMyBrowser   ${env}  ${browser}
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    advsearch
    ForLoopTovisitAll10Profilelinks
    close browser
    log to console  tc2 ran till end

tc3
#Testcase to verify adding/registering an agent and if it is searchable on agent finder.
    OpenMyBrowser   ${env}  ${browser}
    Faker_profile
    AddAgent
    GOTOAGENTFINDER
    SearchByzipAndName
    close browser
    log to console  tc3 ran till end

tc6Modified
#Testcase to verify pagination on agent finder.
    OpenMyBrowser   ${env}  ${browser}
    GOTOAGENTFINDER
    SearchByzip
    paginate
#    Sorting
#    Paginate
    close browser
    log to console  tc6 ran till end

tc8
#Testcase to verify lead's profile
    OpenMyBrowser   ${env}  ${browser}
    GOTOAGENTFINDER
    SearchByzip
    wait until page contains    Abrahamson
    set selenium speed  2sec
    click element   ${lead}
    page should contain     Contact us
    click element   ${badge}
    Chk_URL_CONTAINS
    go back
    close browser
    log to console  tc8 ran till end

tc9
#Testcase to verify editing an agent profile and validating changes reflected on profile.
    OpenMyBrowser   ${env}  ${browser}
    set selenium speed  1sec
    ConcatinatingScreenNameURL
    Sign_in_Agent-Selected
    GoingToProfile
    Going to edit profile
    select from list by index  ${YourPronoun}    1
    click element   ${SubmitButton}
    go to   https://www.qa.zillow.net/myzillow/Profile.htm
    sleep   3sec
    should contain  ${YourPronounOnPrivateProfile}      They/Them/Theirs
    close browser
    log to console  tc9 ran till end

tc14
#Testcase to verify review flow.
    OpenMyBrowser   ${env}  ${browser}
    Faker_profile
    set selenium speed  2sec
    Register
    ConcatinatingScreenNameURL
    WrittingAReview
    ImpersonatingViaSuperadmin
    ModifyingExcerpt&PublishingReview
    close browser
    log to console  tc14 ran till end


