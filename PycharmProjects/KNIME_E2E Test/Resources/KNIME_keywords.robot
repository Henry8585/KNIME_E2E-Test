*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/KNIME_common.py

*** Keywords ***
Launch Browser
    [Arguments]    ${Url}    ${Browser}
    open browser    ${Url}    ${Browser}
    Maximize Browser Window
    ${title}=   Get Title
    Log To Console    ${title}
    Log    ${title}

Accept cookie
    Wait Until Element Is Visible    ${Cookie_popup}
    Click Element    ${Accept_cookie}

Click SignIn_link
    Click Button    ${SignIn_link}

Enter Username
    [Arguments]   ${username}
    Input Text   ${LoginUserName}   ${username}

Enter Password
    [Arguments]   ${password}
    Input Text   ${LoginPassword}   ${password}

Click SignIn
    Click Button    ${SignIn}

Count Links
    ${LinkCount}=    Get Element Count    xpath://a
    Log To Console    ${LinkCount}
    Log    ${LinkCount}

# Not used
Create Space
    Click Element    ${Create_space}
    Element Should Contain    ${Create_space}    "Public space"
