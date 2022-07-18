import 'package:bsklita/bindings/network_controller_binding.dart';
import 'package:bsklita/routes.dart';
import 'package:bsklita/translations/translations.dart';
import 'package:flutter/material.dart'; 
import 'package:bsklita/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
 

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(
    const MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      title: 'app_title'.tr, 
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en','en-US'),
      translationsKeys: AppTranslation.translationsKeys,
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: '/home',
      initialBinding: NetworkControllersBindings(),
      getPages: Routes.routes,
    ); 
  } 
}

