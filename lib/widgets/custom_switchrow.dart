import 'package:flutter/cupertino.dart';
import 'package:scarel_info_machine/constants/colors.dart';

class CustomSwitchRow extends StatefulWidget {
  String title;
   CustomSwitchRow({super.key,required this.title});

  @override
  State<CustomSwitchRow> createState() => _CustomSwitchRowState();
}

class _CustomSwitchRowState extends State<CustomSwitchRow> {
   bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: _isSwitched ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: _isSwitched,
            activeColor: WebColors.orangeColor,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
          ),
        ),
      ],
    );
  }
  }
