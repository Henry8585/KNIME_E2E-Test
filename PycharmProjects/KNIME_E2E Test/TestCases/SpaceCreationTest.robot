*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/KNIME_keywords.robot

*** Test Cases ***
Test Space Creation
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

# Create a space
# The container is a moving element without a robust locator...So copy/paste the xpath for each test run)
    Scroll Element Into View    css:.create-space-card
    click element    xpath=//*[@id="__layout"]/div/div[1]/main/section[2]/div/div[2]/div/div[2]/ul/li[3]/div/div/button[2]
    Page Should Contain    Your new space was created successfully!