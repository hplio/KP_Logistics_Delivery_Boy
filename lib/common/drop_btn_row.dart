import 'package:flutter/material.dart';
import 'package:la_logistics/common/cdropdown.dart';

class CPodDropBtnRow extends StatelessWidget {
  const CPodDropBtnRow({
    super.key,
    required this.branches,
    required this.selectedBranch,
    required this.title,
    required this.hintText,
    this.onChanged,
    this.betweenSpace = 100,
    this.maxHight,
  });

  final List<String> branches;
  final String? selectedBranch;
  final String title;
  final String hintText;
  final void Function(String?)? onChanged;
  final double betweenSpace;
  final double? maxHight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: betweenSpace,
        ),
        Flexible(
          child: CustomDropBtn(
            maxHeight: maxHight,
            branches: branches,
            selectedBranch: selectedBranch,
            hintText: hintText,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
