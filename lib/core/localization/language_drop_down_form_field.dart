import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'language_manager.dart';

class LanguageDropDown extends StatefulWidget {
  final List<LanguageType> items;
  final String label;
  final void Function(LanguageType selectedItem) onChanged;

  const LanguageDropDown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownFormFieldStateWeb();
}

class _LanguageDropDownFormFieldStateWeb extends State<LanguageDropDown> {
  LanguageType? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField2<LanguageType>(
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Add more decoration..
        ),
        isExpanded: true,
        hint: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<LanguageType>(
                  value: item,
                  child: Text(
                    item.getName(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onChanged(value as LanguageType);
        },
      ),
    );
  }
}
