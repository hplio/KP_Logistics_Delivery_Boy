import 'package:flutter/material.dart';

class PODDetailColumn extends StatelessWidget {
  const PODDetailColumn({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFF20147B)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              softWrap: true,
              maxLines: 2,
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
