*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/LoginKeywords.robot

*** Variables ***
${Browser}      chrome
${URL}      https://www.saucedemo.com/
${username}     standard_user
${password}     secret_sauce

*** Test Cases ***

Test login
    open the browser    ${URL}      ${Browser}
    enter username      ${username}
    enter password      ${password}
    click login button
    sleep   3s
    verify login is successful
    logout session
    close the browser
