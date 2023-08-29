*** Settings ***
Library    RequestsLibrary


*** Variables ***
${URL}    https://gorest.co.in/public/v2/users
${id}    	4606776

*** Test Cases ***
Get_Request
    Create Session    mysession    ${URL}
    ${request}=    GET On Session   mysession    ${id}
    Log To Console    ${request.status_code}
    Log To Console    ${request.content}
    Log To Console    ${request.headers}
    ${status}=    Convert To String    ${request.status_code}
    Should Be Equal    ${status}    200
    ${json_response}=    Set Variable    ${request.json()}
    Log To Console    ${json_response}
