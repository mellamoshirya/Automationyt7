*** Settings ***
Library     SeleniumLibrary
Library  SeleniumLibrary
Library  DatabaseLibrary
Library  OperatingSystem

Suite Setup  Connect to Database    pymysql     ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
Suite Teardown  Disconnect From Database

*** Variables ***
${DBName} =  'User_val_300_comp_main'
${DBUser} =  test_rw
${DBPass} =  test_rw
${DBHost} =  'dbs.develop.zillow.net'
${DBPort} =  3306


*** Test Cases ***
Check if user is already present
    Check if exists in database  select * from dbo.Account where logon='d@1.com';