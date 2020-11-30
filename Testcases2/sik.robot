*** Settings ***
Documentation     Sikuli Library Click In Example
Library           SikuliLibrary     mode=NEW
Library           OperatingSystem

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img

*** Test Cases ***
Click In Example
    Open Example UI
    Click Right OK Button
    Click Left OK Button

*** Keywords ***
Add Needed Image Path
    Add Image Path    ${IMAGE_DIR}

Click Right OK Button
    Click In        right_area.png      target.png

Click Left OK Button
    Click In        left_area.png      target.png