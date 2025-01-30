import 'package:flutter/material.dart';
import 'package:inline_html/inline_html.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeMixin {
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
              child: InlineImageWidget(
                key: Key("inline_image_container"),
                child: BoolListener(
                  valueListenable: formStateEmitter,
                  builder: (isValid) {
                    if (!isValid) return const Offstage();
                    return GestureDetector(
                      onDoubleTap: toggleFullScreen,
                      child: HtmlElementView(
                        viewType: imageElement,
                        key: Key("inline_image_element"),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            InlineImageForm(
              formKey: formKey,
              formState: formStateEmitter,
              controller: urlCtrl,
              onSubmit: submit,
              key: Key("inline_image_form"),
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
