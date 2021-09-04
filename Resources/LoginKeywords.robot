*** Settings ***

Library     SeleniumLibrary
Variables   ../PageObjects/Locators.py


*** Keywords ***
open the browser
    [Arguments]     ${URL}      ${Browser}
    open browser    ${URL}      ${Browser}
    maximize browser window


enter username
    [Arguments]     ${username}
    input text      ${field_username}       ${username}

enter password
    [Arguments]     ${password}
    input text      ${field_password}       ${password}

click login button
    click button    ${button_login}

verify login is successful
    page should contain image       ${image_after_login}

logout session
    click element       ${hamburger}
    sleep   3s
    click element       ${logout_link}

close the browser
    close browser
