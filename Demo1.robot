*** Settings ***
Default Tags      new
Resource          Userdefinekeyword.txt    # This is my first resource file
Library           DateTime

*** Variables ***
${var1}           6
${var2}           6
@{listvar}        geetha    raja
&{dict}           username=geetha    password=geetha
${a1}             1
${a2}             1
${date}           ${EMPTY}
@{cities}
${City}           ${EMPTY}
${textfield}      ${EMPTY}

*** Test Cases ***
TC_01
                                [Documentation]    This is scalar variable.Testing two integers are equal.*Testcase1* -SHOULD be equal-    link https://gmail.com/
                                [Tags]    login
                                Should Be Equal    ${var1}    ${var2}

TC_02
                                [Tags]    login
                                [Setup]    SetupDemo
                                Should Not Be Equal As Strings    ${listvar[0]}    ${listvar[1]}
                                [Teardown]    TeardownDemo

TC_03
                [Tags]    login
                                Should Be Equal As Strings    ${dict}[username]    ${dict}[password]

TC_05
                [Tags]    login
                                [Template]    Should Be Equal As Integers    # This is be equal as intigers
                                [Timeout]    2 minutes 20 seconds
                                1    1
                                2    2

TC_06
                Comparetwovariables

TC_04
                Should Be Equal    ${a1}    ${a2}

TC_07
                ${date}    Get Current Date    UTC

TC_08
                                Log To Console    Hello World

*** Keywords ***
SetupDemo
                                Log To Console    This is setup method

TeardownDemo
                                Log To Console    This is teardown

TC_08
                                Log To Console    Hello World
