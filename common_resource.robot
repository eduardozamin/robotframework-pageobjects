*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        EntrezLibrary


*** Variables ***

${SERVER}        www.ncbi.nlm.nih.gov
${BROWSER}       phantomjs
${DELAY}         1
${VALID USER}    demo
${VALID PASSWD}  mode
${PUBMED}        http://${SERVER}/pubmed/
${PUBMED_TITLE}  Home - PubMed - NCBI
${WELCOME URL}   http://${SERVER}/html/welcome.html
${ERROR URL}     http://${SERVER}/html/error.html


*** Keywords ***

Open Browser To PubMed Home Page
    Open Browser  ${PUBMED}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  ${PUBMED_TITLE}

Search PubMed For  [Arguments]  ${term}
    Input Text  term  ${term}
    Click Button  search

Click See More Search Details
    Click Link  xpath=id('search_details')/a[@class='seemore']

Search Details Should Be  [Arguments]  ${expected}
    ${val} =  Get Text  DetailsTerm
    Should Be Equal  ${val}  ${expected}