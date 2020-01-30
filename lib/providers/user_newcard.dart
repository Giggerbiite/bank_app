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

  Future<void> fetchAndSetCards() async {
    const url = 'http://192.168.43.163:5000/card';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        print('/////////////data null>>>>>>>>>>>>>>>>>>>');
        return;
      }
      // print(extractedData['cards'][0]['amount']);
      // print('/////////////data null>>>>>>>>>>>>>>>>>>>');
      // print(extractedData['cards'][0]['amount']);
      final List<NewCard> loadedCards = [];
      //extractedData['cards'].forEach((cardData) {
      //print(cardData[2]);
      for (int i = 0; i < extractedData['cards'].length; i++) {
        print("loop runs");
        loadedCards.add(NewCard(
          id: extractedData['cards'][i]['id'],
          cardNo: extractedData['cards'][i]['cardNo'],
          cardType: extractedData['cards'][i]['cardType'],
          amount: extractedData['cards'][i]['amount'].toDouble(),
        ));
        // print("laoded cards");
        // print(loadedCards);
      }

      _newCard = loadedCards;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addNewCard(NewCard product) async {
    const url = 'http://192.168.43.163:5000/cards';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': product.id,
          'cardNo': product.cardNo,
          'cardType': product.cardType,
          'amount': product.amount,
        }),
        headers: {"Content-Type": "application/json"},
      );
      //print("///////////////////////////");
      //print(json.decode(response.body));

      final newProduct = NewCard(
        id: json.decode(response.body)[1]['id'],
        cardNo: product.cardNo,
        cardType: product.cardType,
        amount: product.amount,
      );
      //print(newProduct);
      _newCard.add(newProduct);
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
