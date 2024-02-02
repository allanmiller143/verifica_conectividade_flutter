import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NeteworkCntroller extends GetxController {
  final Connectivity connectivity = Connectivity();

  @override
  void onInit(){
    super.onInit();
    connectivity.onConnectivityChanged.listen(atualizaStatusConexao);
    
  }

  void atualizaStatusConexao(ConnectivityResult connectivityResult){
    if(connectivityResult == ConnectivityResult.none){
      Get.rawSnackbar(
        messageText: const Text('Parece que você está sem internet'),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor:const  Color.fromARGB(255, 255, 51, 0),
      );
    }else{
      if(Get.isSnackbarOpen){
          Get.closeCurrentSnackbar();
      }
    }

  }


 
}

