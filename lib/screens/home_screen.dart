import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mytoko'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder:(context, index){
          return Card(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  child: Image.network(
                    'https://fakestoreapi.com/img/81fPKd-2AYL.AC_SL1500.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4
                  ),
                  child: Text('Kategori ${index + 1}', 
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
                  child: Text('\$20.0', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  ),  
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4
                  ),
                  child: Text('Produk ${index + 1}', 
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