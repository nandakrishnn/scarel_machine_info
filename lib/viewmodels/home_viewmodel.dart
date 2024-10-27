import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarel_info_machine/constants/colors.dart';
import 'package:scarel_info_machine/constants/height.dart';
import 'package:scarel_info_machine/constants/validators.dart';
import 'package:scarel_info_machine/models/database_model.dart';
import 'package:scarel_info_machine/widgets/custom_elevated_button.dart';
import 'package:scarel_info_machine/widgets/custom_large_feild.dart';
import 'package:scarel_info_machine/widgets/custom_switchrow.dart';
import 'package:scarel_info_machine/widgets/custom_textform_heading.dart';
import 'package:scarel_info_machine/widgets/custom_textformfeild.dart';

import '../models/email_campaign_provider.dart';

Widget buildForm() {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController campaignController = TextEditingController();
  TextEditingController previewController = TextEditingController();
  TextEditingController fromNameController = TextEditingController();
  TextEditingController fromEmailController = TextEditingController();
  return Consumer(
    builder: (context, ref, child) {
         final emailCampaignNotifier = ref.watch(emailCampaignProvider.notifier);
              final campaignData = ref.watch(emailCampaignProvider);
                 Future<void> _fetchData() async {
        await emailCampaignNotifier.fetchCampaigns();
      }
        if (campaignData.isNotEmpty) {
      final firstCampaign = campaignData.first;
      campaignController.text = firstCampaign.subject;
      previewController.text = firstCampaign.previewText;
      fromNameController.text = firstCampaign.fromName;
      fromEmailController.text = firstCampaign.fromEmail;
    }
      return  Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Create New Email Campaign",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            WebConstants.kheight5,
            const Text(
              "Fill out these details to build your broadcast",
              style: TextStyle(
                  color: WebColors.sideBarUnselectedColor,
                  fontWeight: FontWeight.w400),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WebConstants.kheight20,
                  WebConstants.kheight5,
                  TextFormHeadingWidget(
                    heading: 'Campaign Subject',
                  ),
                  WebConstants.kheight3,
                  CustomTextField(
                      validator: (p0) => Validators.validateSubject(p0),
                      hintText: 'Enter Subject'),
                  WebConstants.kheight20,
                  TextFormHeadingWidget(
                    heading: 'Preview text',
                  ),
                  WebConstants.kheight3,
                  CustomTextFieldLarge(
                    validator: (p0) => Validators.validatePreview(p0),
                    hintText: 'Enter text here...',
                    obscure: false,
                  ),
                  WebConstants.kheight10,
                  const Text(
                    "Keep this simple of 50 character",
                    style: TextStyle(
                        color: WebColors.sideBarUnselectedColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  WebConstants.kheight20,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormHeadingWidget(
                              heading: '"From" Name',
                            ),
                            WebConstants.kheight3,
                            CustomTextField(
                                validator: (p0) => Validators.validateName(p0),
                                hintText: 'From Anne'),
                          ],
                        ),
                      ),
                      WebConstants.kwidth20,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormHeadingWidget(
                              heading: '"From" Email',
                            ),
                            WebConstants.kheight3,
                            CustomTextField(
                                validator: (p0) => Validators.validateEmail(p0),
                                hintText: 'Anne@example.com'),
                          ],
                        ),
                      )
                    ],
                  ),
                  WebConstants.kheight10,
                  const Divider(
                    color: WebColors.greyColor,
                    indent: 1,
                    endIndent: 1,
                    thickness: .5,
                  ),
                  CustomSwitchRow(title: 'Run only once per customer',),
                  WebConstants.kheight5,
                  CustomSwitchRow(title: 'Custom audience',),
                  WebConstants.kheight15,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('You can set up a ',
                          style:
                              TextStyle(color: WebColors.sideBarUnselectedColor)),
                      Text(
                        'Custom domain or connect your email service provider ',
                        style: TextStyle(color: Color.fromARGB(255, 244, 111, 3)),
                      ),
                      Text('to change this.',
                          style: TextStyle(color: WebColors.sideBarUnselectedColor))
                    ],
                  ),
                  WebConstants.kheight10,
                  const Divider(
                    color: WebColors.greyColor,
                    indent: 1,
                    endIndent: 1,
                    thickness: .5,
                  ),
                  WebConstants.kheight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onTap: (){
                             if (_formKey.currentState?.validate() ?? false) {
                              final campaign = EmailCampaignData(
                                id: 0, 
                                subject: campaignController.text,
                                previewText: previewController.text,
                                fromName: fromNameController.text,
                                fromEmail: fromEmailController.text,
                              );
        
                              emailCampaignNotifier.addCampaign(campaign);
                              print('data saved');
                             
                            }
                        }
                        ,
                        horizontal: 70,
                        vertical: 20,
                        borderColor: WebColors.orangeColor,
                        textInside: 'Save Draft',
                        textColor: WebColors.orangeColor,
                        backgroundColor: WebColors.whiteColor,
                      ),
                      CustomElevatedButton(
                        onTap: (){},
                        horizontal: 110,
                        vertical: 20,
                        borderColor: WebColors.orangeColor,
                        textInside: 'Next Step',
                        textColor: WebColors.whiteColor,
                        backgroundColor: WebColors.orangeColor,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    },
   
  );
}
