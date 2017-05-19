*** Test Cases ***
działania arytmetyczne
    ${suma}    suma    -1    0    0.5    1
    Should Be Equal As Numbers    0.5    ${suma}
    ${różnica}    różnica    -1    0    0.5    1
    Should Be Equal As Numbers    -2.5    ${różnica}
    ${iloraz}    iloraz    20    2    4    2
    Should Be Equal As Numbers    1.25    ${iloraz}
    ${średnia}    średnia    1    2    5    2
    Should Be Equal As Numbers    2.5    ${średnia}

*** Keywords ***
suma
    [Arguments]    @{liczby}
    ${suma}    Evaluate    0
    : FOR    ${liczba}    IN    @{liczby}
    \    ${suma}    Evaluate    ${liczba}+${suma}
    [Return]    ${suma}

różnica
    [Arguments]    ${a}    @{liczby}
    ${wynik}    Evaluate    ${a}
    : FOR    ${liczba}    IN    @{liczby}
    \    ${wynik}    Evaluate    ${wynik}-${liczba}
    [Return]    ${wynik}

iloraz
    [Arguments]    ${a}    @{liczby}
    ${a}    Convert To Number    ${a}
    ${wynik}    Set Variable    ${a}
    : FOR    ${liczba}    IN    @{liczby}
    \    Should Not Be Equal As Integers    0    ${liczba}
    \    ${wynik}    Evaluate    ${wynik}/${liczba}
    [Return]    ${wynik}

średnia
    [Arguments]    @{wartości}
    ${wynik}    Set Variable    0.0
    ${suma}    Set Variable    0.0
    : FOR    ${wartość}    IN    @{wartości}
    \    ${suma}    Evaluate    ${suma} + ${wartość}
    ${ilość}    Get Length    ${wartości}
    ${wynik}    Evaluate    ${suma} / ${ilość}
    [Return]    ${wynik}
