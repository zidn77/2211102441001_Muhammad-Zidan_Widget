import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Category {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });
}

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Expanded(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: viewportConstraints.maxWidth,
                          child: const Image(
                              image: NetworkImage(
                                  'https://businesslink.ca/wp-content/uploads/2023/10/Untitled-design-7-400x400.png')),
                        ),
                      ),
                      const ListProducts(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: viewportConstraints.maxWidth,
                          child: const Image(
                              image: NetworkImage(
                                  'https://i.ibb.co/18D724w/store.webp')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: 1,
        name: 'Vga RTX 4090',
        price: 44000000,
        imageUrl:
            'https://i.ibb.co/rsh3pDk/63949787f3740f11d04454f3-nvidia-geforce-rtx-4090-founders-edition.jpg',
      ),
      Product(
        id: 2,
        name: 'Monitor oddysey G9',
        price: 20000000,
        imageUrl: 'https://i.ibb.co/WGfRsxG/Odyssey-G9-2.jpg',
      ),
      Product(
        id: 3,
        name: 'i9 14900k',
        price: 10000000,
        imageUrl: 'https://i.ibb.co/Gt2bgmG/i9-14900k.webp',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: products.map((product) {
            return ProductImage(
              product: product,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final Product product;

  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(
            image: NetworkImage(product.imageUrl),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name),
              Text("Rp. ${product.price.toString()}"),
            ],
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: const Dashboard(),
    );
  }
}
