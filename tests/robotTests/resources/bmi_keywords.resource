*** Settings ***
Documentation     Keywords for BMI calculator tests
Library           OperatingSystem
Library           String
Library           ../../source_code/BMI_calculator.py

*** Variables ***
${BMI_MODULE}     C:/Users/skuma104/OneDrive - Capgemini/Documents/Innovation-Project/BMI_calculator/source_code/BMI_calculator.py

*** Keywords ***
Setup BMI Test
    File Should Exist    ${BMI_MODULE}    msg=BMI calculator module not found at ${BMI_MODULE}
    Log    Setting up test for BMI calculator

Cleanup BMI Test
    # Any cleanup needed after tests
    No Operation

the BMI calculator is available
    Log    Verified BMI calculator is available

I calculate BMI with height "${height}" cm and weight "${weight}" kg
    ${result}=    Calculate BMI    ${height}    ${weight}
    
    # Store the result components
    Set Test Variable    ${BMI_VALUE}    ${result}[0]
    Set Test Variable    ${BMI_CATEGORY}    ${result}[1]
    
    # Log the results
    Log    BMI Result: ${result}
    Log    BMI Value: ${BMI_VALUE}
    Log    BMI Category: ${BMI_CATEGORY}

the BMI result should be "${expected_bmi}"
    # Handle the case where BMI_VALUE might be None (error case)
    ${actual_bmi}=    Set Variable If    "${BMI_VALUE}" == "None"    None    ${BMI_VALUE}
    
    # Convert expected_bmi to the same type for comparison
    ${expected}=    Set Variable If    "${expected_bmi}" == "None"    None    ${expected_bmi}
    
    # Compare the values
    Should Be Equal As Strings    ${actual_bmi}    ${expected}    
    ...    msg=Expected BMI value ${expected} but got ${actual_bmi}

the BMI category should be "${expected_category}"
    Should Be Equal    ${BMI_CATEGORY}    ${expected_category}    
    ...    msg=Expected category ${expected_category} but got ${BMI_CATEGORY}

an error should be reported
    Should Be Equal    ${BMI_VALUE}    ${None}    
    ...    msg=Expected an error (None BMI value) but got: ${BMI_VALUE}
    Should Contain    ${BMI_CATEGORY}    Error    
    ...    msg=Expected error message but got: ${BMI_CATEGORY}

the error should contain "${expected_text}"
    Should Contain    ${BMI_CATEGORY}    ${expected_text}    ignore_case=True
    ...    msg=Expected error message containing '${expected_text}' but got: ${BMI_CATEGORY}