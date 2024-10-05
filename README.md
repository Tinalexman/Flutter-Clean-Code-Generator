# Flutter Clean Code Generator

This is a tool that can generate clean architecture for a new Flutter project. The tool should be run after executing `flutter create`.
The tool creates two main folders in your `lib` folder: `core` and `features`. 

The `core` folder contains all the files that are used all across the application and are feature independent.
The `feature` folder contains the app specific files.

## Note
Please make sure the `core` and `features` do not already exist otherwise, this tool will throw an error.
You can delete any unneeded file or folder after the tool has finished executing
The tool also assumes that you have certain dependencies installed. The dependencies are listed out when the tool is run. If you do not have those dependencies, you can install them by adding them to yoru `pubspec.yaml` file and running `flutter pub get`.

## Core
The `core` folder contains several folders:
- `controllers`: This folder contains a notification controller for handling push notifications
- 
