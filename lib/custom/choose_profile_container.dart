import 'package:flutter/material.dart';

class ChooseProfileContainer extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  final void Function() screenName;
  final String title;
  final String subTitle;
  final Widget img;
  final double fontsize;
  const ChooseProfileContainer({super.key, required this.value, required this.groupValue, required this.onChanged,
    required this.title, required this.subTitle,
    required this.img, required this.screenName, required this.fontsize
  });

  @override
  State<ChooseProfileContainer> createState() => _ChooseProfileContainerState();
}

class _ChooseProfileContainerState extends State<ChooseProfileContainer> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);
    return GestureDetector(
      onTap:() {
        widget.onChanged(widget.value);
        widget.screenName();
      },
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: selected?Color(0xFFD7D5E2):Colors.white,
          borderRadius: BorderRadius.circular(15),

          border: selected
              ? Border.all(width: 1,
            color:Color(0xFF20147B)
          )
              : Border.all(width: 1,
            color: Colors.grey
            //color:   Constants.appCommonColor
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
               Container(
                 height: 75,width: 75,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Color(0xFF20147B)
                 ),
               ),
                  widget.img,
                ],
              )

            ),
            SizedBox(
              width: 190,
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style:TextStyle(fontWeight: FontWeight.bold,
                        fontSize: widget.fontsize)
                    //AppTextStyles.mediumHeadingStyleBlack,
                  ),
                  widget.subTitle.isEmpty?Container():
                  Text(
                    widget.subTitle,
                    style: TextStyle(color: Colors.black,fontSize: 13),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
