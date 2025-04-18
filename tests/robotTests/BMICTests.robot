*** Settings ***
Documentation     Gherkin style tests for BMI calculator
Resource          /app/docker-resources/bmi_keywords.resource
Test Setup        Setup BMI Test
Test Teardown     Cleanup BMI Test

*** Test Cases ***
Scenario: Calculate BMI for Normal Weight Person
    Given the BMI calculator is available
    When I calculate BMI with height "175" cm and weight "70" kg
    Then the BMI result should be "22.9"
    And the BMI category should be "Normal weight"

Scenario: Calculate BMI for Underweight Person
    Given the BMI calculator is available
    When I calculate BMI with height "180" cm and weight "55" kg
    Then the BMI result should be "17.0"
    And the BMI category should be "Underweight"

Scenario: Calculate BMI for Overweight Person
    Given the BMI calculator is available
    When I calculate BMI with height "165" cm and weight "75" kg
    Then the BMI result should be "27.5"
    And the BMI category should be "Overweight"

Scenario: Calculate BMI for Obese Person
    Given the BMI calculator is available
    When I calculate BMI with height "170" cm and weight "95" kg
    Then the BMI result should be "32.9"
    And the BMI category should be "Obese"

Scenario: Validate Error for Missing Height
    Given the BMI calculator is available
    When I calculate BMI with height "" cm and weight "70" kg
    Then an error should be reported
    And the error should contain "Please enter your height"

Scenario: Validate Error for Missing Weight
    Given the BMI calculator is available
    When I calculate BMI with height "175" cm and weight "" kg
    Then an error should be reported
    And the error should contain "Please enter your weight"

Scenario: Validate Error for Non-Numeric Height
    Given the BMI calculator is available
    When I calculate BMI with height "abc" cm and weight "70" kg
    Then an error should be reported
    And the error should contain "Please enter valid numbers"

Scenario: Validate Error for Non-Numeric Weight
    Given the BMI calculator is available
    When I calculate BMI with height "175" cm and weight "xyz" kg
    Then an error should be reported
    And the error should contain "Please enter valid numbers"

Scenario: Validate Error for Zero Height
    Given the BMI calculator is available
    When I calculate BMI with height "0" cm and weight "70" kg
    Then an error should be reported
    And the error should contain "Height must be a positive number"

Scenario: Validate Error for Negative Height
    Given the BMI calculator is available
    When I calculate BMI with height "-10" cm and weight "70" kg
    Then an error should be reported
    And the error should contain "Height must be a positive number"

Scenario: Validate Error for Zero Weight
    Given the BMI calculator is available
    When I calculate BMI with height "175" cm and weight "0" kg
    Then an error should be reported
    And the error should contain "Weight must be a positive number"

Scenario: Validate Error for Negative Weight
    Given the BMI calculator is available
    When I calculate BMI with height "175" cm and weight "-60" kg
    Then an error should be reported
    And the error should contain "Weight must be a positive number"

Scenario: Calculate BMI with Boundary Values - Minimum Normal Weight
    Given the BMI calculator is available
    When I calculate BMI with height "170" cm and weight "53.5" kg
    Then the BMI result should be "18.5"
    And the BMI category should be "Normal weight"

Scenario: Calculate BMI with Boundary Values - Maximum Normal Weight
    Given the BMI calculator is available
    When I calculate BMI with height "170" cm and weight "72.2" kg
    Then the BMI result should be "25.0"
    And the BMI category should be "Overweight"