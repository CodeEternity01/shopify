import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('express'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const VerticalDivider(thickness: 1),
                   CategoryItem('Vegetable', 'assets/vegetable.png'),
                   CategoryItem('Restaurant', 'assets/restaurant.png'),
                   CategoryItem('Grocery', 'assets/grocery.png'),
                  CategoryItem('More', 'assets/placeholder.png'),
                ],
              ),
            ),
          ),
          const Divider(thickness: 2),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children:  [
                CategoryItem('Rice, Atta & Dals', 'assets/rice.png'),
                CategoryItem('Spices, Salt & Sugar', 'assets/spices.png'),
                CategoryItem('Oil & Ghee', 'assets/oil.png'),
                CategoryItem('Dry Fruits, Nuts & Seeds', 'assets/dry_fruits.png'),
                CategoryItem('Snacks & Packaged Food', 'assets/snacks.png'),
                CategoryItem('Chocolates & Sweets', 'assets/chocolates.png'),
                CategoryItem('Beverages', 'assets/beverages.png'),
                CategoryItem('Detergents & Laundry', 'assets/detergents.png'),
                CategoryItem('Body & Skincare', 'assets/body_skincare.png'),
                CategoryItem('Hair Care', 'assets/hair_care.png'),
                CategoryItem('Women\'s Hygiene & Baby Care', 'assets/womens_hygiene.png'),
                CategoryItem('Oral Care & Wellness', 'assets/oral_care.png'),
                CategoryItem('Home & Kitchen', 'assets/home_kitchen.png'),
                CategoryItem('Household & Cleaning', 'assets/household_cleaning.png'),
                CategoryItem('Dairy & Bakery', 'assets/dairy.png'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:  BottomNavBar(),
    );
  }
}
