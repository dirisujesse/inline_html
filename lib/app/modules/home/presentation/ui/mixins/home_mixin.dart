import 'package:flutter/material.dart';
import 'package:inline_html/core/services/ipc/ipc_plugin.dart';
import 'package:inline_html/inline_html.dart';

mixin HomeMixin<T extends HomeScreen> on State<T> {
  late final ValueNotifier<bool> formStateEmitter;

  ///Keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //Controller
  late final TextEditingController urlCtrl;

  @override
  void initState() {
    super.initState();

    IpcPlugin.instance.createImageElement();

    urlCtrl = TextEditingController();

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

  dimBody(bool yes) {
    scaffoldKey.currentState?.showBodyScrim(yes, 0.2);
  }

  toggleFullScreen([bool? fullscreen]) {
    IpcPlugin.instance.modifyWindowDisplay(
      fullscreen: fullscreen,
      onModified: (value) {
        dimBody(false);
      },
    );
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
