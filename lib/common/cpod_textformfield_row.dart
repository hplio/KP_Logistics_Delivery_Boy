import 'package:flutter/material.dart';

class CPodTFRow extends StatelessWidget {
  const CPodTFRow({
    super.key,
    this.validator,
    this.controller,
    required this.title,
    this.hintText,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String title;
  final String? hintText;
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
          height: 45,
          width: MediaQuery.of(context).size.width * .47,
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFF1C1678),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
