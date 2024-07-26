import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

class EmailField extends StatelessWidget {
  final bool disabled;
  final String? error;
  final VoidCallback? onCloseIcon;
  final String name;
  final String? hintText;
  final List<String? Function(dynamic)>? validators;

  const EmailField({
    super.key,
    required this.name,
    this.disabled = false,
    this.error,
    this.onCloseIcon,
    this.hintText,
    this.validators,
  });

  @override
  Widget build(BuildContext context) => FormBuilderTextField(
        name: name,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText ?? context.appStrings.emailLabel,
          errorText: error,
          errorMaxLines: 2,
          prefixIcon: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.solidEnvelope,
                size: 16.0,
                color: TwelveColors.primary,
              ),
            ],
          ),
          suffixIcon: IconButton(
            onPressed: onCloseIcon,
            icon: const FaIcon(
              FontAwesomeIcons.xmark,
              size: 16.0,
            ),
          ),
        ),
        enabled: !disabled,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
          if (validators != null) ...validators!,
        ]),
      );
}
