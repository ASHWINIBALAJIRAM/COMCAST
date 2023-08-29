*** Settings ***
Library    RequestsLibrary
Library    SSHLibrary
Library    String
Library   Collections
Resource    C:/Users/ashub/OneDrive/ROBOT/TESTCASES/commands.robot


*** Variables ***

${id}    	2799

*** Test Cases ***
Request_GRAPHQL
    ${output}=    TC_001_GET_REQUEST_GRAPHQL    ${id}
    Log To Console    ${output}
    Should Be Equal    "${output.status_code}"    "200"
    Log To Console    The response code : ${output.status_code}
    TC_001_GET_REQUEST_LIST    ${output.content}
    



