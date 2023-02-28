# BHHook
Simple library to hook swift classes.

# About
As a tweak developer sometimes when you're working on an iOS application that maybe in Swift or starts to convert classes to Swift, and in this situation you need to read or write changes in this class but you don't know to work in Swift or you just want small changes and you don't want use a bigger library like (Reflex and Echo), in this case the library is for you, it's lightweight and simple to use.

# How to use
First you must import the [auto-generated swiftmodule header](https://developer.apple.com/documentation/swift/importing-swift-into-objective-c) by adding ```#import <[PROJECT_NAME]-Swift.h>``` to your Objective-C file. This header will have an conversion of ```BHHook.swift``` as Objective-C interface.

## Change value in class
```Objective-C
// Create an instance of the BHHook class, passing in the object to hook and its class
BHHook *hookEngine = [[BHHook alloc] initWithInstance:myInstance _class:[myInstance classForCoder]];

// Set the value of a property
[hookEngine hookWithProperty:@"Username" value:@"BandarHL [hooked]"];
```
## Get value from class
```Objective-C
// Create an instance of the BHHook class, passing in the object to hook and its class
BHHook *hookEngine = [[BHHook alloc] initWithInstance:myInstance _class:[myInstance classForCoder]];

// Get the value of a property
id propertyValue = [hookEngine getValueWithProperty:@"propertyName"];
```
## Get all Properties of class
```Objective-C
// Get the list of properties for a given class
NSArray *properties = [BHHook getPropertiesOf:[MyClass classForCoder]];
NSLog(@"%@", properties);
```

## More?
**For more detailed usage please see the example porjects. It contain an Example app and Example tweak with both Theos and MonkeyDev.**

<img src="https://user-images.githubusercontent.com/31299470/221991855-16efec45-f1f8-4d6b-aa17-487f84cd6330.gif" alt="1" width="280"/>


# How to setup
## Requierments
- [Runtime](https://github.com/wickwirew/Runtime)
## MonkeyDev
If you want to build the project for arm64 and arm64e you must use either Cocoapods or pre-build framewrok for Runtime.
### Using cocoapods:
- First ```cd``` your project in Terminal and initialize Podfile:
```bash
pod init
```
- Then open the Podfile and add the following line to your Podfile:
```ruby
pod 'Runtime'
```
- Get back to the Terminal and install the library:
```bash
pod install
```
  > If you get error that tell you the project don't have swift version, do that to fixed:
  > Open the project and go to Build Setting (Make sure you selecting 'All' in the filter) hit the plus button to add new value.
  > The key vaule is 'SWIFT_VERSION' and the value '5.0'.
  > After that close the porject and run the command again.
- After installation there will be new porject file ```PROJECT_NAME.xcworkspace``` open that and use it.
- Now darg and drop the ```BHHook.swift``` file to the project, if the xcode ask you to create Bridging Header hit yes.
- That's all, now you can use the library.

### Using pre-build framewrok:
- You can build the project by your self a side and use it, or download my [pre-build](https://drive.google.com/file/d/1CbWz1jtBiHCvqVW6tco9wOhBrpEMV5KO/view?usp=share_link) it support arm64 and arm64e.
- Next add the framework to the project.
- Now darg and drop the ```BHHook.swift``` file to the project, if the xcode ask you to create Bridging Header hit yes.
- That's all, now you can use the library.

## Theos
- For Theos the only SIMPLE way to setup is using pre-build framewrok, either by build it a side or [download](https://drive.google.com/file/d/1CbWz1jtBiHCvqVW6tco9wOhBrpEMV5KO/view?usp=share_link) it.
- Then move the ```Runtime.framework``` into ```theos/lib``` folder.
- Add the framework to your Makefile ```$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Runtime```.
- Create Bridging Header of project by making new file named ```<TWEAK_NAME>-Bridging-Header.h``` in your project directory.
- Copy ```BHHook.swift``` file in your project directory and add it to your Makefile ```$(TWEAK_NAME)_FILES = Tweak.x BHHook.swift```.
- That's all, now you can use the library.
