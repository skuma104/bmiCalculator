Application for calculating BMI
=================================================

This template is describes the BMI calculator application and how to use it with some basic Sphinx docs.
It is a simple application that calculates the Body Mass Index (BMI) based on the user's weight and height.
It is a command line application that can be run in a terminal or command prompt.The application is written 
in Python and uses the BMI formula to calculate the BMI.

BMI = weight (kg) / (height (m) * height (m))

The application is tested using Robot Framework and the tests are located in the 'tests/robotTests' directory.
The test results can be found at 'tests/robotTests/test-results' directory. And also here in GitHub Pages:
https://bmicalculator-doc.readthedocs.io/en/latest/. 
The documentation is generated using Sphinx and the source files are located in the 'documentation/source' directory.

If you want to build this documentation yourself, you can clone the archive and build it.
You need to run the tests in 'tests/robotTests' before the documentation can be built.
The manual on how to build the documentation can be found in the 'documentation/source/usage.rst' file.
