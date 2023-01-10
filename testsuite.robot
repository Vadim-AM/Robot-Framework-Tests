*** Settings ***
Library         SeleniumLibrary
Resource        keywords.resource
Default Tags    positive

*** Variables ***

${URL}      https://demoqa.com
${BROWSER}  Chrome

*** Test Cases ***

Test Text Box
    [Setup]    open browser     ${URL}/text-box   ${BROWSER}
    maximize browser window
    Fill All Fields And Check Output
    [Teardown]    close browser

Test Check Box
    [Setup]    open browser    ${URL}/checkbox    ${BROWSER}
    Maximize Browser Window
    Extend All checkboxes
    Select Random Checkboxes And Check Result
    [Teardown]    close browser

Test Radio Button
    [Setup]    Open Browser    ${URL}/radio-button      ${BROWSER}
    Maximize Browser Window
    Select Each Checkbox And Check Result
    [Teardown]    Close Browser

Test Web Tables Delete Person
    [Setup]    Open Browser    ${URL}/webtables      ${BROWSER}
    Maximize Browser Window
    Delete Table Element And Check The Result
    [Teardown]    Close Browser

Test Web Tables Edit Person
    [Setup]    Open Browser    ${URL}/webtables      ${BROWSER}
    Maximize Browser Window
    Edit Table Element And Check The Result
    [Teardown]    Close Browser

Test Web Tables Add Person
    [Setup]    Open Browser    ${URL}/webtables      ${BROWSER}
    Maximize Browser Window
    Add Table Element And Check The Result
    [Teardown]    Close Browser