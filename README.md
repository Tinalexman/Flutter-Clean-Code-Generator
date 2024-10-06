# Flutter Clean Code Generator

This is a tool that can generate clean architecture for a new Flutter project. `Squeaky Clean` should be run after executing `flutter create`.
`Squeaky Clean` creates two main folders in your `lib` folder: `core` and `features`.

The `core` folder contains shared resources, utilities, and configurations used across the app. It is kept separate so it is reusable and not tied to any particular feature..
The `feature` folder contains files that perform a specific task.

## Note
Please make sure the `core` and `features` do not already exist otherwise, they will be overwritten. Also ensure that you have not made any modifications to your `main.dart` file as well because it will be overwritten.

You can delete any unneeded file or folder after the tool has finished executing

`Squeaky Clean` also assumes that you have certain dependencies installed. The dependencies are listed out when the tool is run. If you do not have those dependencies, you can install them by adding them to your `pubspec.yaml` file and running `flutter pub get`.

Please ensure the project name you specify should match with the one used when running `flutter create`.


## Core
The `core` folder contains several folders:
- `controllers`: This folder contains a notification controller for handling push notifications
- `database`: This folder contains the configuration for setting up local database
- `error`: This folder contains the custom error for the app and the handler for handling the errors
- `extensions`: This folder contains the extensions defined. By default, it contains extensions on `BuidContext`, `DateTime` and `String`
- `file`: This folder contains file related functions like selecting files, converting files to `Uint8List` or `base64` strings
- `functions`: This folder contains app-wide functions including formatting `DateTime` or `num`
- `navigation`: This folder defines all the pages that can be routed to.
- `network`: This folder contains all network configurations
- `provider`: This folder contains all global providers
- `ui`: This folder contains all UI related content, including the colors and theme of the application


## Features
The `features` folder contains a list of features. A feature is simply a group of files that perform a single task. For example, you could have a feature called `authentication`. This means that all files under the authentication feature are only concerned about authentication, which can then be broken down into registration, login, email verification, password recovery and so on.

Each feature is comprised of 3 different folders: `data`, `domain` and `presentation`.
The `data` folder is responsible for fetching and saving data from data sources (API or local databses).
The `domain` folder contains the business logic, including entities, repositories, and use cases.
The `presentation` folder manages the UI and its logic.

Each of these folders is, in turn, broken into 3 sub folders

The `data` layer makes it easy to replace or mock data sources for testing, without affecting the rest of the app and is broken down into
- `models`: Contains data models that represent JSON responses or data structures..
- `datasources`: Provides interfaces and classes for external data sources (e.g., API, Local Database).
- `repositories`: Implements `domain` repositories using data sources.


The `domain` layer isolates business rules and allows easier unit testing without dependencies on external data sources or UI and is broken down into
- `entities`: Defines core data structures with minimal dependencies.
- `usecases`: Encapsulates single actions as classes for improved testing and modularity.
- `repositories`: Interfaces for data access without specifying data source details.

The `presentation` layer enables separation of UI code and business logic, making it easier to modify UI without altering the underlying logic and is broken down into
- `pages`: Contains screens for the feature.
- `providers`: State management
- `widgets`: Reusable widgets specific to this feature.
- `routes`: List of routes that correspond to each screen in `pages`



## Conclusion
To structure a Flutter project using Clean Code Architecture, a good approach is `Uncle Bob's Clean Architecture`, which emphasizes the separation of concerns. This architecture provides a flexible, testable, and maintainable project structure by dividing it into layers: Presentation, Domain, and Data. Each layer is independent, so changes in one layer don't directly affect others, making it more maintainable.
