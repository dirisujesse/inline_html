import 'package:flutter/material.dart';
import 'package:inline_html/inline_html.dart';

extension SnapshotExtension on AsyncSnapshot {
  bool get isLoading {
    return connectionState == ConnectionState.waiting;
  }

  bool get isLoaded {
    return !isLoading && !hasError && hasData;
  }

  bool get isEmpty {
    if ((data is Iterable?) || (data is Iterable)) {
      return !hasData || !(data as Iterable?).hasValue;
    }
    return !hasData;
  }
}
