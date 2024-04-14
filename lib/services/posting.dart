import 'dart:io';

import 'package:beproject/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void uploadPost(BuildContext context, String description, File file) async {
  // Show dialog box indicating progress
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent user from dismissing the dialog
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('Posting...'),
        content: LinearProgressIndicator(),
      );
    },
  );

  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://social-sync-eayb.onrender.com/upload'));
    request.fields.addAll({'description': description});

    // Add the file to the request if it's not null
    request.files.add(await http.MultipartFile.fromPath('image', file.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Post successful, close the dialog
      Navigator.pop(context);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post uploaded successfully')),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      // Post failed, close the dialog
      Navigator.pop(context);

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to upload post: ${response.reasonPhrase}')),
      );
    }
  } catch (e) {
    // An error occurred, close the dialog
    Navigator.pop(context);

    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred: $e')),
    );
  }
}
