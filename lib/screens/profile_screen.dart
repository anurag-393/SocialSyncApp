import 'package:beproject/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Social Platforms",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                      ),
                    ),
                    const Text(
                      "Please authorize to use our posting feature.",
                      style: TextStyle(
                          // fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, top: 10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/images/instagram.svg",
                          ),
                          title: const Text(
                            "Instagram",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: const Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => PlatfrmAuthentication(
                        //         logo: SvgPicture.asset(
                        //           "assets/images/insta.svg",
                        //         ),
                        //         name: "Instagram"),
                        //   ),
                        // );
                      },
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, top: 10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/images/facebook.svg",
                          ),
                          title: const Text(
                            "Facebook",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: const Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => PlatfrmAuthentication(
                        //         logo: SvgPicture.asset(
                        //           "assets/images/fb.svg",
                        //         ),
                        //         name: "Facebook"),
                        //   ),
                        // );
                      },
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, top: 10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/images/youtube.svg",
                          ),
                          title: const Text(
                            "Youtube",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: const Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => PlatfrmAuthentication(
                        //         logo: SvgPicture.asset(
                        //           "assets/images/yt.svg",
                        //         ),
                        //         name: "Youtube"),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
