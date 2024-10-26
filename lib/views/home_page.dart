import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scarel_info_machine/constants/colors.dart';
import 'package:scarel_info_machine/constants/height.dart';
import 'package:scarel_info_machine/models/side_bar_model.dart';

class EmailCampaignScreen extends StatelessWidget {
  const EmailCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 200, right: 200, bottom: 50),
        child: Row(
          children: [
            // Expanded(
            //   flex: 3,
            //   child: _buildForm(),
            // ),
            const SizedBox(width: 16),
            _buildSidebar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(

      width: 400,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
      
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < steps.length; i++)
            _buildStepIndicator(steps[i], i + 1),
          const Spacer(),
          const Text("Need Help?",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
              "Get to know how your campaign can reach a wider audience."),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Contact Us"),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(StepModel step, int index) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: step.isActive ? Colors.orange :WebColors.greyColor, 
                width: 1 // Border width
              ),
            ),
              child: CircleAvatar(
                
                backgroundColor: step.isActive ? Colors.orange : Colors.white,
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    color: step.isActive ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
            WebConstants.kwidth10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontWeight:
                        step.isActive ? FontWeight.bold : FontWeight.w300,
                    color: step.isActive ? WebColors.blackColor : const Color.fromARGB(208, 0, 0, 0),
                  ),
                ),
                WebConstants.kheight3,
                Text(
                  step.description,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight:
                        step.isActive ? FontWeight.bold : FontWeight.w600,
                    color: step.isActive
                        ? WebColors.texblackColor
                        : WebColors.greyColor
                  ),
                ),
                
              ],
            ),
    
          ],
        ),
        WebConstants.kheight20
      ],
    );
  }
}
