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
TC_003_CREATE_REQUEST_GRAPHQL
    [Arguments]    ${request}
    ${response}=    POST    http://gorest.co.in/public/v2/graphql    {query:mutation{createUser(input: {name: Tenali Ramakrishna, gender: male, email: tenali.ramakrishna@15ce.com, status: active}) {user{id:1, name:XYX, gender:MALE, email:XYZ.com, status:active}}}}
    [return]    ${response}
TC_004_CREATE_REQUEST_LIST
    [Arguments]    ${response}
    ${json}=    Evaluate    json.loads('''${response}''')    json 
    Log To Console    ${json}
    #${list}=    Set Variable    ${json[0]}
    #Log To Console    ${list}