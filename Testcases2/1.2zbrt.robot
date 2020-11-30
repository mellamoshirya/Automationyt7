*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
#Library           SikuliLibrary
#Library  AutoitLibrary
Resource  ..//Resources/ZbrtKeywords.robot

*** Variables ***
${URL1}  https://zbrt.atl.zillow.net/secure/Tests.jspa#/plan?projectId=12551
${url2}     https://zbrt.atl.zillow.net/secure/Tests.jspa#/plan?projectId=12551

${url3_new_cycyle}  https://zbrt.atl.zillow.net/secure/Tests.jspa#/cycle?projectId=12551
${browser}  chrome
${zbrtusername}     shrirajj
${zbrtpassword}     emtec@666

${TestPlanNameActual}       DemoTestPlanNameThisIs
${ActualObj}        This is test objective
${Approved}         Appr

${CycleActualName}      Cycle Demo
${CycleActualObj}       Cycle Obj

*** Test Cases ***
zbrttestcase
    OpenMyBrowser   ${URL1}  ${browser}
    sleep   3sec
    EnterUserName   ${zbrtusername}
    sleep   3sec
    EnterPassword   ${zbrtpassword}
    sleep   3sec
    ClickSignIn
    sleep   5sec
    go to  ${URL2}
    sleep   7sec
    CreateTestPlan      ${TestPlanNameActual}   ${ActualObj}    ${Approved}
    CreateTestCycle     ${url3_new_cycyle}




