import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:flutter_catalog/widgets/drawer_widget.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString('assets/files/data.json');
    final products = jsonDecode(json)['products'];
    CatalogItem.items = List.from(
      products,
    ).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App"), centerTitle: true),
      drawer: MyDrawer(),
      body: CatalogItem.items != null
          ? ListView.builder(
              itemCount: CatalogItem.items!.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogItem.items!.elementAt(index));
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
