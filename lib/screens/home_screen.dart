import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlenshop/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> _product = [];

  @override
  void initState(){
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async{
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products')
    );

    debugPrint('Response: ${response.body}');

    if(response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      setState(() {
        _product = data.map(
          (json) => ProductModel.fromJson(json)
        ).toList();
      });
    }else{
      throw Exception('Gagal Anjay');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('onlenshop'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _product.length,
        itemBuilder:(context, index){
          final product = _product[index];

          return Card(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4
                  ),
                  child: Text(
                    product.category, 
                  style: TextStyle(
                    color: Colors.blueGrey
                  ),
                  ),  
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4
                  ),
                  child: Text('\$${product.price}', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ),  
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4
                  ),
                  child: Text(
                    product.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey
                  ),
                  ),  
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}