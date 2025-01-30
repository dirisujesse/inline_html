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

  /// The label for the generated `<img>` element
  String get imageElement;
  /// The id assigned the generated `<img>` element
  String get imageElementId;

  /// Modifies the display of of the `<img>` element 
  /// [url] is a nullable string matching an image resource
  /// [url] is set as the `src` of the image element
  void toggleImageElement(String? url);

  /// Bootstraps the `<img>` element
  void createImageElement();

  /// Toggles the fullscreen display of the web document
  /// [fullscreen] specifies if the document window should be in fullscreen or not
  void modifyWindowDisplay({
    bool? fullscreen,
    OnChanged<bool>? onModified,
  });
}
