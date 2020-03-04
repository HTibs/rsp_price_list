import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/itemModel.dart';
import '../services/connection.dart' as connection;
//import '../widgets/quantityWidget.dart';

class ItemsScopedModel extends Model {
  List<Item> allItemsList = [];

  Future<List<Item>> getAllItemsListFuture() async {
    // create the list of all items here and then return it to future builder
    // in thew future builder use this list for listview builder
    http.Response result = await http.get(connection.url);
    print(result.statusCode);
    print(result.body);
    print('if printing the json text then working fine');
    return parseItem(result.body);
  }

  List<Item> parseItem(String responseBody) {
    // referred the official docs
    // A function that converts a response body into a List<Item>.
    // this function is used in the above future
    // here an isolate can also be created such that the working of slower devices is better
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    allItemsList = parsed.map<Item>((json) => Item.fromJson(json)).toList();
    return allItemsList;
  }

  Widget allItemsFutureBuilder(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: getAllItemsListFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? allItemsListBuilder(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget allItemsListBuilder(List<Item> all) {
    return ListView.builder(
        itemCount: all.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0, right: 5.0, left: 5.0),
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 2.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 70.0,
                      height: 70.0,

                      // container for image
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        all[index].name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Previous Price: Rs ${all[index].currentPrice}',
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
          ;
        });
  }
}