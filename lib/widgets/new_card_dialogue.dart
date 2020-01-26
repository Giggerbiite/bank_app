import 'package:flutter/material.dart';
import 'package:visa/models/user_data_model.dart';
import '../providers/user_newcard.dart';
import '../widgets/box_decoration.dart';
import 'package:provider/provider.dart';

class NewCardDialogue extends StatefulWidget {
  @override
  _NewCardDialogueState createState() => _NewCardDialogueState();
}

class _NewCardDialogueState extends State<NewCardDialogue> {
  final cardNumberController = TextEditingController();

  final amountController = TextEditingController();

  var _cardType = '';
  final List<NewCard> addTx = [];
  var currentSelectedValue;
  final cardTypes = [
    'Visa',
    'American Express',
    'Master',
    'Discover',
    'MissionLane'
  ];

  void submitData() {
    final enteredCardNumber = cardNumberController.text;
    final enteredAmount = double.parse(amountController.text);
    final _cardList = Provider.of<NewCards>(context, listen: false);
    if (enteredCardNumber.isEmpty || enteredAmount <= 0 || _cardType.isEmpty) {
      return;
    }
    final newTx = NewCard(
      id: _cardList.newCard.length,
      cardNo: enteredCardNumber,
      amount: enteredAmount,
      cardType: _cardType,
    );
    //print(newTx.id);
    Provider.of<NewCards>(context, listen: false).addNewCard(newTx);
    Navigator.of(context).pop();
  }

// copied from stckoverflow
  Widget typeFieldWidget() {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select Card Type"),
                value: currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                    _cardType = newValue;
                  });
                  //print(currentSelectedValue);
                },
                items: cardTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                  
                  labelStyle: TextStyle(
                    color: Colors.black,
                  )),
              controller: cardNumberController,
              //onSubmitted: (){} //=> submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,

              //onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            typeFieldWidget(),

            // Row(
            //   children: <Widget>[
            //     Text(' Select Card Type :'),
            //     DropdownButton<String>(
            //       items: <String>[
            //         'Visa',
            //         'American Express',
            //         'Master',
            //         'Discover',
            //         'MissionLane'
            //       ].map((String value) {
            //         return new DropdownMenuItem<String>(
            //           value: value,
            //           child: new Text(value),
            //         );
            //       }).toList(),
            //       onChanged: (value) => _cardType = value,
            //     ),
            //   ],
            // ),
            FlatButton(
              child: Text('Add Card'),
              textColor: Colors.purple,
              onPressed: () => {
                setState(() {
                  submitData();
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
