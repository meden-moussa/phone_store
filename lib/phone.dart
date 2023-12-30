// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phone_store_linux/phone_info.dart';

// ignore: must_be_immutable
class Phones extends StatelessWidget {
  final String imageUrl;

  final String name;
  final bool isBestSeller;
  final int price;
  final int quantity;

  Phones({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.isBestSeller,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PhoneInfo(
                dataInfo: new Phones(
                    imageUrl: imageUrl,
                    name: name,
                    isBestSeller: isBestSeller,
                    price: price,
                    quantity: quantity))));
      },
      child: Card(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Image.network(
                imageUrl,
                height: MediaQuery.of(context).size.height * 0.18,
                // width: MediaQuery.of(context).size.width * 0.48,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "  $name ",
                style: const TextStyle(
                    color: Color.fromARGB(255, 32, 30, 26),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(
                  " $price MRU",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
