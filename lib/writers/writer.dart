import 'package:flutter/material.dart';
import 'package:flutter_clean_code/utils.dart';
import 'package:flutter_clean_code/writers/core.dart';
import 'package:flutter_clean_code/writers/features.dart';
import 'package:flutter_clean_code/writers/main.dart';

class CleanCodeWriter extends StatefulWidget {
  final String targetDirectory;
  final String projectName;
  final List<String> features;

  const CleanCodeWriter({
    super.key,
    required this.targetDirectory,
    required this.projectName,
    required this.features,
  });

  @override
  State<CleanCodeWriter> createState() => _CleanCodeWriterState();
}

class _CleanCodeWriterState extends State<CleanCodeWriter> {
  String message = "";
  bool done = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, writeCleanCode);
  }

  Future<void> writeCleanCode() async {
    await createCore(widget.targetDirectory, widget.projectName, updateMessage);
    await createFeatures(widget.targetDirectory, widget.projectName,
        widget.features, updateMessage);
    await createMainFile(widget.targetDirectory, widget.projectName, widget.features, updateMessage);
    setState(() => done = true);
  }

  Future<void> updateMessage(String newMessage) async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() => message = newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101030),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!done)
                const CircularProgressIndicator(color: Colors.blueAccent),
              if (done)
                const Icon(
                  Icons.done_rounded,
                  color: Colors.blueAccent,
                  size: 56,
                ),
              const SizedBox(height: 20),
              Text(
                message,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (done)
              const SizedBox(height: 50),
              if (done)
                ElevatedButton(
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    fixedSize: const Size(300, kMinInteractiveDimension),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                  child: Text(
                    "Go Home",
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
