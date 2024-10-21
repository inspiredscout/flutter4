import 'package:flutter/material.dart';
import 'package:pks4/components/item.dart';
import 'package:pks4/model/product.dart';
import 'package:pks4/pages/add_collector_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CollectorsSets> collectors = List.from(initialCars);

  void _addNewCollector(CollectorsSets collector) {
    setState(() {
      collectors.add(collector);
    });
  }

  void _removeCar(int id) {
    setState(() {
      collectors.removeWhere((collector) => collector.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Collectors Shop',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: collectors.isNotEmpty
            ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: collectors.length,
          itemBuilder: (BuildContext context, int index) {
            final collector = collectors[index];
            return Dismissible(
              key: Key(collector.id.toString()),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _removeCar(collector.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${collector.name} удален")),
                );
              },
              child: ItemNote(collectorsSets: collector),
            );
          },
        )
            : const Center(child: Text('Нет доступных сетов')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCollector = await Navigator.push<CollectorsSets>(
            context,
            MaterialPageRoute(builder: (context) => const AddCarPage()),
          );
          if (newCollector != null) {
            _addNewCollector(newCollector);
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
