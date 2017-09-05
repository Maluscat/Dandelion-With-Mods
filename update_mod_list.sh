cd assets
echo "Updating mod list!"
echo "Searching for mods..."
printf '%s\n' `/usr/bin/ls`
echo "Now redirecting!"
echo "## Modlist" > ../mods.md
echo "|Modname|" >> ../mods.md
echo "|---|" >> ../mods.md
printf '|%s|\n' `ls | tr "/" " "` >> ../mods.md
