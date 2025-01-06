import 'package:flutter/material.dart';

class FileManagerSidebar extends StatelessWidget {
  const FileManagerSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Jianwen's FileManager",
              style: TextStyle(
                  fontFamily: "GreatVibes",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cloud Storage",
                  ),
                )
              ],
            ))
      ],
    );
  }
}
