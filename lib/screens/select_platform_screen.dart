// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace

import 'package:beproject/constants/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:beproject/services/posting.dart';
// import 'package:oneview/ApiCalling/PostWithApi.dart';
// import 'package:oneview/GlobalVariables/Global.dart';

class SelectPlatformScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _selectPlatFormState();
}

class _selectPlatFormState extends State<SelectPlatformScreen> {
  List selectedPlatformsBool = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            "Select Social Platforms",
            style: GoogleFonts.poppins(
              fontSize: 28,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (selectedPlatformsBool[0]) {
                          setState(() {
                            selectedPlatformsBool[0] = false;
                          });
                        } else {
                          setState(() {
                            selectedPlatformsBool[0] = true;
                          });
                        }
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/instagram.svg",
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ),
                  ),
                  selectedPlatformsBool[0] == false
                      ? SizedBox.shrink()
                      : Positioned(
                          right: -6,
                          top: -5,
                          child: Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.green,
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (selectedPlatformsBool[1]) {
                          setState(() {
                            selectedPlatformsBool[1] = false;
                          });
                        } else {
                          setState(() {
                            selectedPlatformsBool[1] = true;
                          });
                        }
                      },
                      child: SvgPicture.asset(
                        "assets/images/facebook.svg",
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ),
                  selectedPlatformsBool[1] == false
                      ? SizedBox.shrink()
                      : Positioned(
                          right: -6,
                          top: -5,
                          child: Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.green,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (selectedPlatformsBool[2]) {
                          setState(() {
                            selectedPlatformsBool[2] = false;
                          });
                        } else {
                          setState(() {
                            selectedPlatformsBool[2] = true;
                          });
                        }
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/youtube.svg",
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ),
                  ),
                  selectedPlatformsBool[2] == false
                      ? SizedBox.shrink()
                      : Positioned(
                          right: -6,
                          top: -5,
                          child: Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.green,
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (selectedPlatformsBool[3]) {
                          setState(() {
                            selectedPlatformsBool[3] = false;
                          });
                        } else {
                          setState(() {
                            selectedPlatformsBool[3] = true;
                          });
                        }
                      },
                      child: SvgPicture.asset(
                        "assets/images/x.svg",
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ),
                  selectedPlatformsBool[3] == false
                      ? SizedBox.shrink()
                      : Positioned(
                          right: -6,
                          top: -5,
                          child: Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.green,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          height: 60,
          width: 60,
          child: ElevatedButton(
            child: Text(
              "POST",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              List platforms = [];
              if (selectedPlatformsBool[0]) {
                platforms.add("instagram");
              }
              if (selectedPlatformsBool[1]) {
                platforms.add("facebook");
              }

              uploadPost(context, description, fileofPost);

              // List images = [];
              // images.add(image_url);
              // postApi(platforms, titleforpost, images, context);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ),
    );
  }
}
