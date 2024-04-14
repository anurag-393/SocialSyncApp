import 'dart:io';

import 'package:beproject/screens/select_platform_screen.dart';
import 'package:beproject/widgets/video_player_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:beproject/constants/global.dart';

class UploadPostScreen extends StatefulWidget {
  @override
  State<UploadPostScreen> createState() => _PostUploadState();
}

class _PostUploadState extends State<UploadPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hashtagController = TextEditingController();

  getMultipleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      List<File?> pickedFiles =
          result.paths.map((path) => File(path!)).toList();
      setState(() {
        files = pickedFiles;
        fileofPost = files[0]!;
      });
    }
  }

  List<File?> files = [];

  List<String> hashtags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Upload",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          getMultipleFile();
                        },
                        child: const Text(
                          "Choose a file",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      files.isEmpty
                          ? const Text("No files selected")
                          : SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: files.length,
                                itemBuilder: (BuildContext context, int index) {
                                  File? file = files[index];
                                  if (file != null) {
                                    return Container(
                                      margin: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: file.path
                                              .toLowerCase()
                                              .endsWith('.mp4')
                                          ? VideoPlayerWidget(file: file)
                                          : Image.file(file),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _hashtagController,
                              decoration: const InputDecoration(
                                hintText: 'Enter hashtag',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              if (_hashtagController.text.isNotEmpty) {
                                setState(() {
                                  hashtags.add(_hashtagController.text);
                                  _hashtagController.clear();
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      hashtags.isEmpty
                          ? const Text("No hastags added")
                          : SizedBox(
                              height: 60,
                              child: ListView.builder(
                                itemCount: hashtags.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).splashColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Text(
                                        "#${hashtags[index]}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectPlatformScreen(),
                              transition: Transition.zoom);
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            titleforpost = _titleController.text;
                            description = _descriptionController.text;
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => SelectPlatformScreen(),
                                ),
                              );
                            }
                            print(titleforpost + " " + description);
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
