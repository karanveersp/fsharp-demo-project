# initialize a readme for project instructions.
readme=$"
# Start an F# project!
1. Create a new F# project with ctrl+shift+p > F#: New Project
2. Leave Project Directory blank, and enter a Project Name.
3. Build the project with ctrl+shift+p > FAKE: Build Default
  
# How to link a library to a console project
1. Create a library project using csp > F#: New Project (csp means ctrl+shift+p).
2. Open the ConsoleProject.fsproj file.
3. Using csp, add a project reference by selecing the source, and then the target.
4. Done!

# Run the project 
"
echo "$readme" > README.md
echo '```bash' >> README.md
echo 'dotnet run -p ProjectName' >> README.md
echo '```' >> README.md
echo "Or run the exe!" >> README.md
echo '```bash' >> README.md
echo './ProjectName/bin/Release/netcoreapp3.1/ProjectName' >> README.md
echo '```' >> README.md

# create new fake files
echo "Y
Y" | dotnet new fake --force

# add paket as tool
dotnet tool install paket

# initialize paket and it's lockfile
dotnet paket init && dotnet paket install

# write the .sh and .cmd files
rm fake.cmd fake.sh
shellCommands=$"dotnet tool restore
dotnet paket restore
dotnet fake run build.fsx"

echo "#!/usr/bin/env bash" > build.sh
echo "$shellCommands" >> build.sh  # appending
echo "$shellCommands" > build.cmd

# Edit the text inside the build.fsx.
# With this edit, we can create top level
# projects using command palette F#: New Project
# with the project directory field blank.
sed -i -e 's/src/\./g' build.fsx

# prepare .gitignore
gitignoreContent=$".fake
.ionide
# Paket dependency manager
.paket/
paket-files/
bin/
obj/"
echo "$gitignoreContent" > .gitignore

# run build
chmod +x build.sh
./build.sh