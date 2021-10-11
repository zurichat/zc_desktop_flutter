import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class DropDownField<T> extends StatelessWidget {
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  DropDownField({
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  });

  @override
   Widget build(BuildContext context) {
    return SizedBox(
      width: 366.w,
      height: 40,
      child: FormField<T>(
        builder: (FormFieldState<T> state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
            isEmpty: value == null || value == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: value,
                isDense: true,
                onChanged: onChanged,
                isExpanded: true,
                items: options.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Text(
                      getLabel(value),
                      style: preferenceStyleNormal,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
