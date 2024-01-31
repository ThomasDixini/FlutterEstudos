import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2)),
              width: 370,
              height: 670,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      validator: (String? value) =>
                          value == null || value.isEmpty
                              ? "Campo de nome requerido"
                              : null,
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Nome",
                          fillColor: Colors.white70,
                          filled: true,
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      validator: (value) => value!.isEmpty ||
                              int.parse(value) > 5 ||
                              int.parse(value) < 1
                          ? "Dado Invalido, insira entre 1 a 5"
                          : null,
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Dificuldade",
                          fillColor: Colors.white70,
                          filled: true,
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      validator: (value) =>  value!.isEmpty  ? "URL Invalida" : null,
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Imagem",
                          fillColor: Colors.white70,
                          filled: true,
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            Image.network(imageController.text, fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                          return Container();
                        }),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Dados Adicionados")));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Adicionar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
