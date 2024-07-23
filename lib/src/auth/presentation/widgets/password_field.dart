import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/misc/constants.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

class PasswordField extends StatefulWidget {
  final bool disabled;
  final String? error;
  final VoidCallback? onCloseIcon;
  final String name;
  final String? hintText;
  final List<String? Function(dynamic)>? validators;

  const PasswordField({
    super.key,
    required this.name,
    this.disabled = false,
    this.error,
    this.onCloseIcon,
    this.hintText,
    this.validators,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) => FormBuilderTextField(
        name: widget.name,
        keyboardType: TextInputType.visiblePassword,
        enabled: !widget.disabled,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText ?? context.appStrings.passwordLabel,
          errorText: widget.error,
          errorMaxLines: 2,
          prefixIcon: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.key,
                size: 16.0,
                color: TwelveColors.primary,
              ),
            ],
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => setState(() {
                  obscureText = !obscureText;
                }),
                icon: FaIcon(
                  obscureText ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash,
                  size: 16.0,
                ),
              ),
              IconButton(
                onPressed: widget.onCloseIcon,
                icon: const FaIcon(
                  FontAwesomeIcons.xmark,
                  size: 16.0,
                ),
              ),
            ],
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
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.minLength(8),
          FormBuilderValidators.match(K.passwordRegEx),
          if (widget.validators != null) ...widget.validators!,
        ]),
      );
}
