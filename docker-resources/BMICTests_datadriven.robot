
*** Settings ***
Documentation     Data-driven tests for BMI calculator
Resource          /app/docker-resources/bmi_keywords_datadriven.resource
Test Setup        Setup BMI Test
Test Teardown     Cleanup BMI Test

*** Variables ***
# Test data for valid BMI calculations
#@{VALID_CASES}=
#...    175;70;22.9;Normal weight
#...    180;55;17.0;Underweight
#...    165;75;27.5;Overweight
#...    170;95;32.9;Obese
#...    170;53.5;18.5;Normal weight
#...    170;72.2;25.0;Overweight
#...    190;85;23.5;Normal weight
#...    155;45;18.7;Normal weight
#...    160;100;39.1;Obese
#...    200;120;30.0;Obese

# Test data for error cases
#@{ERROR_CASES}=
#...    ${EMPTY};70;Please enter your height
#...    175;${EMPTY};Please enter your weight
#...    abc;70;Please enter valid numbers
#...    175;xyz;Please enter valid numbers
#...    0;70;Height must be a positive number
#...    -10;70;Height must be a positive number
#...    175;0;Weight must be a positive number
#...    175;-60;Weight must be a positive number

*** Test Cases ***
Valid BMI Calculations Using Template
    [Documentation]    Tests valid BMI calculations using a test template
    [Template]    Verify Valid BMI Calculation
    # height    weight    expected_bmi    expected_category
    175        70        22.9            Normal weight
    180        55        17.0            Underweight
    165        75        27.5            Overweight
    170        95        32.9            Obese
    170        53.5      18.5            Normal weight
    170        72.2      25.0            Overweight

Error Cases Using Template
    [Documentation]    Tests error scenarios using a test template
    [Template]    Verify BMI Error Case
    # height    weight    expected_error
    ${EMPTY}    70        Please enter your height
    175        ${EMPTY}   Please enter your weight
    abc        70         Please enter valid numbers
    175        xyz        Please enter valid numbers
    0          70         Height must be a positive number
    -10        70         Height must be a positive number
    175        0          Weight must be a positive number
    175        -60        Weight must be a positive number

#Valid BMI Calculations Using List Data
#    [Documentation]    Tests valid BMI calculations using list data
#    FOR    ${test_case}    IN    @{VALID_CASES}
#        ${data}=    Split String    ${test_case}    ;
#        ${height}=    Set Variable    ${data}[0]
#        ${weight}=    Set Variable    ${data}[1]
#        ${expected_bmi}=    Set Variable    ${data}[2]
#        ${expected_category}=    Set Variable    ${data}[3]
#        
#        Verify Valid BMI Calculation    ${height}    ${weight}    ${expected_bmi}    ${expected_category}
#    END
#
#Error Cases Using List Data
#    [Documentation]    Tests error scenarios using list data
#    FOR    ${test_case}    IN    @{ERROR_CASES}
#        ${data}=    Split String    ${test_case}    ;
#        ${height}=    Set Variable    ${data}[0]
#        ${weight}=    Set Variable    ${data}[1]
#        ${expected_error}=    Set Variable    ${data}[2]
#        
#        Verify BMI Error Case    ${height}    ${weight}    ${expected_error}
#    END

*** Keywords ***
Verify Valid BMI Calculation
    [Arguments]    ${height}    ${weight}    ${expected_bmi}    ${expected_category}
    [Documentation]    Verifies a valid BMI calculation
    Given the BMI calculator is available
    When I calculate BMI with height "${height}" cm and weight "${weight}" kg
    Then the BMI result should be "${expected_bmi}"
    And the BMI category should be "${expected_category}"

Verify BMI Error Case
    [Arguments]    ${height}    ${weight}    ${expected_error}
    [Documentation]    Verifies an error case in BMI calculation
    Given the BMI calculator is available
    When I calculate BMI with height "${height}" cm and weight "${weight}" kg
    Then an error should be reported
    And the error should contain "${expected_error}"