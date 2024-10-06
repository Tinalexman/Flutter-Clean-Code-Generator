import 'package:flutter/material.dart';
import 'package:flutter_clean_code/dependencies.dart';
import 'package:flutter_clean_code/utils.dart';
import 'package:flutter_clean_code/widgets.dart';
import 'package:flutter_clean_code/writers/writer.dart';

class Converter extends StatefulWidget {
  final String selectedDirectory;

  const Converter({
    super.key,
    required this.selectedDirectory,
  });

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController featuresController = TextEditingController();
  final List<String> features = [];

  @override
  void dispose() {
    projectNameController.dispose();
    featuresController.dispose();
    super.dispose();
  }

  bool validate() {
    String text = projectNameController.text.trim();
    String errorMessage = "";
    if (text.isEmpty) {
      errorMessage = "Invalid project name";
    } else if (features.isEmpty) {
      errorMessage = "Add at least one feature";
    }

    if (errorMessage != "") {
      context.snackBar.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          elevation: 1.0,
          duration: const Duration(seconds: 2),
          content: Text(
            errorMessage,
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> showDependencies() async {
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 1.0,
        backgroundColor: Colors.black,
        child: SizedBox(
          height: 360,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Note",
                  style: context.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "The following dependencies are assumed to have been installed on the project. "
                  "If they have not, add them into your 'pubspec.yaml' file and run 'flutter pub get'.",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstSetOfDependencies,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      secondSetOfDependencies,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    fixedSize: const Size(400, kMinInteractiveDimension),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                  child: Text(
                    "Continue",
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
      ),
    );

    goToNextPage();
  }

  void goToNextPage() {
    String projectName = projectNameController.text.trim();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CleanCodeWriter(
          targetDirectory: "${widget.selectedDirectory}\\lib",
          projectName: projectName,
          features: features,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101030),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 450,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Generate Squeaky Clean Code",
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "What is the name of your project?",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SpecialForm(
                    controller: projectNameController,
                    width: 450,
                    hint: "e.g my_first_project",
                    onValidate: (String val) {
                      if (val.isEmpty) {
                        return 'Invalid project name';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "List the features in your project?",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SpecialForm(
                        controller: featuresController,
                        width: 300,
                        hint: "e.g authentication",
                        onValidate: (_) {
                          if (features.isEmpty) {
                            return 'Add at least one feature';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          String text = featuresController.text.trim();
                          if (text.isEmpty) {
                            context.snackBar.showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                elevation: 1.0,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  "Invalid feature name",
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            return;
                          }

                          features.add(text);
                          featuresController.clear();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          fixedSize: const Size(130, kMinInteractiveDimension),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                        ),
                        child: Text(
                          "Add",
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                      features.length,
                      (index) => Chip(
                        elevation: 1.0,
                        shadowColor: Colors.lightBlueAccent,
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(color: Colors.black),
                        label: Text(
                          features[index],
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        deleteIcon: const Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                          size: 16,
                        ),
                        onDeleted: () {
                          features.removeAt(index);
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (!validate()) return;
                      showDependencies();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      fixedSize: const Size(450, kMinInteractiveDimension),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                    ),
                    child: Text(
                      "Generate",
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
        ),
      ),
    );
  }
}
