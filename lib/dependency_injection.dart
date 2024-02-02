import 'package:conexao_internet/controller/network_controller.dart';
import 'package:get/get.dart';

class DependencyInjection{
  static void init(){
    print('entrei aqui tbm');
    Get.put<NeteworkCntroller>(NeteworkCntroller(),permanent: true);
  }
}