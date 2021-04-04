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
Library     AutoItLibrary
*** Variables ***

${env}  https://www.qa.zillow.net
${browser}  headlesschrome
${CityName}  'San Jose CA'
${AgentName}   Ines Han
${BusinessName}     Westbrook Realty
${PATTERN1}      ^<a href="/profile/
${EXPECTED1}     <a href="/profile/68467184ScreenName/
${lang}
${my_address}       2951 Villa Loop Show Low AZ 85901

*** Keywords ***
OpenMyBrowser
    [Arguments]  ${env}     ${browser}
    open browser     ${env}     ${browser}
    set window size     1366    625
    maximize browser window
    sleep  3sec

GotoAgentFinder
    log to console  GoingOnAgentFinder
    sleep   5sec
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
    sleep  4sec
    wait until page contains        Krista Shumbo
    wait until page contains        (408) 497-6528

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
    click element   ${RegisterTab2}
    set selenium speed  1sec
    input text  ${EmailPlaceholder}     ${F_email}
    input text  ${PwdPlaceholder}       ${pwdpr}
    click element   ${Pro_chkboxx2}
    sleep  2sec
    select from list by index   ${protype}      1
    input text  ${fn_Reg}   ${F_first_name}
    input text  ${ln_Reg}   ${F_last_name}
    input text  ${zip_ref}  ${zip}
    press keys  ${ph_no}    206
    press keys  ${ph_no_2}      665
    press keys  ${ph_no_3}      6667
    click element   ${ContinueBtn}
    #press keys  ${zip_ref}       TAB     TAB     TAB     TAB     SPACE
    sleep   3sec
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
    input text  ${RegionBox}    ${ServiceArea}
    input text  ${fnln}     ${F_last_name}
    sleep   2sec
    click element   ${SearchMG2}
    sleep   4sec
    page should contain    ${F_first_name}${SPACE}${F_last_name}

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
    ${cur_url_sort}=    get location
    should contain   ${cur_url_sort}    ?sortBy=sales&show

Chk_URL_CONTAINS
    ${cur_url2}=     get location
    should contain  ${cur_url2}    /#reviews

Register
    wait until page contains    Sign in
    set selenium speed  4sec
    click element   ${sign_in}
    sleep   9sec
    click element   ${RegisterTab2}
    set selenium speed  0sec
    input text  ${EmailPlaceholder}     ${F_email}
    input text  ${PwdPlaceholder}       ${pwdpr}
#    press keys  ${PwdPlaceholder}       TAB     TAB     TAB     SPACE
#    click element   ${submit_reg2}
    click element   ${SubmitBtnNew}
    sleep   2sec

Sign_in_Agent-Selected
    wait until page contains    Sign in
    set selenium speed  2sec
    click element   ${sign_in}
    sleep   5sec
    input text  ${email_to_enter}     ${GeneratedLoginstring}
    input text  ${pwd_to_enter}       zillow
#    press keys  ${pwd_to_enter}     TAB     SPACE
    #click element   ${Sign_in_Btn_24}
    click element   ${submit_btn_agn2}

GoingToProfile
    sleep   3sec
    reload page
    sleep   7sec
    set selenium speed  1sec
    wait until page contains        Manage your profile     30sec
    click element   ${ManageYourProfile}


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
        set suite variable  ${F_first_name}
        set suite variable  ${F_last_name}

WrittingAReview

    click element   ${WaReviewBtn}
    sleep   8sec
    click element   ${stars}
    input text  ${ReviewMsgBox}     test 11_03 test 236..and GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX GrosoHow likely are you to recommend REMAX Groso
    click element   ${Review_Terms}
    select from list by value   ${Review_ServiceProvided}      3
    input text      ${Rev_Address}      ${my_address}
    click element   ${war_poc}
    input text      ${war_poc_name}     AssociateIam
    input text   ${Rev_YoS}      2010
    sleep   4sec
    click element    ${sub_review_btn}
    sleep   2sec
    Run Keyword And Ignore Error    Click Element    ${sub_review_btn}
    sleep   2sec
    wait until page contains       Review submitted


ImpersonatingViaSuperadmin
    set selenium speed  3sec
    Go to   https://www.qa.zillow.net/Logout.htm
    go to   https://www.qa.zillow.net/user/Impersonate.htm
    sleep   4sec
    input text  ${Signin_email_placeholder}     superadmin@tes.zillow.local
    input text  ${Signin_pwd_placeholder}       zillow01*
    press keys  ${Signin_pwd_placeholder}     TAB     SPACE
    #click element   ${si}
    #press keys  ${Signin_pwd_placeholder}       TAB     SPACE
    sleep   3sec
    input text      ${admin_email_placeholder}      ${F_email}
    click element   ${admin_login_button}

ConcatinatingScreenNameURL
    ${screenName}=  Evaluate  random.choice($Example11)  random
    log to console  \nvalue: ${screenName}
    set global variable     ${screenName}
    ${ResultantURL}=    Catenate    SEPARATOR=   ${ProPredefinedBreadcrumbs}   ${screenName}
    log to console  ${ResultantURL}
    go to   ${ResultantURL}
    set global variable     ${ResultantURL}
    # to make login e.g. screenname@tes.zillow.local
    ${GeneratedLoginstring}=   replace string      ${screenName}    ScreenName/     @tes.zillow.local
    set global variable     ${GeneratedLoginstring}
    log to console  ${GeneratedLoginstring}


ModifyingExcerpt&PublishingReview
    sleep   3sec
    click element   ${Consumer_profile}
    sleep   3sec
    click element   ${View_RW_Btn_Raw}
    click element   ${ModerateThisReview}
    click element   ${EditReviewExcerpt}
    sleep   2sec
    clear element text  ${Edit_text_area_excerpt}
    input text  ${Edit_text_area_excerpt}       MOdified excerpt test
    click element   ${Save_Excerpt_btn}
    click element   ${Moderation_form_submit_button}
    sleep   5sec
    go to   ${ResultantURL}
    reload page
    sleep   5sec
    page should contain         test 11_03 test 236..and GrosoHow likely

