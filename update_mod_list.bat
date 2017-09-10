@echo off
echo Searching for mods!
echo Found mods:
dir /B assets
echo Now writing to mods.md
echo ## Modlist > mods.md
echo ^|Modname^| >> mods.md
echo ^|---^| >> mods.md
for /F %%A IN ('dir /B assets') DO (
	echo ^|%%A^| >> mods.md
)
echo Done.
pause >nul
