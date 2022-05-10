*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          commonkeyword.txt

*** Test Cases ***
TC_01
    navigateurl

TC_02
    navigateurl
    iframe
    object
    [Teardown]    Close Browser

TC_03
    navigateurl
    iframe
    Attributevalue

TC_04
    Set Selenium Speed    0.5
    navigateurl
    iframe
    emptyemail

TC_05
    navigateurl
    iframe
    emptypassword

TC_06
    Set Selenium Speed    0.5
    navigateurl
    iframe
    emptyemailpassword

TC-07
    navigateurl
    iframe
    userinvalidemail
