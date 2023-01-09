*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library           SeleniumLibrary
Library           Data.py

*** Variables ***

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
    element should contain    id:output    ${user_address}
    element should contain    id:output    ${user_current_address}

Extend All checkboxes
    click element    xpath://*[@id="tree-node"]/div/button[1]

Select Random Checkboxes
    Click Element      css:#tree-node-angular
    Select Checkbox    css:#tree-node-private
    Select Checkbox    css:#tree-node-wordFile