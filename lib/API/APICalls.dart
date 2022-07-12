import 'dart:convert';
import 'package:farmkenya/models/Products.dart';
import 'package:http/http.dart' as http;

import 'APIs.dart';

class APICalls{

  static Future<List<Products>>? getProducts() async{

    try{
      final response = await http.get(Uri.parse(products));

      if(response.statusCode ==200){
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((e) =>Products.fromJson(e)).toList();
      }else{
        print("we have  a problem------------------");
        throw Exception("Unable to get products");
      }
    }catch (e){
      print(e);
      rethrow;
    }
    }
    static Future<List<Products>>? getProductDetails(String productId) async{
    try{
      final response = await http.get(Uri.parse("$products/$productId"));

      if(response.statusCode ==200){
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((e) =>Products.fromJson(e)).toList();
      }else{

        throw Exception("Unable to get product's details");
      }
    }catch (e){
      print(e);
      rethrow;
    }
    }
    static Future<List<Products>>? getOrganicProducts() async{
    try{
      final response = await http.get(Uri.parse(organicProducts));
      print(organicProducts);
      if(response.statusCode ==200){
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((e) =>Products.fromJson(e)).toList();
      }else{

        throw Exception("Unable to get Organic Products");
      }
    }catch (e){
      print(e);
      rethrow;
    }
    }
    static Future<List<Products>>? getOrganicProductDetails(String productId) async{
    try{
      final response = await http.get(Uri.parse("$organicProducts/$productId"));
print(response);
      if(response.statusCode ==200){
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((e) =>Products.fromJson(e)).toList();
      }else{

        throw Exception("Unable to get Organic  product details");
      }
    }catch (e){
      print(e);
      rethrow;
    }
    }
}
