class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {

    List<Product> items = <Product>[];

    items.add(
        Product(
            'Hypto Krypto',
            'Nice beginner board',
            350,
            'Haydenshapes-Hypto-Krypto.jpg'
        )
    );
    items.add(
        Product(
            'Plunder',
            'A strange board',
            500,
            'Haydenshapes-Plunder.jpg'
        )
    );
    items.add(
        Product(
            'White Noiz',
            'A board for advanced surfers',
            600,
            'Haydenshapes-White-Noiz.jpg'
        )
    );

    return items;
  }
}
