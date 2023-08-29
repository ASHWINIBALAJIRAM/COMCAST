*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${URL}    https://gorest.co.in/public/v2/users
${id}    4653104

*** Test Cases ***
DELETE_Request
    Create Session    AppAccess    ${URL}
    ${request}=    DELETE On Session   AppAccess    ${id}
    Log To Console    ${request.status_code}
    Log To Console    ${request.content}
    Log To Console    ${request.headers}
    ${status1}=    Convert To String    ${request.status_code}
    Should Be Equal    ${status1}    200
    ${jsonresponse}=    To Json   ${request.content}
    @{status_list}=    Get Value From Json    ${jsonresponse}    status 
    ${status}=    Get From List    @{status_list}    0
    Should Be Equal    ${status}    true
