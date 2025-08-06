import 'package:doclink/controller_binder.dart';
import 'package:doclink/routes/app_routes.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocLinkApp extends StatelessWidget {
  const DocLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DocLink',
      getPages: AppRoutes.pages,
      initialRoute: RouteNames.splashScreen,
      initialBinding: ControllerBinder(),
      theme: AppTheme.lightTheme,
    );
  }
}
