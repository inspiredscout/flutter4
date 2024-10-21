import 'package:flutter/material.dart';
import 'package:pks4/model/product.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key, required this.collectorsSet});

  final CollectorsSets collectorsSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collectorsSet.name, style: const TextStyle(fontSize: 22)),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Передать информацию о удалении обратно на HomePage
              Navigator.pop(context, collectorsSet.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  collectorsSet.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                collectorsSet.description,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Цена: ${collectorsSet.price}',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
