@echo off
echo ---------------------------------------------------------------------------------------------------------------
echo.
echo  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
echo  documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
echo  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
echo  and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
echo.
echo  The above copyright notice and this permission notice shall be included in all copies or substantial portions 
echo  of the Software.
echo.
echo  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
echo  TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
echo  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
echo  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
echo  IN THE SOFTWARE.
echo.
echo ---------------------------------------------------------------------------------------------------------------

SETLOCAL

REM -- Default Configuration --------------------------------------------------

SET ip=127.0.0.1
SET port=1010
SET application="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
SET arguments= --kiosk http://127.0.0.1:1010 --incognito --disable-pinch --overscroll-history-navigation=0 --no-user-gesture-required
SET restart=n

REM -- Code -------------------------------------------------------------------

:next-argument

   IF [%1] == [] GOTO listen
      SET  %1
   SHIFT

   GOTO next-argument

:listen

   echo  Waiting for %ip%:%port%

:retry

   netstat -an | find "%ip%:%port%" | find "LISTENING" | find "0.0.0.0" >nul 2>nul && (
      echo  Server listening on port %port%.
      echo  Starting %application% %arguments%
      
      %application% %arguments%
   ) || (
      goto retry
   )

IF [%restart%] == [y] GOTO listen
