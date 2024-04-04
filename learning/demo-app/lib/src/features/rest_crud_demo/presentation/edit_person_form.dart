import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../common_widgets/error_message_widget.dart';
import '../../../common_widgets/form_field_widget.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../constants/ui_constants.dart';
import '../../../utils/localization.dart';
import 'edit_person_controller.dart';

class EditPersonForm extends ConsumerStatefulWidget {
  const EditPersonForm({super.key});

  @override
  ConsumerState<EditPersonForm> createState() => _EditPersonFormState();
}

class _EditPersonFormState extends ConsumerState<EditPersonForm> {
  final _formKey = GlobalKey<FormState>();
  static const Key _nameKey = Key('name');
  static const Key _imageUrlKey = Key('image_url');
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  late final EditPersonController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ref.read(editPersonControllerProvider.notifier);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editPersonControllerProvider);
    if (state.isLoading) {
      return const CircularProgressIndicator();
    }
    if (state.value == null) {
      return Container();
    } else {
      _nameController.text = state.value!.name;
      _imageUrlController.text = state.value!.imageUrl;
      return Padding(
        padding: const EdgeInsets.all(UIConstants.defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //put here to have both visible, the error and the form
              if (state.hasError) ErrorMessageWidget(state.error),
              FormFieldWidget(
                formFieldKey: _nameKey,
                controller: _nameController,
                labelText: context.loc.labelName,
                required: true,
              ),
              const Gap(UIConstants.verticalItemSpace),
              FormFieldWidget(
                formFieldKey: _imageUrlKey,
                controller: _imageUrlController,
                labelText: context.loc.labelImageUrl,
              ),
              const Gap(UIConstants.verticalItemSpace),
              Row(
                children: [
                  PrimaryButton(
                    label: context.loc.delete,
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Theme.of(context).colorScheme.onError,
                    onPressed:
                        state.isLoading ? null : () => {_controller.delete()},
                    isEnabled: state.value!.id > 0,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      label: context.loc.save,
                      onPressed: state.isLoading
                          ? null
                          : () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    _controller.save(
                                      name: _nameController.text,
                                      imageUrl: _imageUrlController.text,
                                    ),
                                  },
                              },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
