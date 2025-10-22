import 'package:coffee_app/config/constant/ui_constant.dart';
import 'package:coffee_app/domain/models/bean_model.dart';
import 'package:coffee_app/domain/models/coffee_model.dart';
import 'package:coffee_app/ui/core/ui/searchBar/searchbar.dart';
import 'package:coffee_app/ui/home/widgets/beans_card.dart';
import 'package:coffee_app/ui/home/widgets/coffee_card.dart';
import 'package:coffee_app/ui/home/widgets/coffee_types.dart';
import 'package:coffee_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBottomIndex = 0;

  // 🔻 Sahifalar
  final List<Widget> pages = [
    const HomeContent(),
    const Center(
        child: Text("Favorites", style: TextStyle(color: Colors.white))),
    const Center(child: Text("Cart", style: TextStyle(color: Colors.white))),
    const Center(child: Text("Profile", style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(child: pages[selectedBottomIndex]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0xFF141921),
        currentIndex: selectedBottomIndex,
        onTap: (index) => setState(() => selectedBottomIndex = index),
        selectedItemColor: const Color(0xFFD17842),
        unselectedItemColor: const Color(0xFF4E5053),
        showSelectedLabels: false, // 🔹 Label yo‘q
        showUnselectedLabels: false, // 🔹 Label yo‘q
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 26),
            activeIcon: Icon(Icons.home_rounded, size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded, size: 26),
            activeIcon: Icon(Icons.favorite_rounded, size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 26),
            activeIcon: Icon(Icons.shopping_bag_rounded, size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded, size: 26),
            activeIcon: Icon(Icons.person_rounded, size: 28),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final searchController = TextEditingController();
  int selectedIndex = 0;

  final coffeeType = [
    'All',
    'Cappuccino',
    'Espresso',
    'Americano',
    'Macchiato',
    'Latte',
    'Mocha',
    'Cortado',
    'Affogato',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset('assets/drawer_icon.png'),
        ),
        actions: [
          Image.asset('assets/person.png'),
          const SizedBox(width: 18.0),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: UiConstant.padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0),
                Text(
                  "Find the best \ncoffee for you",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 28.0),
                Padding(
                  padding: EdgeInsets.only(right: UiConstant.padding),
                  child: SearchBarWidget(controller: searchController),
                ),
                const SizedBox(height: 20),
                CoffeeTypeSelector(
                  coffeeTypes: coffeeType,
                  selectedIndex: selectedIndex,
                  onSelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                ),
                const SizedBox(height: 22.0),
                SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: CoffeeCard(coffee: coffeeList[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Coffee beans',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: beanList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: BeansCard(beanModel: beanList[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
