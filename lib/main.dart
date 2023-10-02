import 'package:enneagram/route.dart';
import 'package:enneagram/screens/home/home_screen.dart';
import 'package:enneagram/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'get/binding/init_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면 회전 방지
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
        designSize: const Size(411, 820),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            builder: (context, child) {
              // 기기의 폰트 사이즈 무시하기
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(data: data.copyWith(textScaleFactor: 1.0), child: child!);
            },
            getPages: MyRoute.getRoutes(),
            initialBinding: InitBinding(),
            theme: theme(),
            // darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.dark,
            home: const HomeScreen(),
          );
        });
  }
}
