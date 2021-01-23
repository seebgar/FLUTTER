import 'package:flutter/material.dart';
import 'package:meals_all/widgets/categories.dart';
import 'package:meals_all/widgets/favorites.dart';
import 'package:meals_all/widgets/main-drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

// **** TABS IN FOOTER
class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    Favorites(),
  ];

  int _selectedPage = 0;

  void _setPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      // ** drawer menu side
      drawer: MainDrawer(),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: "Favorites",
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

// **** TABS IN APP BAR HEADER
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "Categories",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "Favorites",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             Favorites(),
//           ],
//         ),
//       ),
//     );
//   }
// }
