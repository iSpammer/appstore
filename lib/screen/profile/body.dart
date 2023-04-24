
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/help_center/help_center_screen.dart';
import 'package:carisma/screen/my_account/my_account_screen.dart';
import 'package:carisma/screen/notification/notification_screen.dart';
import 'package:carisma/screen/profile/profile_image.dart';
import 'package:carisma/screen/profile/profile_menu.dart';
import 'package:carisma/screen/setting/setting_screen.dart';
import 'package:carisma/screen/sign_in/sign_in_screen.dart';
import 'package:carisma/viewmodels/profile_menu_view_model.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ProfileMenuViewModel>(context);

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileImage(),
          SizedBox(height: 20),
          ProfileMenu(
            icon: "assets/icons/User Icon.svg",
            text: "My Account",
            didTapped: () {
              Navigator.pushNamed(context, MyAccountScreen.routeName);
            }
          ),
          ProfileMenu(
            icon: "assets/icons/Bell.svg",
            text: "Notifications",
            didTapped: () {
              Navigator.pushNamed(context, NotificationScreen.routeName);
            }
          ),
          ProfileMenu(
            icon: "assets/icons/Settings.svg",
            text: "Settings",
            didTapped: () {
              Navigator.pushNamed(context, SettingScreen.routeName);
            }
          ),
          ProfileMenu(
              icon: "assets/icons/Question mark.svg",
              text: "Help Center",
              didTapped: () {
                Navigator.pushNamed(context, HelpCenterScreen.routeName);
              }
          ),
          ProfileMenu(
              icon: "assets/icons/Log out.svg",
              text: "Log out",
              didTapped: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Sign Out"),
                      content: Text("Sign Out of ..."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              viewModel.signOut();

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  SignInScreen.routeName, (Route<dynamic> route) => false
                              );
                            },
                            child: Text("OK")
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"))
                      ],
                    );
                  }
                );
              }
          ),
        ]
      ),
    );
  }
}

