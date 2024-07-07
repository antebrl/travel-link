import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//From https://codewithandrea.com/articles/flutter-presentation-layer/
extension AsyncValueUI on AsyncValue {
  void showSnackbarOnError(BuildContext context) {
    if (!isLoading && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }
}
