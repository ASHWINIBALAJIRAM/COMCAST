*** Settings ***
Library    OperatingSystem
Library    SSHLibrary
Library    String
Library   Collections
Library    RequestsLibrary
Library    SeleniumLibrary

*** Variables ***
${header}=    create dictionary    Content-Type=application/json

*** Keywords ***
TC_001_GET_REQUEST_GRAPHQL
    [Arguments]    ${request}
    ${response}=    POST    http://gorest.co.in/public/v2/graphql   {"query":"query{user(id: 2799) { id:2799, name:xy, email:xyz.com, gender:male, status:acctive }}"}
    [return]    ${response}
TC_001_GET_REQUEST_LIST
    [Arguments]    ${response}
    ${json}=    Evaluate    json.loads('''${response}''')    json 
    Log To Console    ${json}
    #${list}=    Set Variable    ${json[0]}
    #Log To Console    ${list}