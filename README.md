

<p align="center"><img width=20% src="https://github.com/AjayOdedara/MarvelHeroApp/blob/main/AppIcon.png" /></p>

# MarvelHeroApp

Create an iOS App to display a feed with horizontal top collection view and bottom tableview both with pagination.

<p align="center">
  <img width=35% src="https://github.com/AjayOdedara/MarvelHeroApp/blob/main/HomeScreen.jpeg" />
</p>

## Table of Contents

- [About](#about)
- [Quick Start](#quick-start)
- [Features](#features)
- [Credits](#credits)

## About

1. Fetch the data from the REST API: developer.marvel.com.
2. The top component of feed should have horizontal scroll direction and support loading page by page. This component should show Marvel heroes with their names and images. Tapping on hero should load proper information in the bottom component. By default first character should be selected.
3. The bottom component of the feed should have vertical scroll direction and support loading page by page. This component should show all comics with their descriptions where this hero has participated.
4. This mobile application is built using Swift 5.0 and Xcode 11.0 for iOS devices running iOS 13.0.

If attempting to run this code on future versions of Swift, Xcode, or iOS some additional work may be required to get this code running smoothly.

## Quick Start

The following steps will guide you through the process of running this application on your local machine, and device.

1. Ensure you have [Xcode 11.0](https://developer.apple.com/download/) installed
2. Checkout this repository
3. Open `MarvelHeroApp.xcodeproj` with Xcode
4. Go to the project settings, and change the code signing team to your own

Code signing settings are left at automatic here for simplicity, you can set these to manual if needed but these steps will not take you through that process.

6. Attach an iPhone running iOS 13.0
7. Ensure the iPhone has development mode enabled, from the Devices & Simulators window: <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd>
8. Clean, build and run the application on an iPhone running iOS 13.0

## Features

Below is the set of user stories that outline the intended functionality of this mobile application.

### User Stories
- Horizontal list of Marvel character
- Vertical list of comics of a particular character
- End to end implementation
- Clean code & UI, Architecture used MVVM
- Network Layer & Parsing
- Unit Tests
- Localizations
- Dark Mode Support
- Landscape Support

### Credits
- App uses open source API from [Marvel](https://developer.marvel.com)
