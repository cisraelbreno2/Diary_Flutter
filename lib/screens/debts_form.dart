import 'package:day_project/models/debts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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