import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ri_go_demo/src/exceptions/api_exception.dart';

import '../utils/localization.dart';
import '../utils/logger.dart';

//credits to Code with Andrea https://github.com/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/common_widgets/error_message_widget.dart

/// Simple reusable widget to show errors to the user.
class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.error, {super.key});

  /// Error object, might be a DioException.
  final Object? error;
  @override
  Widget build(BuildContext context) {
    return Text(
      _pimpError(error, context.loc.error),
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }

  String _pimpError(Object? error, String defaultStr) {
    if (error == null) {
      logger.d('ErrorMessageWidget - _pimpError - no error');
      return defaultStr;
    }
    try {
      final dioEx = error as DioException;
      if (dioEx.response != null) {
        final map = dioEx.response!.data as Map<String, dynamic>;
        if (map.containsKey('detail')) {
          return map['detail']! as String;
        }
      }
    } catch (ex) {
      logger.e(
        'ErrorMessageWidget - _pimpError - could not extract info',
        error: ex,
      );
    }
    try {
      final apiException = error as ApiException;
      return 'status ${apiException.statusCode}: ${apiException.message}';
    } catch (ex) {
      logger.e(
        'ErrorMessageWidget - _pimpError - could not extract message',
        error: ex,
      );
    }
    return defaultStr;
  }
}
