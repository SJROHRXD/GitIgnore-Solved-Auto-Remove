# GitIgnore Solved Auto Removal Script

This PowerShell script prompts the user for information about which Solved Activity folders to remove from a specified .gitignore file. The script removes all Solved Activity folders listed in the target .gitignore by the specified Directory and Module Name. The steps in the script are as follows:

1. The script displays a prompt to the user to press any key to continue and then prompts the user to enter the initial location of the .gitignore file.
2. The script validates the user input and ensures that the specified repository is a valid container path.
3. The script prompts the user to enter the folder name containing the target Solved folders to remove from .gitignore and constructs the path to this folder.
4. The script reads the existing content of the .gitignore file.
5. The script filters the lines containing the folder name and "01-Activities/\*" path and creates an updated content array without these lines.
6. The script writes the updated content along with a comment and timestamp to the .gitignore file and notifies the user of any removed entries.

To Use:

1. Extract the downloaded ZIP file to a location on your computer.
2. Open PowerShell on your computer and navigate to the directory where the extracted script is located using the "cd" command.
3. Run the script by typing its filename (e.g., ".\theBestRemoveScript.ps1") and pressing Enter.
4. Follow the prompts in the script to enter the necessary information.
5. Always double-check the .gitignore file upon completion!
6. Report bugs to [me](https://github.com/SJROHRXD)!

Depending on security settings, you may need to change the execution policy for PowerShell scripts to run the script. Run PowerShell as an administrator and typing the following command:

    Set-ExecutionPolicy RemoteSigned.
