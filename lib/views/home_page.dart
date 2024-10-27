import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scarel_info_machine/constants/height.dart';

import 'package:scarel_info_machine/viewmodels/home_viewmodel.dart';
import 'package:scarel_info_machine/viewmodels/side_bar_viewmodel.dart';

class EmailCampaignScreen extends StatelessWidget {
  const EmailCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 250, right: 300, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: buildForm(),
            ),
              WebConstants.kwidth20, SizedBox(width: 16),
            buildSidebar(),
          ],
        ),
      ),
    );
  }
}

