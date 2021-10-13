// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FullNameValueKey = 'fullName';
const String DisplayNameValueKey = 'displayName';
const String WhoValueKey = 'who';
const String PronounValueKey = 'pronoun';
const String PhoneNumberValueKey = 'phoneNumber';
const String TimeZoneValueKey = 'timeZone';

mixin $ProfileEditView on StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController whoController = TextEditingController();
  final TextEditingController pronounController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController timeZoneController = TextEditingController();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode displayNameFocusNode = FocusNode();
  final FocusNode whoFocusNode = FocusNode();
  final FocusNode pronounFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode timeZoneFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    fullNameController.addListener(() => _updateFormData(model));
    displayNameController.addListener(() => _updateFormData(model));
    whoController.addListener(() => _updateFormData(model));
    pronounController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    timeZoneController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            FullNameValueKey: fullNameController.text,
            DisplayNameValueKey: displayNameController.text,
            WhoValueKey: whoController.text,
            PronounValueKey: pronounController.text,
            PhoneNumberValueKey: phoneNumberController.text,
            TimeZoneValueKey: timeZoneController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    fullNameController.dispose();
    fullNameFocusNode.dispose();
    displayNameController.dispose();
    displayNameFocusNode.dispose();
    whoController.dispose();
    whoFocusNode.dispose();
    pronounController.dispose();
    pronounFocusNode.dispose();
    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
    timeZoneController.dispose();
    timeZoneFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get fullNameValue => this.formValueMap[FullNameValueKey];
  String? get displayNameValue => this.formValueMap[DisplayNameValueKey];
  String? get whoValue => this.formValueMap[WhoValueKey];
  String? get pronounValue => this.formValueMap[PronounValueKey];
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];
  String? get timeZoneValue => this.formValueMap[TimeZoneValueKey];

  bool get hasFullName => this.formValueMap.containsKey(FullNameValueKey);
  bool get hasDisplayName => this.formValueMap.containsKey(DisplayNameValueKey);
  bool get hasWho => this.formValueMap.containsKey(WhoValueKey);
  bool get hasPronoun => this.formValueMap.containsKey(PronounValueKey);
  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
  bool get hasTimeZone => this.formValueMap.containsKey(TimeZoneValueKey);
}

extension Methods on FormViewModel {}
