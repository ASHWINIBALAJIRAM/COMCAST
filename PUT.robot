*** Settings ***
Library    RequestsLibrary
Library    collections
Library   JSONLibrary

*** Variables ***
${URL}    http://gorest.co.in

*** Test Cases ***
PUT_Request
    Create Session    AddData    ${URL}
    ${body}=    Create Dictionary    id=2799  name=Omana Patil  email=patil_omana@lebsack.example  gender=male  status=active
    ${header}=     Create Dictionary    Content-Type=application/json
    ${request}=    PUT On Session    AddData    /public/v2/users/2799    data=${body}    headers=${header}
    Log To Console    ${request.status_code}
    Log To Console    ${request.content}
    #Create Session    localhost      http://localhost:8080
    ${response}=    GET On Session    AddData    public/v2/users/2799
    Log To Console    ${response.content}
    ${json_response}=    Set Variable    ${response.json()}
    Log To Console    ${json_response}
