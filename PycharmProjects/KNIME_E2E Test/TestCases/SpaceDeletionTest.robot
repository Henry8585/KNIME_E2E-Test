*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/KNIME_keywords.robot

*** Test Cases ***
Test Space Deletion
    Launch Browser    https://hub.knime.com/    chrome
    Set Selenium Implicit Wait    20s
    Accept cookie
    Click SignIn_link
    Enter Username    henry8585
    Enter Password    uRShLXDQm6Ts3k4
    Click SignIn

# Navigate to the space dashboard
    Click Element    xpath://*[@id="__layout"]/div/div[1]/header/nav/div[2]/div/button
    Click Element    xpath:/html/body/div/div/div/div[1]/header/nav/div[2]/div/div/ul/li[1]/a/div/span
    Count Links

# Delete a space
# A space can't be delected more than once, so enter the xpath of the space to be delected for every test run
    Click Element    xpath://*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div[2]/ul/li[1]/a
    Click Button    xpath:/html/body/div/div/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/button
    Wait Until Element Is Visible    css:div.content
    Click Element    xpath://*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div[2]/div[3]/div/div/div[1]/div/button

    Wait Until Element Is Visible    css:div.inner
    Input Text    css:input[type=text]    New space_delete test
    Click Element    css:button[form=confirmationForm]
    sleep    5s
    Page Should Contain    Space was deleted successfully!