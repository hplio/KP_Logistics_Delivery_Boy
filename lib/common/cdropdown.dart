import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropBtn extends StatelessWidget {
  const CustomDropBtn({
    super.key,
    required this.branches,
    required this.selectedBranch,
    required this.hintText,
    required this.onChanged,
    this.maxHeight = 48,
  });

  final List<String> branches;
  final String? selectedBranch;
  final void Function(String?)? onChanged;
  final String hintText;
  final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child:  DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            softWrap: true,
            hintText,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: branches
              .map(
                (branch) => DropdownMenuItem<String>(
                  value: branch,
                  child: Text(
                    branch,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              )
              .toList(),
          value: selectedBranch,
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            height: maxHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFF1C1678),
              ),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.expand_more,
              color: Colors.black,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10,
            ),
          ),
        ),
    );
  }
}
