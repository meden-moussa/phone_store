import 'package:flutter/material.dart';

class PhoneInfo extends StatefulWidget {
  final dataInfo;
  PhoneInfo({super.key, this.dataInfo});

  @override
  State<PhoneInfo> createState() => _PhoneInfoState();
}

class _PhoneInfoState extends State<PhoneInfo> {
  int selectedIndx = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
          // backgroundColor: const Color.fromARGB(255, 226, 219, 219),
          ),
      body: Container(
        // color: const Color.fromARGB(255, 226, 219, 219),
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Phone information",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image(image: NetworkImage(widget.dataInfo.imageUrl)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.dataInfo.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Price :   ${widget.dataInfo.price}MRO",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Quantity:  ${widget.dataInfo.quantity} ",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: MaterialButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Added Successfully"),
                  backgroundColor: Colors.green,
                ));
              },
              color: Colors.black,
              textColor: Colors.white,
              child: const Text("+Add to Card"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ]),
      ),
    );
  }
}
