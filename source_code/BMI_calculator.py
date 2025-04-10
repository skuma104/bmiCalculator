def calculate_bmi(height, weight):
    """
    Calculate BMI (Body Mass Index) and determine the weight category.
    
    Args:
        height: Height in centimeters (can be string or numeric)
        weight: Weight in kilograms (can be string or numeric)
        
    Returns:
        tuple: (bmi_value, category) if successful
               (None, error_message) if there was an error
    """
    # Input validation
    if not height:
        return None, "Error: Please enter your height"
    if not weight:
        return None, "Error: Please enter your weight"
        
    try:
        # Convert inputs to float
        height_m = float(height) / 100  # Convert cm to meters
        weight_kg = float(weight)
        
        # Check for positive values
        if height_m <= 0:
            return None, "Error: Height must be a positive number"
        if weight_kg <= 0:
            return None, "Error: Weight must be a positive number"
            
        # Calculate BMI
        bmi = weight_kg / (height_m ** 2)
        bmi_rounded = round(bmi, 1)  # Round to 1 decimal place
        
        # Determine category
        if bmi_rounded < 18.5:
            category = "Underweight"
        elif 18.5 <= bmi_rounded < 25:
            category = "Normal weight"
        elif 25 <= bmi_rounded < 30.0:
            category = "Overweight"
        else:
            category = "Obese"
            
        return bmi_rounded, category
        
    except ValueError:
        return None, "Error: Please enter valid numbers"
    except Exception as e:
        return None, f"Error: {str(e)}"

def main():
    """Command line interface for the BMI calculator."""
    print("BMI Calculator")
    print("-" * 20)
    
    try:
        height = input("Enter your height (cm): ")
        weight = input("Enter your weight (kg): ")
        
        bmi, category = calculate_bmi(height, weight)
        
        if bmi is None:
            print(category)  # This will be the error message
        else:
            print(f"Your BMI is: {bmi}")
            print(f"Category: {category}")
            
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    main()