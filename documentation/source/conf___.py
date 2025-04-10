# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
import sys
sys.path.insert(0, os.path.abspath('../..'))

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'BMI_calculator'
copyright = '2025, Shiv'
author = 'Shiv'
release = '0.0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.duration',
    'sphinx.ext.doctest',
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.intersphinx',
    'sphinx.ext.todo',
    'sphinx.ext.graphviz',
    'sphinx_needs',
    'sphinxcontrib.test_reports',
    'sphinxcontrib.plantuml',
    'sphinx_tabs.tabs',
]

# Results directory configuration
results_dir = os.path.join(os.path.dirname(__file__), 'results')
os.makedirs(results_dir, exist_ok=True)

# Robot Framework configuration
#robot_reports_dir = os.path.join(os.path.dirname(__file__), 'robot_results')
#robot_tests_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../tests/robot_tests'))

# Use raw string for Windows paths
robot_tests_dir = r'C:\Users\skuma104\OneDrive - Capgemini\Documents\Innovation-Project\BMI_calculator\documentation\source\robot_results'  # adjust this path
robot_test_results = os.path.join(robot_tests_dir, 'output.xml')

# Create directories if they don't exist
#os.makedirs(robot_reports_dir, exist_ok=True)

# Robot Framework settings
robot_options = [
    '--outputdir', robot_tests_dir,
    '--output', 'output.xml',
    '--report', 'report.html',
    '--log', 'log.html',
]

# Enable Robot Framework tests during Sphinx compilation
sphinx_test_reports_enabled = True

# Hide Robot Framework syntax from the Sphinx output by default
sphinx_test_reports_quiet = True

# Test report configuration
test_reports_path = os.path.join(os.path.dirname(__file__), 'results')

# Create the directory if it doesn't exist
os.makedirs(test_reports_path, exist_ok=True)

# Test reports configuration
test_reports_options = {
    'junit_xml_path': os.path.join(test_reports_path, 'output.xml'),
    'report_name': 'Test Results',
    'show_passed_tests': True,
    'show_skipped_tests': True
}

# Theme configuration
templates_path = ['_templates']

# Other Sphinx configurations
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

# Add results directory to html_extra_path to include Robot Framework reports
html_extra_path = [results_dir]
