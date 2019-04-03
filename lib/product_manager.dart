import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget // fulWidget 
{

  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);
  /*

  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  final List<Map<String, String>> _products = [];  // can use final to say _products cannot be redefined ... but it can be manipulated (like _products.add , i.e.)

  @override
  void initState() {
    super.initState();
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  */

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(addProduct),  // see ***
      ),
      // ADDED EXPANDED VIEW - THIS EXPANDS LISTVIEW FOR ENTIRETY OF DEVICE FRAME vs. wrapping products in container
      // to use ListView must wrap Products in either expanded or container (not sure if you can use others yet ..)
      Expanded(child: Products(products, deleteProduct: deleteProduct))
    ]);
  }
}

