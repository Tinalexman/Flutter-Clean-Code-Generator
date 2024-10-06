String routeContent(String projectName, String featureName) {
  return """
import 'package:go_route/go_route.dart';"
import 'package:$projectName/core/extensions/extensions.dart';"
import 'package:$projectName/core/navigation/pages.dart';

final List<GoRoute> ${featureName}Routes = [


];
""";
}
