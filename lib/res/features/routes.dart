String routeContent(String projectName, String featureName) {
  return """
import 'package:go_route/go_route.dart';"
import 'package:$projectName/core/extensions/extensions.dart';"
import 'package:$projectName/core/navigation/pages.dart';

final List<GoRoute> ${featureName}Routes = [


];
""";
}

String splashRouteContent(String projectName) {
  return """
import 'package:go_route/go_route.dart';"
import 'package:$projectName/core/extensions/extensions.dart';"
import 'package:$projectName/core/navigation/pages.dart';
import 'package:$projectName/features/splash/presentation/pages/splash.dart';


final List<GoRoute> splashRoutes = [
  GoRoute(
    name: Pages.splash,
    path: Pages.splash.path,
    builder: (_,__) => const SplashPage(),
  ),
];
""";
}
