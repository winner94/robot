*** Test Cases ***
średnia
    ${wynik}    średnia    1    2    4    5    10
    Should Be Equal As Numbers    4    ${wynik}

max
    ${max}    max    1    2    3
    Should Be Equal As Integers    3    ${max}

minimum
    ${min}    min    5    3    4
    Should Be Equal As Integers    3    ${min}

*** Keywords ***
max
    [Arguments]    @{liczby}
    ${max}    Evaluate    ${liczby}[0]
    : FOR    ${liczba}    IN    @{liczby}
    \    ${max}    Set Variable If    ${liczba}>${max}    ${liczba}    ${max}
    [Return]    ${max}

min
    [Arguments]    @{liczby}
    ${min}    Evaluate    ${liczby}[0]
    : FOR    ${liczba}    IN    @{liczby}
    \    ${min}    Set Variable If    ${liczba}<${min}    ${liczba}    ${min}
    [Return]    ${min}

średnia
    [Arguments]    @{wartości}
    ${suma}    Evaluate    0
    : FOR    ${wartość}    IN    @{wartości}
    \    ${suma}    Evaluate    ${suma} + ${wartość}
    ${ilość}    Get Length    ${wartości}
    ${wynik}    Evaluate    ${suma} / ${ilość}
    [Return]    ${wynik}
