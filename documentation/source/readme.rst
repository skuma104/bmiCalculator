Welcome to Sphinx
==================

All documentation is to be written is reStructuredText.
Later, the documentation will be built using Sphinx.
See the `Sphinx website <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ 
for examples of how to use reStructuredText.
To get a preview pane in VisualStudioCode, install the *reStructuredText Syntax highlighting* plugin.

To get started with Sphinx install the following on your computer:

  * Python (install from https://www.python.org/)
  * Java (make sure that java is somewhere in your path. Check with: java -version)

Then extract the attached zipfile into a documentation folder (in the root) of your Git archive

  * Navigate to the root of this folder in your command prompt (or shell on \*ux)
  * Enter activate.bat (This takes a while because all prerequisites are downloaded into a virtual environment)
      On OSX/ux/pi enter: source activate.sh
  * Enter make html to build the actual documentation (this is to be repeated when something has changed)
  * View the documentation by opening the index.html in your favorite browser
 
