*** Settings ***
Resource          wsb_resource.tsv
Library           ../../../Python27/Lib/site-packages/RequestsLibrary/compat.pyc

*** Variables ***
${ENV}            ${EMPTY}

*** Test Cases ***
REST call
    [Tags]    force    force    STABLE
    ${stdout}    Wsb_Resource.Log To Console    WSB test
    Should Contain    ${stdout}    WSB testwiadomosc
