# iOS Workshop for NUS CP2106 Independent Software Development Project (Orbital) 2018
This is a sample iOS application made using **Swift** which aims to give beginners a basic understanding on the following areas:
* Creating custom UIViews programmatically
* Integrating iOS application with Firebase Realtime Database (saving and retrieving data)
* Saving data locally (in the iOS device) using UserDefaults
* Basic refactoring of code following the MVC (Model View Controller) architectural pattern

## Disclaimer
The code in the application is not be perfect. I am not an expert in iOS development. Through this sample application, however, I hope to be able to share with you what I have learnt so far. Feel free to submit issues or create a pull request. They are greatly appreciated.

## Application Overview
This is an application where the user can create data, each consists of a person's name and his/her favourite pancake, and store it in the cloud (Firebase). The user will then be able to see (retrieve) a list of all the data stored and delete them (one by one).

## Setup Instruction
1. Make sure you already have the following:
    * Xcode
    * Cocoapods
    * Firebase account
2. Clone the repository (using HTTPS: `git clone https://github.com/CT15/orbital2018-ios-workshop.git`)
3. Run `pod install` from the SampleApp directory
4. Open the `SampleApp.xcworkspace` file
5. Register this application under a new Firebase project
6. Launch the SampleApp from Xcode

## License
This project is available under the MIT license. See the LICENSE file for more info.
