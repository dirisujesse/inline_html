import 'package:flutter/material.dart';
import 'package:inline_html/core/services/ipc/ipc_plugin.dart';
import 'package:inline_html/inline_html.dart';

//TODO: 1. URL Input Field and Image Display:
//  Create an input field for a URL and a button. When the button is clicked, an image should appear in the center of the application using an HTML `< img >` element (not a Flutter `Image` widget).
//  - Double-clicking on the image should toggle the browser's fullscreen mode. Use JS functions called directly from Dart for this functionality.

mixin HomeMixin<T extends HomeScreen> on State<T> {
  late final ValueNotifier<bool> formStateEmitter;
  late final ValueNotifier<bool> inFullScreen;

  ///Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Controller
  late final TextEditingController urlCtrl;

  @override
  void initState() {
    super.initState();

    IpcPlugin.instance.createImageElement();

    urlCtrl = TextEditingController();
    inFullScreen = ValueNotifier(false);

    _trackValidity();

    formStateEmitter = ValueNotifier(_formValidityStatus());
  }

  String get imageElement => IpcPlugin.instance.imageElement;

  @override
  void dispose() {
    urlCtrl.dispose();
    formStateEmitter.dispose();
    super.dispose();
  }

  toggleFullScreen() {
    IpcPlugin.instance.modifyWindowDisplay(onModified: (value) {
      inFullScreen.value = value;
    });
  }

  _trackValidity() {
    urlCtrl.addListener(() {
      formStateEmitter.value = _formValidityStatus();
    });
  }

  bool _formValidityStatus() {
    return AppValidators.urlValidator(urlCtrl.textValue) == null;
  }

  submit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    IpcPlugin.instance.toggleImageElement(urlCtrl.text);
  }
}
