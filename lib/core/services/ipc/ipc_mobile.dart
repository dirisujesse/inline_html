import 'package:inline_html/core/services/ipc/ipc_plugin.dart';
import 'package:inline_html/inline_html.dart';

IpcPlugin getPlugin() => IpcPluginMobile();

class IpcPluginMobile extends IpcPlugin {
  @override
  void modifyWindowDisplay({bool? fullscreen, OnChanged<bool>? onModified}) {
    onModified?.call(false);
  }

  @override
  void createImageElement() {
    AppLogger.info("Creating image");
  }

  @override
  void toggleImageElement(String? url) {
    AppLogger.info(url);
  }

  @override
  String get imageElement => "url_image_element";

  @override
  String get imageElementId => "url_image_element_identifier";
}
