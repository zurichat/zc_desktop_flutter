// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TitleValueKey = 'title';
const String DescriptionValueKey = 'description';

mixin $CreateTodoDialogView on StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            TitleValueKey: titleController.text,
            DescriptionValueKey: descriptionController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    titleController.dispose();
    titleFocusNode.dispose();
    descriptionController.dispose();
    descriptionFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get titleValue => this.formValueMap[TitleValueKey];
  String? get descriptionValue => this.formValueMap[DescriptionValueKey];

  bool get hasTitle => this.formValueMap.containsKey(TitleValueKey);
  bool get hasDescription => this.formValueMap.containsKey(DescriptionValueKey);
}

extension Methods on FormViewModel {}
