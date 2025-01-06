import 'package:flutter/material.dart';
import 'package:xfm/src/rust/api/window_manager.dart';
import 'package:xfm/src/rust/frb_generated.dart';
import 'package:xfm/src/ui/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize RustLib
  await RustLib.init();
  toCenter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Explorer',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FileExplorerHome(),
    );
  }
}
