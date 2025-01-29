import 'package:flutter/material.dart';

typedef OnPressed = void Function();
typedef OnPressedAsync = Future<void> Function();
typedef ValueFormatter = String Function(num value);
typedef OnDynamicRoute = Route<dynamic> Function(RouteSettings settings);
typedef OnChanged<T> = void Function(T value);
typedef OnChanged2<T, K> = void Function(T value, K otherValue);
typedef OnChangedAsync<T> = Future<void> Function(T value);
typedef FutureCall<T> = Future<T> Function();
typedef FunctionCall<T> = T Function();
typedef TransformCall<T> = T Function(dynamic input);
typedef OnValidate<T> = String? Function(T value);
typedef OnBoolValidation<T> = bool Function(T value);
typedef MapCallback<E, T> = E Function(T e);
typedef ItemBuilder = Widget Function(BuildContext context, int index);
typedef ValueBuilder<T> = Widget Function(T value);
typedef ValueBuilder2<T, K> = Widget Function(T value, K value2);
typedef AppSearchDelegate<T> = T Function(String query);
typedef Tuple2<T, K> = (T, K);
typedef LayoutCallback<T> = Widget Function(
  BuildContext context,
  TabBar scaler,
  BoxConstraints constraints,
);
