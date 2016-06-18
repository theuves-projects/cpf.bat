@echo off

set /a i=0

:l1
if %i%==9 (
    goto continue1
)

set /a cpf%i%=%random% %% 10

set /a i=%i%+1
goto l1

:continue1

set /a j=0

set /a v2=0
set /a v1=0

:l2
if %j%==9 (
    goto continue2
)

set /a v1=%v1% + cpf%j% * (9 - (%j% %% 10))
set /a v2=%v2% + cpf%j% * (9 - ((%j% + 1) %% 10))

set /a j=%j%+1
goto l2

:continue2

set /a v1=(%v1% %% 11) %% 10
set /a v2=%v2% + %v1% * 9
set /a v2=(%v2% %% 11) %% 10

set k=0
set cpf=

:l3
if %k%==9 (
    goto continue3
)

set /a num=cpf%k%

if %k%==5 (
    set cpf=.%num%%cpf%
) else (
    if %k%==2 (
        set cpf=.%num%%cpf%
    ) else (
        set cpf=%num%%cpf%
    )
)

set /a k=%k+1
goto l3

:continue3

echo %cpf%-%v1%%v2%
