// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String DisplayNameValueKey = 'displayName';
const String WhoValueKey = 'who';
const String PronounValueKey = 'pronoun';
const String PhoneNumberValueKey = 'phoneNumber';

final Map<String, TextEditingController>
    _ProfileEditViewTextEditingControllers = {};

final Map<String, FocusNode> _ProfileEditViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ProfileEditViewTextValidations =
    {
  FirstNameValueKey: null,
  LastNameValueKey: null,
  DisplayNameValueKey: null,
  WhoValueKey: null,
  PronounValueKey: null,
  PhoneNumberValueKey: null,
};

mixin $ProfileEditView on StatelessWidget {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get displayNameController =>
      _getFormTextEditingController(DisplayNameValueKey);
  TextEditingController get whoController =>
      _getFormTextEditingController(WhoValueKey);
  TextEditingController get pronounController =>
      _getFormTextEditingController(PronounValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get displayNameFocusNode => _getFormFocusNode(DisplayNameValueKey);
  FocusNode get whoFocusNode => _getFormFocusNode(WhoValueKey);
  FocusNode get pronounFocusNode => _getFormFocusNode(PronounValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ProfileEditViewTextEditingControllers.containsKey(key)) {
      return _ProfileEditViewTextEditingControllers[key]!;
    }
    _ProfileEditViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ProfileEditViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ProfileEditViewFocusNodes.containsKey(key)) {
      return _ProfileEditViewFocusNodes[key]!;
    }
    _ProfileEditViewFocusNodes[key] = FocusNode();
    return _ProfileEditViewFocusNodes[key]!;
  }

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

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the dynamic
  void _updateFormData(dynamic model, {bool forceValidate = false}) {
    model.setData(
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
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        FirstNameValueKey: _getValidationMessage(FirstNameValueKey),
        LastNameValueKey: _getValidationMessage(LastNameValueKey),
        DisplayNameValueKey: _getValidationMessage(DisplayNameValueKey),
        WhoValueKey: _getValidationMessage(WhoValueKey),
        PronounValueKey: _getValidationMessage(PronounValueKey),
        PhoneNumberValueKey: _getValidationMessage(PhoneNumberValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ProfileEditViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_ProfileEditViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ProfileEditViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ProfileEditViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ProfileEditViewTextEditingControllers.clear();
    _ProfileEditViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get displayNameValue =>
      this.formValueMap[DisplayNameValueKey] as String?;
  String? get whoValue => this.formValueMap[WhoValueKey] as String?;
  String? get pronounValue => this.formValueMap[PronounValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;

  bool get hasFirstName => this.formValueMap.containsKey(FirstNameValueKey);
  bool get hasLastName => this.formValueMap.containsKey(LastNameValueKey);
  bool get hasDisplayName => this.formValueMap.containsKey(DisplayNameValueKey);
  bool get hasWho => this.formValueMap.containsKey(WhoValueKey);
  bool get hasPronoun => this.formValueMap.containsKey(PronounValueKey);
  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasDisplayNameValidationMessage =>
      this.fieldsValidationMessages[DisplayNameValueKey]?.isNotEmpty ?? false;
  bool get hasWhoValidationMessage =>
      this.fieldsValidationMessages[WhoValueKey]?.isNotEmpty ?? false;
  bool get hasPronounValidationMessage =>
      this.fieldsValidationMessages[PronounValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get displayNameValidationMessage =>
      this.fieldsValidationMessages[DisplayNameValueKey];
  String? get whoValidationMessage =>
      this.fieldsValidationMessages[WhoValueKey];
  String? get pronounValidationMessage =>
      this.fieldsValidationMessages[PronounValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
}

extension Methods on FormViewModel {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setDisplayNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DisplayNameValueKey] = validationMessage;
  setWhoValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WhoValueKey] = validationMessage;
  setPronounValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PronounValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
}
