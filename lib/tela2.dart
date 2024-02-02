import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Tela2PageController extends GetxController {

  Future<String> func() async {
    return 'allan';
  }
 
}

// ignore: must_be_immutable
class Tela2Page extends StatelessWidget {
  Tela2Page({super.key});
  var tela2PageController = Get.put(Tela2PageController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetBuilder<Tela2PageController>(
        init: Tela2PageController(),
        builder: (_) {
          return Scaffold(
            body: FutureBuilder(
              future: tela2PageController.func(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Center(child: Text('voltar para home'))
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
