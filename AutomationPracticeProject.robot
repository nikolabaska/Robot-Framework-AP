*** Settings ***
Suite Setup       Open Browser    http://automationpractice.com/index.php    chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary

*** Variables ***
${URL}            http://automationpractice.com/
${username}       milevskinikola@gmail.com
${pass}           nikolabaska10
${Singin}         //*[@id="header"]/div[2]/div/div/nav/div[1]/a
${email}          id:email_create
${Submit}         //*[@id="SubmitCreate"]
${Wrongpass}      wrongpass
${WrongEmail}     wrongemail@gmail.com
${T-Shrts}        //*[@id="block_top_menu"]/ul/li[3]/a
${AddtoCart}      xpath://span[text()='Add to cart']
${Checkout}       xpath://html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a
${Procced}        //*[@id="center_column"]/p[2]/a[1]
${LoginEmail}     id:email
${Password}       id:passwd
${Quantity}       //*[@id="cart_quantity_up_1_1_0_389681"]
${Delete}         id:1_1_0_389681
${Logout}         //*[@id="header"]/div[2]/div/div/nav/div[2]/a
${Procced1}       //*[@id="center_column"]/form/p/button
${Checkbox}       id:cgv
${Procced2}       //*[@id="form"]/p/button
${PaybyCheck}     //*[@id="HOOK_PAYMENT"]/div[2]/div/p/a
${Procced0}       //*[@id="center_column"]/p[2]/a[1]
${Total price}    //*[@id="total_price"]
${shopping_cart}    //*[@id="header"]/div[3]/div/div/div[3]/div/a
${Deletebutton}    //*[@id="1_1_0_389681"]
${Empty_cart}     //*[@id="center_column"]/p
${qunatity_plus}    //*[@id="cart_quantity_up_1_1_0_389681"]
${addproduct}     //*[@id="product_1_1_0_389681"]/td[5]/input[2]
${Add_more_products}    xpath://html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[5]/div/a[2]
${product_quantity}    xpath://html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[5]/div/a[2]

*** Test Cases ***
TC_1-Verify create account
    [Setup]    Open Browser    http://automationpractice.com/index.php    chrome
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin}
    Input Text    ${email}    ${username}
    Click Button    ${Submit}
    [Teardown]    Close Browser

TC_2-log in with valid credentials
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin}
    Input Text    ${LoginEmail}    ${username}
    Wait Until Element Is Visible \    ${LoginEmail}
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}

TC_3-log in with valid emal and invalid password
    Click Element    ${Singin}
    Wait Until Element Is Visible \    ${Singin}
    Input Text    ${LoginEmail}    ${username}
    Input Text    ${Password}    ${Wrongpass}
    Click Button    ${Submit}

TC_4-log in with invalid emal and valid password
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin}
    Input Text    ${LoginEmail} \    ${WrongEmail}
    Wait Until Element Is Visible    ${LoginEmail} \
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}

TC_5 -Order as a guest
    Click Element    ${T-Shrts}
    Click Element    ${AddtoCart}
    Wait Until Element Is Visible \ \ \ \    ${AddtoCart}
    Click Element    ${Checkout}
    Wait Until Element Is Visible \ \ \ \ \    ${Checkout}
    Click Element    ${Procced}

TC_6-Try to add product into cart
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin}
    Input Text    ${LoginEmail}    ${username}
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Wait Until Element Is Visible    ${Submit}
    Click Element    ${T-Shrts}
    Click element    ${AddtoCart}
    ProductQuantity

TC_7-Try to add more products into the cart
    Click Element    ${Singin}
    Sleep    3
    Input Text    ${LoginEmail}    ${username}
    Sleep    3
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Sleep    3
    Click Element    ${T-Shrts}
    Sleep    3
    Click element    ${AddtoCart}
    Sleep    3
    Click Element    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Maximize Browser Window
    Sleep    8
    Click Element    xpath://html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[5]/div/a[2]
    sleep    5

TC_8-Delete product from cart
    Click Element    ${Singin}
    Wait Unitl Element Is Visible    ${Singin}
    Input Text    ${LoginEmail}    ${username}
    Wait Unitl Element Is Visible    ${LoginEmail}
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Wait Unitl Element Is Visible    ${Submit}
    Click Element    ${T-Shrts}
    Wait Unitl Element Is Visible    ${T-Shrts}
    Click element    ${AddtoCart}
    Wait Unitl Element Is Visible    ${AddtoCart}
    Click Element    ${Checkout}
    Wait Unitl Element Is Visible    ${Checkout}
    Click Element    ${Delete}

TC_9- Log out to see if the cart info will be memorized
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin} \
    Input Text    ${LoginEmail}    ${username}
    Wait Until Element Is Visible    ${LoginEmail}
    Input Text    ${Password} \    ${pass}
    Click Button    ${Submit} \
    Wait Until Element Is Visible    ${Submit} \ \
    Click Element    ${T-Shrts}
    Wait Until Element Is Visible    ${T-Shrts} \
    Click element    ${AddtoCart}
    Wait Until Element Is Visible    ${AddtoCart} \
    Click Element    ${Checkout}
    Wait Until Element Is Visible    ${Checkout} \
    Click element    ${Logout}

