*** Settings ***
Library    RequestsLibrary
Library    collections
Library   JSONLibrary

*** Variables ***
${URL}    http://gorest.co.in/

*** Test Cases ***
POST_Request
    Create Session    AddData    ${URL}
    ${body}=    Create Dictionary    id=4657100  name=Amb. Chakradhar Mehra  email=amb_chakradhar_mehra@mann.test  gender=female  status=active
    ${header}=     Create Dictionary    Content-Type=application/json
    ${request}=    POST On Session    AddData    public/v2/users     data=${body}    headers=${header}
    Log To Console    ${request.status_code}
    Log To Console    ${request.content}
    ${json_response}=    Set Variable    ${request.json()}
    Log To Console    ${json_response}
    

    