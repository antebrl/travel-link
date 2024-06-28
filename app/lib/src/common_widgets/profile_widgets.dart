import 'package:flutter/material.dart';

class LanguageChip extends StatelessWidget {
  LanguageChip({
    required this.flag,
    required this.language,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  Widget flag;
  final VoidCallback? onPressed;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        avatar: flag,
        label: Text(language),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class InterestsChip extends StatelessWidget {
  const InterestsChip({
    required this.icon,
    required this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        avatar: icon,
        label: Text(label),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.avatar,
    required this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget avatar;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        avatar: avatar,
        label: Text(label),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
