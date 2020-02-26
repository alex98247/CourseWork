@echo CPS Conference Tool
@for %%I in (*.jpg) do (
@call "%~dp0jpeg2ps.exe" -r 0 -o %%~nI.eps %%~nI.jpg
)
@pause
