import 'package:flutter/material.dart';

class PODDetailRow extends StatelessWidget {
  const PODDetailRow({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Container(
          height: 35,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFF20147B)),
          ),
          child: Center(
            child: Text(
              maxLines: 1,
              subTitle,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Color(0xFF20147B),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
