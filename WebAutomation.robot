*** Settings ***
Library           SeleniumLibrary
Resource          CommonlyUsedKeywords.txt

*** Test Cases ***
OpenBrowser
                                Open Browser    https://ngendigital.com/practice    Chrome
                                Maximize Browser Window
                                sleep    2
                                Select Frame    xpath://*[@id="iframe-03"]
                                sleep    4
                                Click Element    xpath://input[@value='merc']/preceding-sibling::input[@value='bmw']
                                sleep    4
                                [Teardown]    Close Browser

AdvanceCSSSelector
                                Open Browser    https://ngendigital.com/practice    Chrome
                                Maximize Browser Window
                                sleep    2
                                Select Frame    xpath://*[@id="iframe-03"]
                                sleep    4
                                Click Element    css:fieldset>select :nth-child(2)
                                sleep    4
                                [Teardown]    Close Browser

TextBoxDemo
        Open Browser    \    \    Open Browser    https://ngendigital.com/practice    Chrome
                                Maximize Browser Window
                                sleep    2
                                Select Frame    xpath://*[@id="iframe-05"]
                                sleep    4
                                Page Should Contain Textfield    xpath://input[@name='FirstName']    TextField is available    Debug
                                sleep    4
                                Input Text    xpath://input[@name='FirstName']    NgenDigital
                                sleep    2
                                Textfield Should Contain    xpath://input[@name='FirstName']    NgenDigital
                                sleep    2
                                Clear Element Text    xpath://input[@name='FirstName']
                                sleep    2
                                [Teardown]    Close Browser

ButtonExample
                Open Browser    https://ngendigital.com/practice    Chrome
                Maximize Browser Window
                Select Frame    xpath://*[@id="iframe-05"]
                sleep    2
                Click Button    xpath://input[@value='Click Me']
                sleep    2
                [Teardown]    Close Browser

CheckBoxDemo
                Open Browser    https://ngendigital.com/practice    Chrome
                Maximize Browser Window
                Select Frame    xpath://*[@id="iframe-05"]
                sleep    2
                Page Should Contain Checkbox    xpath://input[@value='bmw']    page contains checkbox    debug
                sleep    2
                Select Checkbox    xpath://input[@value='bmw']
                sleep    2
                Checkbox Should Be Selected    xpath://input[@value='bmw']
                sleep    2
                Unselect Checkbox    xpath://input[@value='bmw']
                sleep    2
                [Teardown]    Close Browser

ListDemo
                Open Browser    https://ngendigital.com/practice    Chrome
                Maximize Browser Window
                Select Frame    xpath://iframe
                sleep    2
                Page Should Contain List    css:#FromCity
                sleep    2
                @{cities}    Get List Items    css:#FromCity
                FOR    ${city}    IN    @{cities}
                Log    ${city}
                END
                sleep    2
                List Selection Should Be    css:#FromCity    Toronto
                sleep    2
                Select From List By Index    css:#FromCity    1
                sleep    2
                Select From List    css:#FromCity    Chicago
                sleep    2
                [Teardown]    Close Browser

RadioButton
                Open Browser    https://ngendigital.com/practice    Chrome
                Maximize Browser Window
                Select Frame    xpath://iframe
                sleep    2
                Page Should Contain Radio Button    xpath://input[@value='flight']
                sleep    2
                Select Radio Button    flight    flighthotel
                sleep    2
                Radio Button Should Be Set To    flight    flighthotel
                sleep    3
                [Teardown]    Close Browser

ImageDemo
                Open Browser    https://ngendigital.com/practice    Chrome
                Maximize Browser Window
                Click Image    xpath://*[@id="n-2418"]
                sleep    2
                [Teardown]    Close Browser

TableDemo
                Open Browser    https://ngendigital.com/practice    Chrome
                Maximize Browser Window
                Select Frame    xpath://iframe
                sleep    2
                Page Should Contain Element    xpath:/html/body/fieldset[7]/table
                sleep    2
                Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
                sleep    2
                Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
                sleep    2
                Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
                sleep    2
                Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
                ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
                Log To Console    ${textfield}
                Should Be Equal As Strings    ${textfield}    Theresa May
                sleep
                [Teardown]    Close Browser

LoginDemo
                Open Browser    https://ngendigital.com/demo-application    Chrome
                Maximize Browser Window
                Select Frame    xpath://iframe
                Login to flight Application    Demo@gmail.com    Demo
                Page Should Contain Element    xpath://*[@id="InvalidLogin"]/p/label/font
                ${textfield}    Get Text    xpath://*[@id="InvalidLogin"]/p/label/font
                Log To Console    ${textfield}
                sleep    2
                Get Alert Message
                [Teardown]    Close Browser

TC_011
