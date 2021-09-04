*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      https://www.saucedemo.com/


*** Test Cases ***
LoginLogoutTest
    #create webdriver    chrome  executable_path="...ur folderpath\drivers\chromedriver.exe"
    open browser    ${url}      ${browser}
    page should contain element       xpath://*[@id="root"]/div/div[2]/div[1]/div[2]
    #click link  xpath://somexpath
    input text    id:user-name    standard_user
    input text    id:password     secret_sauce
    click element     id:login-button
    page should contain image       xpath://*[@id="item_4_img_link"]/img
    logoutfromApp  #using keyword to logout
    sleep   2s
    element should be visible       xpath://*[@id="root"]/div/div[2]/div[1]/div[2]
    close browser

PurchaseProductandCheckoutTest
    open browser    ${url}      ${browser}
    page should contain element       xpath://*[@id="root"]/div/div[2]/div[1]/div[2]
    logintoApp
    click button    xpath:/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/button
    element text should be      xpath://*[@id="shopping_cart_container"]/a/span     1
    click element   xpath://*[@id="shopping_cart_container"]/a/span
    element text should be      xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[1]       1
    click button    id:checkout
    element text should be      xpath://*[@id="header_container"]/div[2]/span       CHECKOUT: YOUR INFORMATION
    entercustomerDetails
    element text should be      xpath://*[@id="header_container"]/div[2]/span       CHECKOUT: OVERVIEW
    click button    id:finish
    page should contain image       xpath://*[@id="checkout_complete_container"]/img
    click button    id:back-to-products
    sleep   2s
    logoutfromApp
    close browser



*** Keywords ***
logintoApp
    input text    id:user-name    standard_user
    input text    id:password     secret_sauce
    click element     id:login-button
    sleep   1s
    page should contain image       xpath://*[@id="item_4_img_link"]/img

logoutfromApp
    click element       id:react-burger-menu-btn
    sleep   3s
    click element       xpath://*[@id="logout_sidebar_link"]

entercustomerDetails
    input text      id:first-name       John
    input text      id:last-name        Doe
    input text      id:postal-code      12345
    click element       id:continue
