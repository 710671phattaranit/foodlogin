import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodlogin/page/plat.dart';
import 'package:foodlogin/page/food/food_item.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsPage extends StatelessWidget {
  static const routeName = '/food_details_page';

  const FoodDetailsPage();

  @override
  Widget build(BuildContext context) {
    final foodItem = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2,
              child: PlatformAwareAssetImage(
                assetPath: 'assets/images/${foodItem.image}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ชื่อเมนู: ${foodItem.name}',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                  Text(
                    'ราคา: ${foodItem.price.toString()} บาท',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            if (false)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'ชื่อเมนู: ${foodItem.name}',
                        style: GoogleFonts.prompt(fontSize: 20.0),
                      ),
                      Text(
                        'ราคา: ${foodItem.price.toString()} บาท',
                        style: GoogleFonts.prompt(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}