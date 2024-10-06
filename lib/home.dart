import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_code/converter.dart';
import 'package:flutter_clean_code/splash.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> pickDirectory() async {
    final file = DirectoryPicker()..title = 'Select your project directory';
    final result = file.getDirectory();
    if (result != null) {
      goToNextPage(result.path);
    }
  }

  void goToNextPage(String path) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Converter(selectedDirectory: path)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101030),
      body: const SafeArea(
        child: Center(
          child: Splash(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickDirectory,
        elevation: 1.0,
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          IconsaxPlusBroken.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
