*** Settings ***
Library           SeleniumLibrary
*** Variables ***
${LOGIN URL}      http://localhost:8080/account/login
${BROWSER}        Chrome
*** Test Cases ***
Login Success Test
    [Tags]    Login Success
    [Documentation]    This is login test login success
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL}
    Set Browser Implicit Wait    4
    Input Text     id=email          vylethe@gmail.com
    Input Text     id=password             123
    Sleep    2
    Click Button    id=btnLogin 
    Element Text Should Be    id=msgS    Login Successfully    
    Sleep    2    
    Close Browser
    Log    Test Completed 
Validate Email Test
    [Tags]    Login Fail Email by Email
    [Documentation]    This is login test validate email
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL} 
    Set Browser Implicit Wait    4
    Input Text    id=email    vylethe123@gmail.com
    Input Password    id=password    123
    Sleep    2
    Click Button    id=btnLogin 
    Element Text Should Be    id=msgE    Please enter a valid email    
    Sleep    2   
    Close Browser
    Log    Test Completed     
Validate Password Test
    [Tags]    Login Fail Email by Password
    [Documentation]    This is login test validate password
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL} 
    Set Browser Implicit Wait    4
    Input Text    id=email    vylethe@gmail.com
    Input Password    id=password    123456
    Sleep    2
    Click Button    id=btnLogin 
    Element Text Should Be    id=msgP    Please enter a valid password     
    Sleep    2   
    Close Browser
    Log    Test Completed 
Email and Password is empty Test
    [Tags]    Login Fail by Email and Password is empty
    [Documentation]    This is login test validate password
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL} 
    Set Browser Implicit Wait    4
    Sleep    2
    Click Button    id=btnLogin 
    Element Text Should Be    id=msgE    Email is Mandatory Field    
    Element Text Should Be    id=msgP    Password is Mandatory Field    
    Sleep    2   
    Close Browser
    Log    Test Completed
Email is empty and Password is not empty Test
    [Tags]    Login Fail by Email is empty
    [Documentation]    This is login test validate password
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL} 
    Set Browser Implicit Wait    4
    Input Password    id=password    123456
    Sleep    2
    Click Button    id=btnLogin 
    Element Text Should Be    id=msgE    Email is Mandatory Field    
    Sleep    2   
    Close Browser
    Log    Test Completed
Email is not empty and Password is empty Test
    [Tags]    Login Fail by Password is empty
    [Documentation]    This is login test validate password
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL} 
    Set Browser Implicit Wait    4
    Input Text    id=email    vylethe@gmail.com
    Sleep    2
    Click Button    id=btnLogin 
    Element Text Should Be    id=msgP    Password is Mandatory Field    
    Sleep    2   
    Close Browser
    Log    Test Completed
Remmember me Test
    [Tags]    Remmember me
    [Documentation]    Login succes and click back to login web, Email and password is save
    Create Webdriver    ${BROWSER}     executable_path=C:/Program Files/Python/Scripts/chromedriver.exe
    Go To   ${LOGIN URL} 
    Set Browser Implicit Wait    4
    Input Text     id=email          vylethe@gmail.com
    Input Password    id=password             123
    Click Element  xpath=(//label[@for='customCheck1'])
    Sleep    2     
    Click Button    id=btnLogin
    Sleep    1
    Click Link    Back login
    Element Attribute Value Should Be    id=email    value    vylethe@gmail.com
    Element Attribute Value Should Be    id=password    value    123
    Sleep    2   
    Close Browser
    Log    Test Completed    