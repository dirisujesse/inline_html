class AppRegex {
  static final imageRegex = RegExp(r"\.(gif|jp(e)?g|tif(f)?|png|webp|bmp)$");
  static final urlRegex = RegExp(
    r"\b[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)\b",
    caseSensitive: false,
  );
  static final jpegRegex = RegExp(
    r"\.jp(e)?g$",
    caseSensitive: false,
  );
}
