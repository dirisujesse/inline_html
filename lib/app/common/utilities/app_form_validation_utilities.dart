import 'package:inline_html/inline_html.dart';

class AppValidators {
  static bool _isEmpty(String? text) => !text.hasValue;

  static String? urlValidator(String? url, {bool isRequired = true}) {
    final isEmpty = _isEmpty(url);

    if (!isRequired && isEmpty) return null;

    if (isEmpty) {
      return "This field is required";
    }

    if (!AppRegex.urlRegex.hasMatch(url!)) {
      return "The provided url is invalid";
    }

    return null;
  }
}
