import 'package:flutter/material.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);

  @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 2, 
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Choose')
                ),
                ListTile(
                  title: Text('Products Admin'), 
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/admin');
                  }
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('EasyList'),
          ),
          body: ProductManager(products, addProduct, deleteProduct),
        )
      );
    }
}