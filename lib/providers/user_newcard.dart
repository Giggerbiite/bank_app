import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewCards with ChangeNotifier {
  List<NewCard> _newCard = [];
  List<NewCard> get newCard {
    return [..._newCard];
  }

  NewCard findById(String id) {
    return newCard.firstWhere((prod) => prod.id == id);
  }

  Future<void> addNewCard(NewCard product) async {
    const url = 'http://10.0.2.2:5000/cards';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': product.id,
          'cardNo': product.cardNo,
          'cardType': product.cardType,
          'amount': product.amount,
        }),
      );
      final newProduct = NewCard(
        id: json.decode(response.body)['id'],
        cardNo: product.cardNo,
        cardType: product.cardType,
        amount: product.amount,
      );
      print(newProduct);
      _newCard.add(product);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  // void addNewCard(NewCard newprod) {
  //   final addProduct = NewCard(
  //     id: newprod.id,
  //     cardNo: newprod.cardNo,
  //     cardType: newprod.cardType,
  //     amount: newprod.amount,
  //   );
  //   print(addProduct.cardNo);
  //   _newCard.add(addProduct);
  //   print(_newCard);
  //   notifyListeners();
  // }
}
