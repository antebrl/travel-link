# Flutter

- everything is a widget, even padding or margin
- you can run network code without causing the UI to hang by using async/await
- a ListView widget is both a ScrollView and an Android ListView

## Links

- https://docs.flutter.dev/get-started/flutter-for/android-devs
- https://docs.flutter.dev/get-started/flutter-for/swiftui-devs

## Suggested learning path

1. learn [dart](dart.md)
2. [get started](https://docs.flutter.dev/get-started)
3. 📹[first Flutter app](https://youtube.com/watch?v=xWV71C2kp38)
4. [ui](https://docs.flutter.dev/ui)
5. [layout](https://docs.flutter.dev/ui/layout)
6. 📹[Stateless and Stateful widgets](https://youtube.com/watch?v=QlwiL_yLh6E)
7. [interactivity and state](https://docs.flutter.dev/ui/interactivity)
8. [codelab: Your first Flutter App](https://codelabs.developers.google.com/codelabs/flutter-codelab-first)
9. continue with my videos ;)

Optional: [Design Patterns in Flutter](https://devlibrary.withgoogle.com/products/flutter/repos/mkobuolys-flutter-design-patterns)

## Terminal

```shell
#  checks your environment and displays a report of the status of your Flutter installation
flutter doctor

# delete the build/ and .dart_tool/ directories
flutter clean

# gets all the dependencies listed in the pubspec.yaml file in the current working directory, i.e. it does not get automatically the dependencies in a package folder
flutter pub get

# run debugger in chrome
flutter run -d chrome

# build windows app
flutter build windows

# code generation (for freezed and other packages)
dart run build_runner build

# show dependency information
flutter pub deps

# upgrade to latest flutter version
flutter upgrade

# quickly show and apply fixes of static code analyses -- be careful, some suggestions change the behaviour of your code!
dart fix --dry-run # preview of the proposed changes
dart fix --apply # apply the changes


# take a screenshot of a Flutter app from a connected device
flutter screenshot
```

## Flutter Snippets

```dart
var data = ['Hello', 'World',];
return ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(data[index]));
  },
);
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Floating Action Button Sample'),
    ),
    body: Center(
      child: Text('Press the button below!')
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: Icon(Icons.thumb_up),
      backgroundColor: Colors.pink,
    ),
  );
}
CircleAvatar(
  backgroundImage: NetworkImage(url), //or use https://pub.dev/packages/cached_network_image
)

// see https://docs.flutter.dev/get-started/flutter-for/android-devs
Future<void> loadData() async {
  var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  http.Response response = await http.get(dataURL);
  setState(() {
    widgets = jsonDecode(response.body);
  });
}

// use Cupertino instead of Material
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a CupertinoApp that, by default,
    // has the look and feel of an iOS app.
    return const CupertinoApp(
      home: HomePage(),
    );
  }
}

// see https://docs.flutter.dev/get-started/flutter-for/react-native-devs
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.index,
    required this.onPress,
  });

  final int index;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Text('Card $index'),
        TextButton(
          onPressed: onPress,
          child: const Text('Press'),
        ),
      ],
    ));
  }
}

class UseCard extends StatelessWidget {
  const UseCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    /// Usage
    return CustomCard(
      index: index,
      onPress: () {
        print('Card $index');
      },
    );
  }
}
```
