import 'package:flutter/material.dart';
import 'package:inline_html/core/services/ipc/ipc.dart';
import 'package:inline_html/inline_html.dart';

//TODO: 1. URL Input Field and Image Display:
//  Create an input field for a URL and a button. When the button is clicked, an image should appear in the center of the application using an HTML `< img >` element (not a Flutter `Image` widget).
//  - Double-clicking on the image should toggle the browser's fullscreen mode. Use JS functions called directly from Dart for this functionality.

//TODO: 2. "Plus" Button and Context Menu:
//  Add a button with a "Plus" icon to the bottom-right corner of the screen.
//  - Clicking on this button should display a context menu with "Enter fullscreen" and "Exit fullscreen" buttons above it.
//  - When the menu is open, the background should dim while the button and menu remain highlighted.
//  - Clicking outside the menu should close it, and clicking the menu buttons should perform the corresponding action and close the menu.

//TODO: 3. Final Result:
//  - Submit your code as a link to a GitHub repository.
//  - Deploy the compiled web version of the application on GitHub Pages.
//  - Ensure the code is formatted and documented according to the guidelines in 'Effective Dart' (https://dart.dev/effective-dart/documentation).

void main() {
  runApp(const MyApp());
}

/// Application itself.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomePage());
  }
}

/// [Widget] displaying the home page consisting of an image the the buttons.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// State of a [HomePage].
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    IpcPlugin.instance.createImageElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: GestureDetector(
                  onDoubleTap: () {
                    IpcPlugin.instance.modifyWindowDisplay();
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: HtmlElementView(
                      viewType: IpcPlugin.instance.imageElement,
                      onPlatformViewCreated: (id) {
                        AppLogger.info("Created element with ID $id");
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Image URL'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    IpcPlugin.instance.toggleImageElement(
                        "https://images.pexels.com/photos/30415600/pexels-photo-30415600/free-photo-of-bold-fashion-portrait-with-blue-and-orange-contrast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