TC_12-Pay by check order
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin} \
    Input Text    ${LoginEmail}    ${username}
    Wait Until Element Is Visible    ${LoginEmail}
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Wait Until Element Is Visible    ${Submit} \
    Click Element    ${T-Shrts}
    Wait Until Element Is Visible    ${T-Shrts} \
    Click element    ${AddtoCart}
    Wait Until Element Is Visible    ${AddtoCart}
    Click Element    ${Checkout}
    Wait Until Element Is Visible    ${Checkout} \
    Click Element    ${Procced0}
    Wait Until Element Is Visible    ${Procced0}
    Click Element    ${Procced1}
    Select Checkbox    ${Checkbox}
    Checkbox Should Be Selected    ${Checkbox}
    Click Element    ${Procced2}
    Wait Until Element Is Visible    ${Procced2}
    Click Element    ${PaybyCheck}

TC_13- Pay by bank wire
    Open Browser    ${URL}    chrome
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep    3
    Input Text    id:email    ${username}
    Sleep    3
    Input Text    id:passwd    ${pass}
    Click Button    id:SubmitLogin
    Sleep    3
    Click Element    //*[@id="block_top_menu"]/ul/li[3]/a
    Sleep    3
    Click element    xpath://span[text()='Add to cart']
    Sleep    3
    Click Element    xpath://html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a
    Sleep    3
    Click Element    //*[@id="center_column"]/p[2]/a[1]
    Sleep    3
    Click Element    //*[@id="center_column"]/form/p/button
    Select Checkbox    id:cgv
    Checkbox Should Be Selected    id:cgv
    Click Element    //*[@id="form"]/p/button
    Sleep    3
    Click Element    //*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
    Close Browser

TC_14-Verify corectly price is changing
    Click Element    ${Singin}
    Sleep    3
    Input Text    ${LoginEmail}    ${username}
    Sleep    3
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Sleep    3
    Click Element    ${T-Shrts}
    Sleep    3
    Click element    ${AddtoCart}
    Sleep    3
    Click Element    ${Checkout}
    Click Element    ${Quantity}
    Sleep    3
    Get Text    ${Total price}

TC_15 - Try to update address
    Open Browser    ${URL}    chrome
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep    3
    Input Text    id:email    ${username}
    Sleep    3
    Input Text    id:passwd    ${pass}
    Click Button    id:SubmitLogin
    Sleep    3
    Click Element    //*[@id="block_top_menu"]/ul/li[3]/a
    Sleep    3
    Click element    xpath://span[text()='Add to cart']
    Sleep    3
    Click Element    xpath://html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a
    Sleep    3
    Click Element    //*[@id="center_column"]/p[2]/a[1]
    Sleep    3
    Click Element    //*[@id="address_delivery"]/li[7]/a
    Close Browser

TC_16-Add new address
    Open Browser    ${URL}    chrome
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep    3
    Input Text    id:email    ${username}
    Sleep    3
    Input Text    id:passwd    ${pass}
    Click Button    id:SubmitLogin
    Sleep    3
    Click Element    //*[@id="block_top_menu"]/ul/li[3]/a
    Sleep    3
    Click element    xpath://span[text()='Add to cart']
    Sleep    3
    Click Element    xpath://html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a
    Sleep    3
    Click Element    //*[@id="center_column"]/p[2]/a[1]
    Sleep    3
    Click Element    //*[@id="center_column"]/form/div/p/a
    Close Browser

TC_17-Try to proceed without checkbox
    Open Browser    ${URL}    chrome
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep    3
    Input Text    id:email    ${username}
    Sleep    3
    Input Text    id:passwd    ${pass}
    Click Button    id:SubmitLogin
    Sleep    3
    Click Element    //*[@id="block_top_menu"]/ul/li[3]/a
    Sleep    3
    Click element    xpath://span[text()='Add to cart']
    Sleep    3
    Click Element    xpath://html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a
    Sleep    3
    Click Element    //*[@id="center_column"]/p[2]/a[1]
    Sleep    3
    Click Element    //*[@id="center_column"]/form/p/button
    Close Browser

Emty cart
    [Setup]    Open Browser    http://automationpractice.com/index.php    chrome
    Empty Cart
    [Teardown]    Close Browser

Add more Quantity
    ProductQuantity

addmoreproduct
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin}
    Input Text    ${LoginEmail}    ${username}
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Wait Until Element Is Visible    ${Submit}
    Click Element    ${T-Shrts}
    Click element    ${AddtoCart}
    sleep    3
    Click Element    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Click Element    ${shopping_cart}
    Wait Until Element Is Visible    ${shopping_cart}
    FOR    ${i}    IN RANGE    5
        Click Element    ${product_quantity}
    END
    Wait Until Page Contains     Your shopping cart contains: 4 Products

*** Keywords ***
Empty Cart
    Click Element    ${shopping_cart}
    Wait Until Element Is Visible    ${shopping_cart}
    ${numberofproducts}    Get Element Count    ${Deletebutton}
    FOR    ${i}    IN RANGE    1    ${numberofproducts}+1
        Click Element    ${Deletebutton}[${i}]
    END
    Wait Until Element Is Visible    ${Empty_cart}
    Wait Until Page Contains    Your shopping cart is empty.

ProductQuantity
    Click Element    ${Singin}
    Wait Until Element Is Visible    ${Singin}
    Input Text    ${LoginEmail}    ${username}
    Input Text    ${Password}    ${pass}
    Click Button    ${Submit}
    Wait Until Element Is Visible    ${Submit}
    Click Element    ${T-Shrts}
    Click element    ${AddtoCart}
    sleep    3
    Click Element    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Click Element    ${shopping_cart}
    Wait Until Element Is Visible    ${shopping_cart}
    FOR    ${i}    IN RANGE    5    5
        Click Element    ${Add_more_products}    3
    END
    Sleep    2
