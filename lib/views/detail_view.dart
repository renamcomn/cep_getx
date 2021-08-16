import 'package:cep_getx/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  DetailView({ Key? key }) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado CEP: "),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Logradouro", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(homeController.result['logradouro']),
            SizedBox(height: 10),
            Text("Bairro", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(homeController.result['bairro']),
            SizedBox(height: 10),
            Text("Cidade", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(homeController.result['localidade']),
            SizedBox(height: 10),
            Text("IBGE", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(homeController.result['ibge'])
          ],
        ),
        ),
      ),      
    );
  }
}