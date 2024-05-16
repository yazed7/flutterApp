import 'package:flutter/material.dart';
import 'package:restaurant/Product/Page/product_page.dart';
import '../Components/current_location.dart';
import '../Components/description_box.dart';
import '../Components/drawer/drawer.dart';
import '../Components/sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

                //description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Container(
          child: Stack(
            children: [
              // Background photo
              Image.asset(
                'assets/images/res.jpg',
                width: MediaQuery.of(context)
                    .size
                    .width, // Set width to full screen width
                height: MediaQuery.of(context)
                    .size
                    .height, // Set height to full screen height
                fit: BoxFit.cover,
              ),
              // Content
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Photo and restaurant description
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(100),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Set text color to black
                    padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 24), // Adjust padding as needed
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 // Set FontWeight to bold
                        ),
                  ),
                  child: const Text('Explore Our Menu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
