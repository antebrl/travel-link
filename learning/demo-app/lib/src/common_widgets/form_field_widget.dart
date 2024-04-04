import 'package:flutter/material.dart';

//similar from code with Andrea
class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    required this.controller,
    required this.labelText,
    super.key,
    this.keyboardType,
    this.formFieldKey,
    this.required = false,
    this.initialValue = '',
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final bool required;

  final Key? formFieldKey;

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: labelText,
          child: TextFormField(
            key: formFieldKey,
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType,
            validator: (value) {
              if (required && (value == null || value.isEmpty)) {
                return ''; //context.loc.requiredField;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
