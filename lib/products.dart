import 'package:flutter/material.dart';

// import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'), 
                onPressed: () => Navigator
                    .pushNamed<bool>(context, '/product/' + index.toString()) 
                    .then((bool value) {
                  if (value) {
                    deleteProduct(index);
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }

Widget _buildProductLists() {
  Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      // if you do not want to render anything, you at least have to render an empty Container or build will crash when returning null
      // f.e.: productCards = Container();
      productCards = Center(child: Text('No Products Found'));
    }
    return productCards;
}

  @override
  Widget build(BuildContext context) {
    // Alternative Approaches to Render Content Conditionally
    return _buildProductLists();
  }
}

// - RENDER CONTENT CONDITIONALLY - from lesson 60
/*
@override
  Widget build(BuildContext context) {
    // ADDED LISTVIEW
    return products.length > 0 ? ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length,
    ) : Center(child: Text('No Products Found'));
  }
*/


// Other Way to Render Content - without function _buildProductLists() - from lesson 61
/*
Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('No Products Found'));
    }
    return productCard;
*/