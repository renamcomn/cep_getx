import 'package:cep_getx/views/detail_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  
  String cep = '';
  changeCep(String value) {
    cep = value.trim();
    update();
  }

  late Map<String, dynamic> result;
  Future searchCep() async {
    changeIsLoading(true);

    final String url = 'https://viacep.com.br/ws/$cep/json';
    final GetConnect _connect = GetConnect();

    final _res = await _connect.get(url);
    result = _res.body;

    print(result);
    Get.to(DetailView());
    changeIsLoading(false);
  }

  String? cepValidate() {
    if(cep.isEmpty || cep.length < 8 || cep.length > 8) {
      return 'CEP inválido';
    }
    return null;
  }

  bool isLoading = false;
  changeIsLoading(bool value) {
    isLoading = value;
    update();
  }
}