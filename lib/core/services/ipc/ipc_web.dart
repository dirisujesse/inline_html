// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui_web' as webUi;

import 'package:inline_html/core/services/ipc/ipc_plugin.dart';
import 'package:inline_html/inline_html.dart';

IpcPlugin getPlugin() => IpcPluginWeb();

class IpcPluginWeb extends IpcPlugin {
  @override
  void modifyWindowDisplay({bool? fullscreen, OnChanged<bool>? onModified}) {
    final supportsFullscreen = document.fullscreenEnabled ?? false;
    if (!supportsFullscreen) {
      onModified?.call(false);
      return;
    }

    fullscreen ??= !_hasFullScreenElement;

    if (fullscreen) document.documentElement?.requestFullscreen();
    document.exitFullscreen();

    onModified?.call(_hasFullScreenElement);
  }

  bool get _hasFullScreenElement => document.fullscreenElement != null;

  @override
  dynamic createImageElement() {
    try {
      webUi.platformViewRegistry.registerViewFactory(
        imageElement,
        (int viewId, {Object? params}) {
          final ImageElement image = ImageElement()
            ..id = imageElementId
            ..style.display = "none"
            ..style.width = '100%'
            ..style.height = '100%';
          return image;
        },
      );
    } catch (e, t) {
      AppLogger.severe("$e", error: e, stackTrace: t);
    }
  }

  @override
  void toggleImageElement(String? url) {
    AppLogger.info(url);
    ImageElement? image =
        document.getElementById(imageElementId) as ImageElement?;
    AppLogger.info(image?.hidden);

    if (image == null) return;

    if (!url.hasValue) {
      image.style.display = "none";
      return;
    }
    
    image.src = url;
    image.style.display = "inline-block";

    AppLogger.info(image.src);
  }

  @override
  String get imageElement => "url_image_element";

  @override
  String get imageElementId => "url_image_element_identifier";
}
