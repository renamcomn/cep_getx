import 'package:cep_getx/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {


  HomeView({ Key? key, required homeController }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CEP com GetX"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              GetBuilder<HomeController>(builder: (_) {
                return TextField(
                  keyboardType: TextInputType.number,
                  onChanged: homeController.changeCep,
                  decoration: InputDecoration(
                    labelText: "Informe seu CEP:",
                    errorText: homeController.cepValidate(),
                  ),
                );
              }),
              GetBuilder<HomeController>(builder: (_) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      return homeController.isLoading || homeController.cepValidate() != null ? Colors.grey : Colors.purple;
                    })
                  ),
                  onPressed: homeController.isLoading ? null : homeController.searchCep, 
                  child: homeController.isLoading ? CircularProgressIndicator() : Text("Buscar")
                );
              }),
            ],
          ),
        )
      ),
    );
  }
}