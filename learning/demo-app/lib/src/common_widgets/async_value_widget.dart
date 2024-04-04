import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_message_widget.dart';

//credits to  Code with Andrea https://github.com/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/common_widgets/async_value_widget.dart
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({required this.value, required this.data, super.key});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (error, st) => Center(child: ErrorMessageWidget(error)),
      loading: () => const SizedBox(
        width: 60,
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
