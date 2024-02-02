import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageController extends GetxController {

  Future<String> func() async {
    return 'allan';
  }
 
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  var homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (_) {
          return Scaffold(
            body: FutureBuilder(
              future: homePageController.func(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return 
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed('/tela2');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.1,
                          color: Colors.blue,
                              
                          child: const Center(
                            child: Text('ir para tela 2')
                            ),
                        ),
                      ),
                    );
                
                  } else {
                    return const Text('Nenhum pet disponível');
                  }
                }else if (snapshot.hasError) {
                  return Text('Erro ao carregar a lista de pets: ${snapshot.error}');    
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 253, 72, 0),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
