import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/utils/shared_prefs.dart';
import 'package:parking_u/views/about/about_screen.dart';
import 'package:parking_u/views/account/account_screen.dart';
import 'package:parking_u/views/login/login_screen.dart';
import 'package:parking_u/views/profile/components/profile_menu.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile-pic-user.png"),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.46,
                        child: Text(
                          ("Akun Saya"),
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: headline6,
                            color: secondaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.46,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AccountScreen(),
                                  ),
                                )
                              },
                              child: AutoSizeText(
                                ("Edit Profil   >"),
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: caption,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
          ProfileMenu(
            text: "Tentang Kami",
            icon: Icons.question_answer_outlined,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              )
            },
          ),
          Divider(),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout,
            press: () {
              _onWillPop();
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Anda yakin?'),
            content: new Text('Ingin logout dari aplikasi ini'),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'Tidak',
                  style: TextStyle(color: secondaryTextColor),
                ),
              ),
              new TextButton(
                onPressed: () {
                  SharedPref.removeToken();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: new Text(
                  'Ya',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
