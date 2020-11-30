*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.develop.zillow.net/medina-wa/real-estate-agent-reviews/

*** Test Cases ***
#ForLoopDemoTC_with_range
#    :For    ${i}    IN RANGE    1   10
#    \   log to console      ${i}
#
#ForLoopDemoTC_with_singleSpace
#    :For    ${i}    IN  1 2 3 4 5 6 7 8 9 10
#    \   log to console      ${i}
#
#
#
#ForLoopDemoTC_with_doubleSpace
#    :For    ${i}    IN  1  2  3  4  5  6  7  8  9  10
#    \   log to console      ${i}

#ForLoopDemoTC_with_list
#    @{items}    create list  1  2   3   4   5
#    :FOR    ${i}    IN  @{items}
#    \   log to console  ${i}

#ForLoopDemoTC_with_string1
#    :FOR    ${i}    IN  shriraj sj  sh  ri  ra  j.
#    \   log to console  ${i}


#ForLoopDemoTC_with_string2
#    @{striinnggss}  create list  shriraj sj  sh  ri  ra  jjjjjj.
#    :FOR    ${i}    IN  @{striinnggss}
#    \   log to console  ${i}

ForLoopDemoTC_with_string_with_condition
    @{striinnggss}  create list  shriraj sj  sh  ri  ra  jjjjjj.
    :FOR    ${i}    IN  @{striinnggss}
    \   log to console  ${i}
    \   exit for loop if    ${i}=="sj"


*** Keywords ***
closethebrowseratlast
    close  browser