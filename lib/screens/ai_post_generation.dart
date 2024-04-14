// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:beproject/constants/global.dart';

class AiPostGeneration extends StatefulWidget {
  const AiPostGeneration({super.key});

  @override
  State<AiPostGeneration> createState() => _AiPostGenerationState();
}

class _AiPostGenerationState extends State<AiPostGeneration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  String beforeGeneratingText =
      "You can use generated content to post directly in your different social media.";
  String afterGenratingText =
      "Best things always takes TIME to come out,Please Take a seat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AI Post Generation",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title/Describe about the post',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please some data';
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 200),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 50, left: 50),
                    //   child: Text(
                    //     isLoading ? afterGenratingText : beforeGeneratingText,
                    //     style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    // ),
                    // isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              // textToImage(_titleController.text, context);
                              // Continue with your logic
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => AiPostGen(
                              //       inputData: _titleController.text,
                              //     ),
                              //   ),
                              // );
                            }
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
