@echo off
echo Searching for mods!
dir /B assets
echo ^|Modname^| > mods.md
echo ^|---^| >> mods.md
for /F %%A IN ('dir /B assets') DO (
	echo ^|%%A^| >> mods.md
)
