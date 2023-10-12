import 'package:flutter/material.dart';

// credits to Code with Andrea, https://github.com/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/common_widgets/primary_button.dart

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
  });
  final VoidCallback? onPressed;
  final String label;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  backgroundColor ?? Theme.of(context).colorScheme.primary,
              foregroundColor:
                  foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
