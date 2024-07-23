import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

class NameField extends StatelessWidget {
  final bool disabled;
  final String? error;
  final VoidCallback? onCloseIcon;
  final String name;
  final String? hintText;

  const NameField({
    super.key,
    required this.name,
    this.disabled = false,
    this.error,
    this.onCloseIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) => FormBuilderTextField(
        name: name,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText ?? context.appStrings.nameLabel,
          errorText: error,
          errorMaxLines: 2,
          prefixIcon: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.solidUser,
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
          errorStyle: context.twelveStyle?.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                offset: Offset.fromDirection(1.0),
                spreadRadius: 3.0,
                color: Colors.black87,
              )
            ],
          ),
        ),
        enabled: !disabled,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.minLength(3),
        ]),
      );
}
