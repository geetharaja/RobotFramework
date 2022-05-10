*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary
Library           Collections

*** Variables ***
@{queryresult}

*** Test Cases ***
TC_01databsecpnnection
    Connect To Database     pymssql     testdb    test    test123    localhost    1433
    @{queryResults}    Description    select *from student
    Log Many    @{queryResults}
    @{queryResults}    Query    select *from student
    Log Many    @{queryResults}
    ${count}    Row Count    select *from student
    Log    ${count}
    Row Count Is Equal To X    select *from student    2
    Table Must Exist    student
    Check If Exists In Database    select FirstName from student where LastName='vemula'

TC_02
    Connect To Database     pymssql     testdb1    test    test123    localhost    1433
    Table Must Exist    ngen
    @{queryresult}    Query    select Username from ngen where id=1
    @{var5}    Convert To List    @{queryresult}
    @{queryresult}    Query    select Password from ngen where id=1
    @{var6}     Convert To List    @{queryresult}
    Open Browser     https://ngendigital.com/demo-application    Chrome
    Maximize Browser Window
    Select Frame    xpath://iframe
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='email']    @{var5}
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='password']    @{var6}
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://div[contains(text(),'Sign In')]
    [Teardown]    Close Browser

TC_Invalidpassword
    Connect To Database     pymssql     testdb2    ngen1    abc123    localhost    1433
    Table Must Exist    ngenerrortable
    Check If Exists In Database    select ErrorMessage from ngenerrortable where ErrorMsgType='Invalid password'
