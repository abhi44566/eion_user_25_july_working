import 'package:flutter/material.dart';
class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final int? selectedIndex;
  final String hintText;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabel;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.value,
    this.selectedIndex,
    required this.onChanged,
    required this.itemLabel,
    this.hintText = "Select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedValue = value ??
        (selectedIndex != null && selectedIndex! >= 0 && selectedIndex! < items.length
            ? items[selectedIndex!]
            : null);

    return DropdownButtonFormField<T>(
      value: selectedValue,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(itemLabel(item)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
