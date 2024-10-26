import 'package:flutter/cupertino.dart';

class CustomSwitchRow extends StatefulWidget {
  const CustomSwitchRow({super.key});

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
          'Run only once per customer',
          style: TextStyle(
            fontWeight: _isSwitched ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: _isSwitched,
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
