import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/Food.dart';

import 'Explore.dart';
import 'Recipe.dart';
import 'Wishlish.dart';

void main() {
  runApp(FoodRecipe());
}

class FoodRecipe extends StatelessWidget {
  const FoodRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Recipe App",
      home: FoodRecipeHome(),
    );
  }
}

class FoodRecipeHome extends StatefulWidget {
  const FoodRecipeHome({Key? key}) : super(key: key);

  @override
  _FoodRecipeHomeState createState() => _FoodRecipeHomeState();
}

class _FoodRecipeHomeState extends State<FoodRecipeHome> {
  int _selectedIndex = 0;

  final List<Widget> _bottomBarScreens = <Widget>[
    Food(),
    Recipe(),
    Explore(),
    WishList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: _bottomBarScreens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: _bottomNavIconOnTap,
        index: _selectedIndex,
      ),
    );
  }

  _bottomNavIconOnTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class BottomNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  BottomNavBar({Key? key, required this.onTap, required this.index})
      : super(key: key);

  final List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      activeIcon: ActiveNavBarIcon(
        icon: Icons.restaurant,
      ),
      icon: Icon(Icons.restaurant),
      label: 'Food',
    ),
    BottomNavigationBarItem(
      activeIcon: ActiveNavBarIcon(
        icon: CupertinoIcons.book,
      ),
      icon: Icon(CupertinoIcons.book),
      label: 'recipes',
    ),
    BottomNavigationBarItem(
      activeIcon: ActiveNavBarIcon(
        icon: Icons.search,
      ),
      icon: Icon(Icons.search),
      label: 'explore',
    ),
    BottomNavigationBarItem(
      activeIcon: ActiveNavBarIcon(
        icon: Icons.favorite_border,
      ),
      icon: Icon(Icons.favorite_border),
      label: 'wishlist',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      unselectedItemColor: Color(0xFFc1c0c4),
      showUnselectedLabels: true,
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      currentIndex: this.index,
      onTap: this.onTap,
    );
  }
}

class ActiveNavBarIcon extends StatelessWidget {
  final IconData icon;
  const ActiveNavBarIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon),
        SizedBox(
          height: 1,
        ),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          padding: EdgeInsets.only(bottom: 5),
        )
      ],
    );
  }
}
