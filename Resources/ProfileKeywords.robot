*** Settings ***
Library     SeleniumLibrary
#Library  Selenium2Library
Library     BuiltIn
Library           Collections
Library     String
Variables   ..//PageObjects/Pr_locators.py
Resource  ..//Resources/ProfileKeywords.robot
#Library     DataDriver      ../TestData/LoginDataPr.xlsx    sheet_name=Sheet1
Library    FakerLibrary
*** Variables ***

${env}  https://www.qa.zillow.net
${browser}  chrome
${CityName}  'San Jose CA'
${AgentName}   Ines Han
${BusinessName}     Westbrook Realty
${PATTERN1}      ^<a href="/profile/
${EXPECTED1}     <a href="/profile/68467184ScreenName/
${lang}
${my_address}       1814 12th Ave S, Seattle, WA 98144
*** Keywords ***
OpenMyBrowser
    [Arguments]  ${env}     ${browser}
    open browser     ${env}     ${browser}
    maximize browser window
    sleep  3sec

GotoAgentFinder
    log to console  GoingOnAgentFinder
    sleep   10sec
 #   click element   ${AgentFinder}
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    title should be  Realtor & Real Estate Agent Reviews | Zillow

SearchByRegion&Name
    log to console  SearchingByRegionName&AgentName
    [Arguments]  ${RegionBox}   ${CityName}
    press keys  ${RegionBox}       ${CityName}      ENTER
    title should be  San Jose CA Realtor & Real Estate Agent Reviews | Zillow
    sleep  2sec
    press keys  ${NameBox}      ${AgentName}            ENTER
    wait until page contains    Ines Han
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    press keys  ${NameBox}      ${BusinessName}     ENTER
    wait until page contains    Westbrook Realty

SearchByzip
    log to console  SearchingByZIP
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    sleep  3sec
    clear element text      ${RegionBox}
    press keys  ${RegionBox}      ${ServiceArea}     ENTER
   # wait until page contains    98116 Seattle - Realtor & Real Estate Agent Reviews | Zillow

SearchByLastName
    log to console  SearchingByLN
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    sleep  3sec
    clear element text      ${NameBox}
    press keys          ${NameBox}      Shumbo      ENTER
    wait until page contains        Alexey Shumbo

SearchByState
    log to console  SearchingByState
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    sleep  3sec
    clear element text      ${NameBox}
    clear element text      ${RegionBox}
    sleep  2sec
    press keys          ${RegionBox}      WA      ENTER
    wait until page contains    Sorry! The location you entered contains too many agents.

SearchByFN
    log to console  SearchingByFN
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    sleep  3sec
    clear element text      ${NameBox}
    clear element text      ${RegionBox}
    sleep  2sec
    press keys          ${NameBox}      Kammie       ENTER
    sleep  3sec
    wait until page contains    Kammie Ade

AdvSearch
    log to console  SearchingByAdvOption
    sleep  3 sec
    press keys      ${RegionBox}      98117     ENTER
    sleep  15 sec
    click element  ${AdvDD}
    sleep  2 sec
    click element  ${Adv_lan_dd}
    select from list by value   ${Adv_lan_dd}       1024
    sleep  5 sec
    click element  ${Adv_spe_dd}
    select from list by value   ${Adv_spe_dd}   ShortSale
    sleep   3sec
    set selenium speed  2sec

ForLoopTovisitAll10Profilelinks
    sleep   4sec
    ${counter}=    Set Variable     1
    @{elems}    Get Webelements    ${t3}
    FOR     ${i}    IN       @{elems}
            sleep   3sec
            Click Element    ${i}   SHIFT+CTRL
            wait until page contains    Short-Sale
            ${title_var}=        get window titles
            Select Window       title=${title_var}[1]
            close window
            Select Window       title=${title_var}[0]
            ${counter}=     Evaluate     ${counter} + 1
            Log To Console    ${counter}
            Exit For Loop If     ${counter} > 4
    END

AddAgent
    wait until page contains    Sign in
    set selenium speed  2sec
    click element   ${sign_in}
    sleep   5sec
    click element   ${RegisterTab}
    set selenium speed  0sec
    input text  ${EmailPlaceholder}     ${usernamepr}
    input text  ${PwdPlaceholder}       ${pwdpr}
    press keys  ${PwdPlaceholder}       TAB     TAB     SPACE
    select from list by index   ${protype}      1
    input text  ${fn_Reg}   ${fn_Registration}
    input text  ${ln_Reg}   ${ln_Registration}
    input text  ${zip_ref}  ${zip}
    press keys  ${ph_no}    206     TAB     665     TAB     6667    TAB     SPACE
    sleep   4sec
    input text  ${BrokerageName}        TestBrokerageName
    input text  ${BrokerageAddress}     7500 Roosevelt Way NE
    press keys  ${city}     Seattle
    select from list by index  ${State}    56
    input text      ${ZIP1}      98116
    press keys  ${ServiceAreas}     ${ServiceArea}       ENTER
    click element   ${SubmitButton}

