import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_small_button.dart';

// InviteFriendScreen
class ContactList {
  final String profilePic;
  final String contactName;
  final String contactNumber;
  final String buttonStatus;

  ContactList({
    required this.profilePic,
    required this.contactName,
    required this.contactNumber,
    required this.buttonStatus,
  });
}

class InviteFriendScreen extends StatelessWidget {
  InviteFriendScreen({super.key});

  final List<ContactList> contacts = [
    ContactList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invite,
    ),
    ContactList(
      profilePic: 'assets/images/girl_1.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invite,
    ),
    ContactList(
      profilePic: 'assets/images/girl_3.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invited,
    ),
    ContactList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invite,
    ),
    ContactList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invited,
    ),
    ContactList(
      profilePic: 'assets/images/girl_1.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invite,
    ),
    ContactList(
      profilePic: 'assets/images/girl_3.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invite,
    ),
    ContactList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invited,
    ),
    ContactList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invited,
    ),
    ContactList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      contactNumber: dummyText1,
      buttonStatus: invited,
    ),
  ];
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: inviteFriends),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = contacts[index];
            return Obx(
              () => ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage(contact.profilePic),
                ),
                title: Text(contact.contactName,
                    style: themeController.isDarkMode.value
                        ? dark.heading6
                        : light.heading6),
                subtitle: Text(contact.contactNumber,
                    style: themeController.isDarkMode.value
                        ? dark.bodyMediumMedium700
                        : light.bodyMediumMedium700),
                trailing: contact.buttonStatus == invite
                    ? CustomSmallButton(
                        bgColor: primaryColor,
                        onPress: () {},
                        buttonText: invite,
                        textColor: whiteColor,
                      )
                    : CustomSmallButton(
                        bgColor: whiteColor,
                        onPress: () {},
                        buttonText: invited,
                        textColor: primaryColor,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
