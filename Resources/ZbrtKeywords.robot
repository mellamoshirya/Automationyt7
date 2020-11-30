*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Variables   ..//PageObjects/Locators.py

*** Variables ***
${url3_new_cycyle}  https://zbrt.atl.zillow.net/secure/Tests.jspa#/cycle?projectId=12551
*** Keywords ***
OpenMyBrowser
    [Arguments]  ${URL1}     ${browser}
    open browser    ${URL1}     ${browser}
    maximize browser window
    sleep  3sec

EnterUserName
    [Arguments]  ${zbrtusername}
    input text      ${zbrtusernameid}      ${zbrtusername}

EnterPassword
    [Arguments]  ${zbrtpassword}
    input text     ${zbrtpwd}       ${zbrtpassword}

ClickSignIn
    click button    ${zbrtlofinbtn}
    sleep   20sec

CreateTestPlan
    click element  ${NewButton}
    sleep  3sec
    [Arguments]     ${TestPlanNameActual}   ${ActualObj}    ${Approved}
    input text      ${TestPlanName}     ${TestPlanNameActual}
    sleep  3sec
    double click element   ${TestPlanObj}
    press keys      ${TestPlanObj}      ${ActualObj}
    sleep   3sec
    set selenium speed  1sec
    click element   ${TestPlanStatusDD}
    press keys  ${TestPlanStatusDD}    U+02193      U+02193     U+02193      ENTER
    sleep   3sec
    click element   ${TestPlanSaveButton}
    sleep  2sec
CreateTestCycle
    go to   ${url3_new_cycyle}
    sleep  2sec
    click element   ${NewTCycle}
    sleep  2sec
    [Arguments]     ${CycleName}    ${CycleActualName}      ${CycleActualObj}
    input text      ${CycleName}    ${CycleActualName}
    sleep  2sec
    double click element    CycleObj
    press keys      ${CycleActualName}      ${CycleActualObj}
    sleep  2sec
    click element  ${cycleSave}