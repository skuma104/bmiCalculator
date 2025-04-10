@echo off
rem Run to activate on MS Windows

if not exist venv (
  python -m venv venv
)

if not defined VIRTUAL_ENV (
  call venv\Scripts\activate.ps1
)

python -m pip --require-virtualenv install -q --upgrade pip
python -m pip --require-virtualenv install -q -r requirements.txt

rem Add java to the path
