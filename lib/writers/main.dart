import 'package:flutter_clean_code/file_helpers.dart';

Future<void> createMainFile(
  String targetDirectory,
  String projectName,
  List<String> features,
  Function stateCallback,
) async {
  List<String> splits = projectName.split("_");
  String projectNameAsWords = "";
  String projectNameCapitalized = "";

  for (String split in splits) {
    String capitalizedWord =
        "${split.substring(0, 1).toUpperCase()}${split.substring(1).toLowerCase()}";
    projectNameAsWords += "$capitalizedWord ";
    projectNameCapitalized += capitalizedWord;
  }

  projectNameAsWords = projectNameAsWords.trim();

  await writeToFile(
    "$targetDirectory\\main.dart",
    _content(
      projectName,
      projectNameAsWords,
      projectNameCapitalized,
      features,
    ),
  );
  stateCallback("Creating Core Folder");
}

String _content(
  String projectName,
  String projectNameAsWords,
  String projectNameCapitalized,
  List<String> features,
) {
  String generatedFeatures = "", generatedRoutes = "";
  for (String feature in features) {
    generatedFeatures +=
        "import 'package:$projectName/features/$feature/routes.dart';\n";
    generatedRoutes += ',\n\t\t\t\t...${feature}Routes';
  }

  return """
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:$projectName/core/controllers/notifications.dart';
import 'package:$projectName/core/database/configuration.dart';
import 'package:$projectName/core/extensions/extensions.dart';
import 'package:$projectName/core/navigation/pages.dart';
import 'package:$projectName/core/ui/ui.dart';
$generatedFeatures
import 'package:timeago/timeago.dart' as time;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  initializeNotificationChannels();
  await confirmNotificationPermissions();

  await ScreenUtil.ensureScreenSize();

  await DatabaseHandler.init();
  runApp(const ProviderScope(child: $projectNameCapitalized()));
}

void initializeNotificationChannels() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: '${projectName}_group',
        channelKey: '${projectName}_channel_key',
        channelName: '$projectNameAsWords',
        channelShowBadge: true,
        channelDescription: 'Notification channel for $projectNameAsWords',
        defaultColor: AppColors.primary,
        ledColor: AppColors.secondary,
        importance: NotificationImportance.High,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: '${projectName}_group',
        channelGroupName: '$projectNameAsWords Notification Group',
      )
    ],
    debug: true,
  );
}

Future<void> confirmNotificationPermissions() async {
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    await AwesomeNotifications()
        .requestPermissionToSendNotifications(permissions: [
      NotificationPermission.Alert,
      NotificationPermission.Sound,
      NotificationPermission.Badge,
      NotificationPermission.Vibration,
      NotificationPermission.Light,
      NotificationPermission.FullScreenIntent,
    ]);
  }
}

class $projectNameCapitalized extends ConsumerStatefulWidget {
  static late GoRouter router;

  const $projectNameCapitalized({
    super.key,
  });

  @override
  ConsumerState<$projectNameCapitalized> createState() => _${projectNameCapitalized}State();
}

class _${projectNameCapitalized}State extends ConsumerState<$projectNameCapitalized> {

  @override
  void initState() {
    super.initState();

    setupNavigationRoutes();
    setupNotificationListeners();

    time.setDefaultLocale('en_short');
  }

  void setupNavigationRoutes() {
    $projectNameCapitalized.router = GoRouter(
      initialLocation: Pages.splash.path,
      routes: [
        $generatedRoutes
      ],
    );
  }

  void setupNotificationListeners() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp.router(
        title: '$projectNameAsWords',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        routerConfig: $projectNameCapitalized.router,
      ),
      splitScreenMode: true,
      designSize: const Size(390, 844),
      minTextAdapt: true,
    );
  }
}
  """;
}
