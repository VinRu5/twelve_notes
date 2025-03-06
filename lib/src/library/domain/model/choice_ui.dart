import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChoiceUI with EquatableMixin {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback action;

  ChoiceUI({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.action,
  });

  @override
  List<Object?> get props => [
        title,
        subtitle,
        icon,
        action,
      ];
}
