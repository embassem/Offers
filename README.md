# Offers

A sample screen for Luky App

as of support iOS 10 
- Named Colors are not suported in Interface Builder, a color pallet will be used and included with the source code
- safe area not supported by default, a container with Properity Constrains was used


## Setup
to run the project run 
`$ ./setup.sh` 
it will fetch all the dependencies 

### Other scripts
Use Make file to have scripts shortcut  for easy use

### reconfiger the project to use xcconfig

run `configuration.rb` or  `make config` to reconfiger the project with keys in the xcconfig

### Setup Symbolic link for git Hooks  

to link pre-Commit script  run this command from project root directory
to create a Symbolic link to a hook in git or replacr .git/hooks with ./hooks directory
`ln -s -f ./hooks/pre-commit .git/hooks/pre-commit`

## Structure

- app was build using MVP as an intentional Start  with take in mind  the easy to Refactor to VIPER , so the MVP template used is in between normal MVP and VIPER.
template used and instructionto be installed can be foun [Here] (https://github.com/embassem/MVP-Template)
- use our custom networking Wrapper can be found in this [link] (https://github.com/embassem/Networking-Template)

- xconfig is used to add dynamic `Bundle Identifire` to the app , all you need to run on device to change the Development Team .
- xconfig for Debug and release  was used and used  inherited from `Base.xcconfig`

- app use Swiftlint and edited rules , also follow some [Google Guideline](https://google.github.io/swift/)
- app is ready for Localization using Xcode Native Localization with `Localizable.strings` and can support on runtime Change Language  when adding our [Template](https://github.com/embassem/Localization_Manager_Template)
- can support light and Dark mode all colors are used in Assets 
- support Multiple fonts with chage of fontStyleFile `English.plist` and can support Dynamic font size, but it was disabled for trowing a warring in xcode " No Warring or Errors are Allowed in the Project"