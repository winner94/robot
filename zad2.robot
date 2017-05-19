*** Test Cases ***
dzielenie
    ${wynik}    dzielenie     7    2
    Should Be Equal As Numbers    3.5    ${wynik}

*** Keywords ***
dzielenie
    [Arguments]    ${dzielna}    ${dzielnik}
    Should Not Be Equal As Numbers    0    ${dzielnik}
    ${dzielna}    Convert To Number    ${dzielna}
    ${wynik}    Evaluate    ${dzielna}/${dzielnik}
    [Return]    ${wynik}
