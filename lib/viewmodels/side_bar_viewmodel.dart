
  import 'package:flutter/material.dart';
import 'package:scarel_info_machine/constants/colors.dart';
import 'package:scarel_info_machine/constants/height.dart';
import 'package:scarel_info_machine/models/side_bar_model.dart';
import 'package:scarel_info_machine/widgets/custom_elevated_button.dart';

Widget buildSidebar() {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < steps.length; i++)
            _buildSideIndicator(steps[i], i + 1),
          const Spacer(),
          const Text("Need Help?",
              style: TextStyle(fontWeight: FontWeight.bold)),
          WebConstants.kheight5,
          const Text(
            "Get to know how your campaign\ncan reach a wider audience.",
            style: TextStyle(
              fontWeight: FontWeight.w600,
                wordSpacing: 0, color: WebColors.greyColor, fontSize: 12),
          ),
          WebConstants.kheight10,
     CustomElevatedButton(horizontal: 20,vertical: 10,borderColor: WebColors.sideBarUnselectedColor,textInside: 'Contact Us',textColor: WebColors.texblackColor,backgroundColor: WebColors.whiteColor,)
        ],
      ),
    );
  }

  Widget _buildSideIndicator(StepModel step, int index) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: step.isActive ? Colors.orange : WebColors.greyColor,
                    width: 1),
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
                        step.isActive ? FontWeight.bold : FontWeight.w700,
                    color: step.isActive
                        ? WebColors.blackColor
                        : WebColors.sideBarUnselectedColor,
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
                          : WebColors.greyColor),
                ),
              ],
            ),
          ],
        ),
        WebConstants.kheight20
      ],
    );
  }
