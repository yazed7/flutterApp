import 'package:flutter/material.dart';
import 'package:restaurant/Components/phone_contact.dart';
import '../Components/current_location.dart';
import '../Components/description_box.dart';
import '../Components/drawer/drawer.dart';
import '../Components/sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const MySliverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // current location
                MyCurrentLocation(),

                // contact
                MyPhoneContact(),

                //description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2, // Create two columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: List.generate(6, (index) {
              return Image.asset(
                'assets/images/photo${index + 1}.jpg',
                fit: BoxFit.cover,
              );
            }),
          ),
        ),
      ),
    );
  }
}
