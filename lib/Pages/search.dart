import 'package:flutter/material.dart';
import 'package:marmara_ziraat/Pages/home/Product_page_body.dart';
import 'package:marmara_ziraat/models/products_model.dart';

class SearchBar extends SearchDelegate {
  List<ProductModel> products;

  SearchBar(this.products);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade100,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel => "Arama";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text("Hiç Ürün Yok"),
      );
    }
    List<ProductModel> filteredProducts = products
        .where((element) => (element.name! + element.description!)
            .toLowerCase()
            .contains((query.toLowerCase())))
        .toList();

    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text("Aradığınız kritere uygun ürün yok"),
      );
    }

    return buildProductsListView(filteredProducts);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("Ürün arama"),
      );
    }
    List<ProductModel> filteredProducts = products
        .where((element) => (element.name! + element.description!)
            .toLowerCase()
            .contains((query.toLowerCase())))
        .toList();

    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text("Aradığınız kritere uygun ürün yok"),
      );
    }

    return buildProductsListView(filteredProducts);
  }

  Widget buildProductsListView(List<ProductModel> products) {
    return ProductPageBody(products: products,fromSearch: true,);
  }
}
