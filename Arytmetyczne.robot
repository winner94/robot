*** Settings ***
Library           Collections

*** Test Cases ***
Srednia
    [Documentation]    Obliczanie sredniej
    ${wynik}    srednia    1    2    3
    Should Be Equal as Numbers    ${wynik}    2

Srednia_float
    [Documentation]    Obliczanie sredniej
    ${wynik}    srednia    1    2
    Should Be Equal as Numbers    ${wynik}    1.5

*** Keywords ***
srednia
    [Arguments]    ${wartosc1}    @{wartosci}
    Append To List    ${wartosci}    ${wartosc1}
    ${suma}    sumowanie    @{wartosci}
    ${ilosc_argumentow}    Get Length    ${wartosci}
    ${wynik}    Evaluate    ${suma} / ${ilosc_argumentow}
    [Return]    ${wynik}

sumowanie
    [Arguments]    @{wartosci}
    ${suma}    Set Variable    ${0.0}
    : FOR    ${wartosc}    IN    @{wartosci}
    \    ${suma}    Evaluate    ${suma} + ${wartosc}
    [Return]    ${suma}

