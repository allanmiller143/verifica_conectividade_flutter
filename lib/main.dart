import 'package:conexao_internet/dependency_injection.dart';
import 'package:conexao_internet/homePage.dart';
import 'package:conexao_internet/tela2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  DependencyInjection.init();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/',page: () => HomePage(),transition: Transition.rightToLeft,transitionDuration: const Duration(milliseconds: 400)),
        GetPage(name: '/tela2',page: () => Tela2Page(),transition: Transition.rightToLeft,transitionDuration: const Duration(milliseconds: 400)),

      ],
    );
  }
}
