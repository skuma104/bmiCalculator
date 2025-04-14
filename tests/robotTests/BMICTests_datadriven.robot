*** Settings ***
Documentation     Data-driven tests for BMI calculator
Resource          /app/docker-resources/bmi_keywords_datadriven.resource
Test Setup        Setup BMI Test
Test Teardown     Cleanup BMI Test


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