SearchByzipAndName
    set selenium speed  1sec
    log to console  SearchingByZIP
    go to   https://www.qa.zillow.net/agent-finder/real-estate-agent-reviews/
    sleep  3sec
    press keys  ${RegionBox}      ${ServiceArea}    TAB     TAB     this_is_fn_test this_is_ln_test   ENTER
    wait until page contains    this_is_fn_test this_is_ln_test

Paginate
    sleep   6sec
    click element   ${NEXT_PG}
    sleep   6sec
    ${cur_url}=     get location
    should contain  ${cur_url}    page=2

Sorting
    sleep   3sec
    set selenium speed  2sec
    click element   ${sorting}
    click element   ${sorting_opn}

Chk_URL_CONTAINS
    ${cur_url2}=     get location
    should contain  ${cur_url2}    /#reviews

Register
    wait until page contains    Sign in
    set selenium speed  4sec
    click element   ${sign_in}
    sleep   4sec
    click element   ${RegisterTab}
    set selenium speed  0sec
    input text  ${EmailPlaceholder}     ${F_email}
    input text  ${PwdPlaceholder}       ${pwdpr}
    press keys  ${PwdPlaceholder}       TAB     TAB     TAB     SPACE
    sleep   2sec

Sign_in_Agent-131133007
    wait until page contains    Sign in
    set selenium speed  2sec
    click element   ${sign_in}
    sleep   5sec
    #click element   ${email_to_enter}
    input text  ${email_to_enter}     131133007@tes.zillow.local
    input text  ${pwd_to_enter}       zillow
    press keys  ${pwd_to_enter}     TAB     SPACE

GoingToProfile
    sleep   3sec
    set selenium speed  2sec
    mouse over  ${mo}
    click element   ${dd_profile}

Going to edit profile
    set selenium speed  2sec
    click element  ${Edit_dd}
    click element   ${profileOpn}


Faker_profile
        ${F_address} =  FakerLibrary.address
        ${F_country} =  FakerLibrary.country
        ${F_email} =  FakerLibrary.email
        ${F_first_name} =  FakerLibrary.first_name
        ${F_last_name} =  FakerLibrary.last_name
        ${F_phone_number} =  FakerLibrary.phone_number
        ${F_profile} =  catenate
        ...             ${\n}=======================================
        ...             ${\n}first_name: ${F_first_name}
        ...             ${\n}last_name: ${F_last_name}
        ...             ${\n}address: ${F_address}
        ...             ${\n}country: ${F_country}
        ...             ${\n}email: ${F_email}
        ...             ${\n}phone_number: ${F_phone_number}
        ...             ${\n}=======================================
        log to console  ${F_profile}
        set suite variable  ${F_email}
        set suite variable  ${F_address}

WrittingAReview

    click element   ${WaReviewBtn}
    sleep   8sec
    click element   ${stars}
    input text  ${ReviewMsgBox}     How likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX Groso
    click element   ${Review_Terms}
    select from list by value   ${Review_ServiceProvided}      3
    input text      ${Rev_Address}      ${my_address}
    click element   ${war_poc}
    input text      ${war_poc_name}     AssociateIam
    input text   ${Rev_YoS}      2010
    sleep   4sec
    click element    ${sub_review_btn}
    sleep   2sec
    wait until page contains       Review submitted


ImpersonatingViaSuperadmin
    Go to   https://www.qa.zillow.net/Logout.htm
    wait until page contains    Sign in
    set selenium speed  4sec
    click element   ${sign_in}
    sleep   4sec
    set selenium speed  0sec
    input text  ${Signin_email_placeholder}     superadmin@tes.zillow.local
    input text  ${Signin_pwd_placeholder}       zillow01*
    press keys  ${Signin_pwd_placeholder}       TAB     SPACE
    sleep   3sec
    reload page
    set selenium speed  2sec
    go to   https://www.qa.zillow.net/user/Impersonate.htm
    input text      ${admin_email_placeholder}      ${F_email}
    click element   ${admin_login_button}

ModifyingExcerpt&PublishingReview
    click element   ${Consumer_profile}
    click element   ${View_RW_Btn}
    click element   ${ModerateThisReview}
    click element   ${EditReviewExcerpt}
    sleep   2sec
    clear element text  ${Edit_text_area_excerpt}
    input text  ${Edit_text_area_excerpt}       MOdified excerpt test
    click element   ${Save_Excerpt_btn}
    click element   ${Moderation_form_submit_button}
    sleep   5sec
    go to   https://www.qa.zillow.net/profile/41711620ScreenName/
    page should contain         How likely are you to recommend REMAX GrosoHow likely



