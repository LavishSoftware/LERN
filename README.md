# LERN
We're here to LERN! Lavish Example Repository ... node ...  provides examples and resources for learning LavishScript, and LavishGUI 2 and friends, with an eye on building ISBoxer 2 Modules.

LERN is a work-in-progress, originally created with supplemental materials to teach a small group. We are now providing these examples, and we will work on filling in additional or missing details for you to learn from.

Some of the examples now have readme-sort of .md files with them, and we will continue improving them -- while removing large blocks of comments from the code itself for readability.

LERN covers a range of topics, from beginner level to advanced. 

# Requirements
* **Using LERN will require you to have Inner Space** (not free) **or dxLavish** (basically a free, lightweight/stripped-down Inner Space instance). 
  * LERN is designed with dxLavish in mind, and so does not *require* Inner Spce itself.
* **[Visual Studio Code](https://code.visualstudio.com/) is our recommended editor**, for LavishScript highlighting in particular. 
  * A **LavishScript add-on for VS Code is available from the Marketplace**, and should automatically provide a notification to download it the first time you open a LavishScript .iss file with Visual Studio Code.

# Getting Started
Note: Some examples are affected by known **bugs that are fixed in updated builds of Inner Space** or dxLavish. For best results, please use the latest build of dxLavish, or the latest development build of Inner Space.

* **Place the LERN folder** in your dxLavish folder, or under **Inner Space/Scripts**.
* **Open the LERN folder** with Visual Studio Code. **The ```LERN/LS``` folder** provides your **Introduction to LavishScript**.

## Scripting with LavishScript 
* **Open the file [LS/README.md](LS/README.md)**; either click the provided link, or right click the file in Visual Studio Code, and select **Open Preview**
  * Alternatively, if you've opened the file in editing mode, you can press the Visual Studio Code hotkey **Ctrl+Shift+V** to view the formatted preview.
* Follow the instructions provided in each entry. Progress upward in number through the series to master the basics of LavishScript!

## Graphical User Interface with LavishGUI 2
After completing the ```LERN/LS``` folder **it is recommended to move on specifically to LGUI2/1.iss**:
* **Open [LGUI2/1.iss](LGUI2/1.iss)** and **[LGUI2/1.json](LGUI2/1.json)** in Visual Studio Code, so that one at a time can be viewed side-by-side with **[LGUI2/1.md](LGUI2/1.md)**
* **Run** LERN/LGUI2/1.iss in dxLavish or Inner Space via the Console with the command ```run lern/lgui2/1```
* Use the **EndScript** command to end the script when finished. The command ```end 1``` will end LERN/lgui2/1 (full path not required). 
  * Unless otherwise specified, all examples that use LGUI2 interfaces will remain running until specifically shut down, even if the GUI window is closed.
  * To see a list of scripts currently running, use the command ```scripts -running```

The LavishGUI 2 examples are broken into many separate series, covering different types of UI controls and concepts.

# Topics
Different subject are generally divided into main folders, each with one or more example series within.

* **LS**: Introduction to LavishScript
* **LGUI2**: Covers many aspects of LavishGUI 2
* **JSON**: Read and Write JSON in LavishScript
* **Lists**: Manage lists of things in LavishScript, including conversion to and from JSON
* **LMAC**: LavishMachine, a Virtual Machine system that currently manages "Tasks" for LavishScript
* **Game**: Introduction to game development with LavishGUI 2!
* **Audio**: Use the Audio engine to play sounds

# Tinker!
The examples are meant for you to learn from, and even **try out your own changes. Just edit, save, and run!**

# Discussion
* [Lavish Software Discord](https://discord.gg/qmtPT4j) has a #LERN channel for LERN discussion and updates. Join the server and see #more_channels for access!
