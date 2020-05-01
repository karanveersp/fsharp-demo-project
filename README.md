
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

```bash
dotnet run -p ProjectName
```
Or run the exe!
```bash
./ProjectName/bin/Release/netcoreapp3.1/ProjectName
```
