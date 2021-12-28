// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListDebts(),
    );
  }
}

class FormDebt extends StatelessWidget {

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nova Conta"),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Descrição do debito',
                hintText: 'Descrição',
              ),
              controller: _descriptionController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
              controller: _valorController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final String descricaoDebt = _descriptionController.text;
                final double valorDebt = double.tryParse(_valorController.text.replaceAll(",", ".")) ?? 0.00;
                if (valorDebt != 0.00) {
                  final newDebt = Debt(valorDebt, descricaoDebt);
                  Navigator.pop(context, newDebt);
                }
              },
              child: Text("Salvar"))
        ],
      ),
    );
  }
}


//Page 1 -----------------------------------------------------------------------------
class ListDebts extends StatefulWidget {

  final List<Debt> listDebts = [];

  @override
  State<StatefulWidget> createState() {
    return listDebtsState();
  }
}

class listDebtsState extends State<ListDebts>{

  var teste = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Debitos"),
      ),
      body: ListView.builder(
        itemCount: widget.listDebts.length,
        itemBuilder: (context, index){
          return ItemListDebt(widget.listDebts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Debt?> future = Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return FormDebt();
          }));
          future.then((value) {
            debugPrint(value?.name);
            setState(() {
              widget.listDebts.add(value!);
            });
          });
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemListDebt extends StatelessWidget {

  final Debt _debt;

  ItemListDebt(this._debt);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_debt.name),
        subtitle: Text(_debt.price.toString()),
      ),
    );
  }
}

class Debt {
  final double price;
  final String name;

  Debt(this.price, this.name);

  @override
  String toString() {
    return 'Debt{price: $price, name: $name}';
  }
}