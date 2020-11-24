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


Emty cart
    [Setup]    Open Browser    http://automationpractice.com/index.php    chrome
    Empty Cart
    [Teardown]    Close Browser

Add more Quantity
    ProductQuantity



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
    Click Element    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Click Element    ${shopping_cart}
    Wait Until Element Is Visible    ${shopping_cart}
    FOR    ${i}    IN RANGE    5
        Click Element    ${product_quantity}
    END
    Wait Until Page Contains     Your shopping cart contains: 4 Products

