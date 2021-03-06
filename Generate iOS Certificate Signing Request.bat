@ECHO OFF
:: Edit the Open SSL directory here
set OPENSSL_BIN_DIR=C:\OpenSSL-Win32\bin
cd %OPENSSL_BIN_DIR%

ECHO Setting OpenSSL bin directory to %OPENSSL_BIN_DIR%...

set OPENSSL_CONF=%OPENSSL_BIN_DIR%\openssl.cfg
set RANDFILE=.rnd
:: Edit the name of the key to create here
set KEY_NAME=mykey.key

ECHO Setting Key name to %KEY_NAME%...
PAUSE

@ECHO ON
openssl genrsa -passout pass:fd -out %KEY_NAME% 2048
@ECHO OFF

:: Edit your email, common name for your private key, and Country here
set EMAIL=Your email :: Same as the one you used for your Apple Developer account
set NAME=Your name :: Same as the one you used for your Apple Developer account
set COUNTRY=Your country :: e.g. US
:: Edit your Certificate Signing Request name here
set CSR_NAME=CertificateSigningRequest.certSigningRequest

ECHO Setting Email to %EMAIL%...
ECHO Setting Name to %NAME%...
ECHO Setting Country to %COUNTRY%...
ECHO Setting Certificate Signing Request name to %CSR_NAME%...

PAUSE
@ECHO ON
openssl req -new -key %KEY_NAME% -out %CSR_NAME% -subj "/emailAddress=%EMAIL%/CN=%NAME%/C=%COUNTRY%"
PAUSE
