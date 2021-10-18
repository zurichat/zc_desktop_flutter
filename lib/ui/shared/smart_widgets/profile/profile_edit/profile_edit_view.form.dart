// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String DisplayNameValueKey = 'displayName';
const String WhoValueKey = 'who';
const String PronounValueKey = 'pronoun';
const String PhoneNumberValueKey = 'phoneNumber';

mixin $ProfileEditView on StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController whoController = TextEditingController();
  final TextEditingController pronounController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode displayNameFocusNode = FocusNode();
  final FocusNode whoFocusNode = FocusNode();
  final FocusNode pronounFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    displayNameController.addListener(() => _updateFormData(model));
    whoController.addListener(() => _updateFormData(model));
    pronounController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            FirstNameValueKey: firstNameController.text,
            LastNameValueKey: lastNameController.text,
            DisplayNameValueKey: displayNameController.text,
            WhoValueKey: whoController.text,
            PronounValueKey: pronounController.text,
            PhoneNumberValueKey: phoneNumberController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    firstNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameController.dispose();
    lastNameFocusNode.dispose();
    displayNameController.dispose();
    displayNameFocusNode.dispose();
    whoController.dispose();
    whoFocusNode.dispose();
    pronounController.dispose();
    pronounFocusNode.dispose();
    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get firstNameValue => this.formValueMap[FirstNameValueKey];
  String? get lastNameValue => this.formValueMap[LastNameValueKey];
  String? get displayNameValue => this.formValueMap[DisplayNameValueKey];
  String? get whoValue => this.formValueMap[WhoValueKey];
  String? get pronounValue => this.formValueMap[PronounValueKey];
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];

  bool get hasFirstName => this.formValueMap.containsKey(FirstNameValueKey);
  bool get hasLastName => this.formValueMap.containsKey(LastNameValueKey);
  bool get hasDisplayName => this.formValueMap.containsKey(DisplayNameValueKey);
  bool get hasWho => this.formValueMap.containsKey(WhoValueKey);
  bool get hasPronoun => this.formValueMap.containsKey(PronounValueKey);
  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
}

extension Methods on FormViewModel {}
