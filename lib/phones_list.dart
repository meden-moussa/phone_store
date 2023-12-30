import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_store_linux/phone.dart';

class PhonesList extends StatefulWidget {
  const PhonesList({super.key});

  @override
  State<PhonesList> createState() => _PhonesListState();
}

class _PhonesListState extends State<PhonesList> {
  int selectedIndx = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndx,
            onTap: (index) {
              setState(() {
                selectedIndx = index;
              });
            },
            selectedItemColor: Colors.orange,
            iconSize: 38,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "."),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopify),
                label: "",
              ),
            ]),
        body: Container(
          padding:
              const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.grey[300],
                            filled: true,
                            hintText: "Search",
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                image: const DecorationImage(
                                    image: AssetImage("img/bestSeller.jpg"),
                                    fit: BoxFit.cover)),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "List of available phones",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('phones')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;

                      return SizedBox(
                        // height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: documents.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final document = documents[index];
                            final phoneImage = document['image'];
                            final phoneName = document['name'];

                            final phoneIsbestseller = document['isBestSeller'];
                            final phonePrice = document['price'];
                            final phoneQuantity = document['quantity'];

                            return Phones(
                                imageUrl: phoneImage,
                                name: phoneName,
                                isBestSeller: phoneIsbestseller,
                                price: phonePrice,
                                quantity: phoneQuantity);
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {}
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By: meden Moussa ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.copyright),
                        Text(
                          " 2023",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
