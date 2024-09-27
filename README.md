# tpl_python_package

Template for a new Python package.

Before anything else, create a virtual environment and execute these commands:

    (venv) pip install tox
    (venv) tox run -e update-requirements
    (venv) pip install -r requirements/dev.txt

If you encounter TLS or SSL error when downloading packages, you may need to
install *pip-system-certs* package in your global and/or virtual environment.
