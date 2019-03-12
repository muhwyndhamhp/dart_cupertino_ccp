# country_picker_cupertino_id

A flutter plugin that makes Cupertino style country code picker. You can use it by calling ```CountryPickerCupertino()``` via ```showCupertinoModal()```, example :

```dart
void _openCCP(BuildContext pageContext) =>
      showCupertinoModalPopup<void>(
          context: pageContext,
          builder: (BuildContext context) {
            return CountryPickerCupertino(
              sheetHeight: 200,
              valueChanged: ((String phoneData) =>
                  ...),
            );
          });
  ```
  You can call it from any Widget / Gesture detector. Note that TextField has weird quirks where keyboard focus would be priority over onTap gesture, so you would need some workaround :
  
  ```dart
  
  
  GestureDetector(
              onTap: () {
                FocusScope.of(context).detach();
                _openCCP(context, _userBloc);
              },
              child: Container(
                            color: Colors.transparent,
                            child: IgnorePointer(
                              child: TextField(
                              ...
                              ),
                            )
                      ))
   ```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
