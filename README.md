# tpl_python_package

Template for a new Python package.

Before anything else, create a virtual environment and execute these commands:

```plaintext
(venv) pip install tox
(venv) tox run -e update-requirements
(venv) pip install -r requirements/dev.txt
```

Open `.gitignore` file and remove this line:

```plaintext
requirements/*.txt
```

If you encounter TLS or SSL error when downloading packages, you may need to
install *pip-system-certs* package in your global and/or virtual environment.

## Environment variables troubleshooting

If you have difficulty loading environment variables from .env file when activating your virtual environment inside Visual Studio Code, add these lines to the end of the activation script.

For Command line terminal, open `.venv/Scripts/activate.bat` file and add this at the end :

```bat
if EXIST %VIRTUAL_ENV%\..\.env (
    FOR /F "tokens=*" %%i in ('type %VIRTUAL_ENV%\..\.env') do SET %%i
)
```

For Powershell terminal, open `.venv/Scripts/Activate.ps1` file and add this at the end :

```powershell
$RootPath = $VenvExecDir.Parent.Parent.FullName.TrimEnd("\\/")
$EnvFilePath = $RootPath + "/.env"

if (Test-Path $EnvFilePath -PathType leaf) {
    Get-Content ($RootPath + "/.env") | foreach {
        $name, $value = $_.split('=')
        if ([string]::IsNullOrWhiteSpace($name) -or $name.Contains('#')) {
            continue
        }
        Set-Content env:\$name $value
    }
}
```
