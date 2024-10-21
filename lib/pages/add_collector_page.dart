import 'package:flutter/material.dart';
import 'package:pks4/model/product.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  _AddCollectorPageState createState() => _AddCollectorPageState();
}

class _AddCollectorPageState extends State<AddCarPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  String imageUrl = '';
  String price = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить новый автомобиль'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите описание';
                  }
                  return null;
                },
                onSaved: (value) {
                  description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL изображения'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите URL изображения';
                  }
                  return null;
                },
                onSaved: (value) {
                  imageUrl = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Цена'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите цену';
                  }
                  return null;
                },
                onSaved: (value) {
                  price = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newCollector = CollectorsSets(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: name,
                      description: description,
                      imageUrl: imageUrl,
                      price: price,
                    );
                    Navigator.pop(context, newCollector);
                  }
                },
                child: const Text('Добавить'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
