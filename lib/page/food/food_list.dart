import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodlogin/page/food/food_details.dart';
import 'package:foodlogin/page/food/food_item.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    FoodItem(
      id: 1,
      name: "ข้าวผัดกุ้ง",
      price: 40,
      image: '.jpg',
    ),
    FoodItem(
      id: 2,
      name: "ข้าวหมูกรอบ",
      price: 40,
      image: 'mukroob.jpg',
    ),
    FoodItem(
      id: 3,
      name: "ข้าวมันไก่",
      price: 35,
      image: 'kai.jpg',
    ),
    FoodItem(
      id: 4,
      name: "ข้าวขาหมู",
      price: 40,
      image: 'kamu.jpg',
    ),
    FoodItem(
      id: 5,
      name: "ข้าวผัดคะน้าหมูกรอบ",
      price: 35,
      image: 'kana.jpg',
    ),
    FoodItem(
      id: 6,
      name: "ราดหน้า",
      price: 35,
      image: 'raadna.jpg',
    ),
    FoodItem(
      id: 7,
      name: "สุกี้",
      price: 35,
      image: 'suki.jpg',
    ),
    FoodItem(
      id: 8,
    name: "ข้าวต้มกุ้ง",
     price: 50,
      image: 'tum.jpg',
  ),
    FoodItem(
      id: 9,
      name: "ข้าวกะเพราะหมูสับไข่ดาว",
      price: 40,
      image: 'khaew.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          FoodItem item = items[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  //<route name ของหน้าปลายทาง>
                  FoodDetailsPage.routeName,
                  arguments: item,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/${item.image}',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          '${item.price.toString()} บาท',
                          style: GoogleFonts.prompt(fontSize: 15.0),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          );
        }
          ),
    );
  }
}
