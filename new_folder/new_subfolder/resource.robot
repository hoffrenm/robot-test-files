
*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
*** Variables ***
${SERVER}         localhost:7274
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser                ${LOGIN URL}        ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Button      Log in
    Page Should Contain Checkbox    Stay logged in
    Title Should Be                 Login Page

Go To Login Page
    Go To                       ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]                 ${username}
    Page Should Not Contain     Welcome
    Input Text                  username_field      ${username}

Input Password
    [Arguments]                 ${Password}
    Input Text                  password_field      ${newPassword}

Submit Credentials
    Click Button                login_button

Welcome Page Should Be Open
    Location Should Be          ${WELCOME URL}
    Title Should Be             Welcome Page
