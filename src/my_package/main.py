# nuitka-project-if: os.getenv("NUITKA_DEPLOYMENT") == "yes":
#  nuitka-project: --deployment
# nuitka-project: --mingw64
# nuitka-project: --output-filename=my_package.exe
# nuitka-project: --mode=standalone
# nuitka-project: --noinclude-default-mode=error
# nuitka-project: --product-name="My Package"

if __name__ == "__main__":
    print("Hello world!")
