import 'package:inline_html/inline_html.dart';

import 'ipc_stub.dart'
    if (dart.library.io) 'ipc_mobile.dart'
    if (dart.library.js) 'ipc_web.dart';

abstract class IpcPlugin {
  static IpcPlugin? _instance;

  static IpcPlugin get instance {
    _instance ??= getPlugin();
    return _instance!;
  }

  String get imageElement;
  String get imageElementId;

  void toggleImageElement(String? url);

  void createImageElement();

  void modifyWindowDisplay({
    bool? fullscreen,
    OnChanged<bool>? onModified,
  });
}
