*** Settings ***
Library         SeleniumLibrary
Resource        keywords.resource
Default Tags    positive

*** Variables ***

${URL}      https://demoqa.com
${BROWSER}  Chrome

*** Test Cases ***

Test Text Box
    open browser     ${URL}/text-box   ${BROWSER}
    maximize browser window
    Fill All Fields And Check Output
    close browser

Test Check Box
    open browser    ${URL}/checkbox    ${BROWSER}
    Maximize Browser Window
    Extend All checkboxes
    Select Random Checkboxes
    Sleep    3
    close browser