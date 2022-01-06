import 'package:day_project/models/debts.dart';
import 'package:day_project/screens/Debts_form.dart';
import 'package:flutter/material.dart';

class ListDebts extends StatefulWidget {

  final List<Debt> listDebts = [];

  @override
  State<StatefulWidget> createState() {
    return listDebtsState();
  }
}

class listDebtsState extends State<ListDebts>{

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