*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library           SeleniumLibrary
Library           Data.py

*** Variables ***
${ANGULAR}        css:#tree-node > ol:nth-child(2) > li:nth-child(1) > ol:nth-child(2) > li:nth-child(2) > ol:nth-child(2) > li:nth-child(1) > ol:nth-child(2) > li:nth-child(2) > span:nth-child(1) > label:nth-child(2) > span:nth-child(2)
${PRIVATE}        css:#tree-node > ol:nth-child(2) > li:nth-child(1) > ol:nth-child(2) > li:nth-child(2) > ol:nth-child(2) > li:nth-child(2) > ol:nth-child(2) > li:nth-child(2) > span:nth-child(1) > label:nth-child(2) > span:nth-child(2)
${WORD_FILE}      css:li.rct-node-parent:nth-child(3) > ol:nth-child(2) > li:nth-child(1) > span:nth-child(1) > label:nth-child(2) > span:nth-child(2)
${YES_CHECKBOX}         css:div.custom-control:nth-child(2)
${IMPRESSIVE_CHECKBOX}  css:div.custom-control:nth-child(3)
${NO_CHECKBOX}          css:div.custom-control:nth-child(4)
*** Keywords ***

Fill All Fields And Check Output
    ${user name}               user_name
    ${user_email}              user_email
    ${user_address}            user_address
    ${user_current_address}    user_current address
    input text       id:userName            ${user name}
    input text       id:userEmail           ${user_email}
    input text       id:currentAddress      ${user_address}
    input text       id:permanentAddress    ${user_current_address}
    click element    id:submit
    element should contain    id:output    ${user_name}
    element should contain    id:output    ${user_email}
    Element Should Contain    css:p.mb-1:nth-child(3)    ${user_address}
    Element Text Should Be    css:p.mb-1:nth-child(3)    ${user_address}
    element should contain    css:p.mb-1:nth-child(4)    ${user_current_address}

Extend All checkboxes
    click element    xpath://*[@id="tree-node"]/div/button[1]

Select Random Checkboxes And Check Result

    Click Element    ${ANGULAR}
    Click Element    ${PRIVATE}
    Click Element    ${WORD_FILE}
    ${angular_text}=     Get Text    ${ANGULAR}
    ${private_text}=     Get Text    ${PRIVATE}
    ${word_file_text}=   Get Text    ${WORD_FILE}
    Element Should Contain    id:result     ${angular_text}
    Element Should Contain    id:result     ${private_text}
    Element Should Contain    id:result     ${word_file_text}

Select Each Checkbox and Check Result

    @{CHECKBOXES}=      Create List    ${YES_CHECKBOX}     ${IMPRESSIVE_CHECKBOX}   ${NO_CHECKBOX}

    FOR    ${CHECKBOX}      IN      @{CHECKBOXES}
        Click Element         ${CHECKBOX}
        Sleep    0.5
        ${checkbox_text}=   Get Text    ${CHECKBOX}
        Sleep    0.5
        Element Text Should Be    css:.text-success     ${checkbox_text}
    END