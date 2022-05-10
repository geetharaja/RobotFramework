*** Settings ***
Test Teardown     Close Browser
Resource          Excelfetch.txt
Resource          commonkeyword.txt
Library           SeleniumLibrary

*** Test Cases ***
TC_01
                                navigateurl
                                iframe
                                login
                                iframe
                                verifylogin
                                [Teardown]    Close Browser

TC_02
                navigateurl
                iframe
                login
                iframe
                verifylogin
                verifymanagebooking
                validatefromcity
                Logout
                [Teardown]    Close Browser

TC_validateTocity
                navigateurl
                iframe
                login
                iframe
                verifylogin
                verifymanagebooking
                ValidateToCity

TC_Classvalidate
                navigateurl
                iframe
                login
                iframe
                verifylogin
                verifymanagebooking
                validateclass
                Logout

TC_Verifyrediobutton
                navigateurl
                iframe
                login
                iframe
                verifylogin
                verifymanagebooking
                radiobuttonvalidate

TC_validationconfirm
        navigateurl
        iframe
        login
        iframe
        verifylogin
        verifymanagebooking
        bookeconomy

TC_bookeconamy
    navigateurl
    iframe
    login
    iframe
    verifylogin
    verifymanagebooking
    econamyselect
