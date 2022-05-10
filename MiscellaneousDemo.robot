*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${var11}          ${EMPTY}

*** Test Cases ***
Assign ID to Element
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    xpath://iframe
    sleep    2
    Assign Id To Element    xpath://tbody/tr[4]/td[3]    pm
    ${var11}    Get Text    pm
    Log    ${var11}
    Capture Page Screenshot
    Current Frame Should Contain    Multiple Selection    Its not present
    Element Attribute Value Should Be    xpath://input[@value='merc']    name    car
    [Teardown]    Close Browser

CountElements
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    xpath://iframe
    ${var11}    Get Element Count    xpath://input[@name='car']
    Should Be True    ${var11}==3
    [Teardown]    Close All Browsers

GoBack
    Open Browser	    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    sleep    2
    Go To    https://www.cineplex.com/
    sleep    2
    Go Back
    [Teardown]    Close All Browsers

Loction
    Open Browser    https://ngendigital.com/    chrome
    Maximize Browser Window
    Location Should Be    https://ngendigital.com/    it is not a same url
    Close Browser
    Open Browser    https://www.gmail.com    chrome
    Log Location
    Log Source
    Log Title
    Close Browser
    [Teardown]
