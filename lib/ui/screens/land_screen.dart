import 'package:flutter/material.dart';
import 'package:outer_pos_app/ui/screens/cart_screen.dart';
import 'package:outer_pos_app/ui/screens/home_screen.dart';
import 'package:outer_pos_app/ui/screens/scan_screen.dart';
import '../../data/services/auth_service.dart';


class LandScreen extends StatefulWidget {
  const LandScreen({super.key});

  @override
  State<LandScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandScreen> {
  final _authService = AuthService();
  int _index = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _index = index;
    });
  }

  final List _pages = [
     const HomeScreen(),
     CartScreen(),
   ScanScreen()

  ];

  Future<void> _logout(BuildContext context) async {
    await _authService.logout();
    Navigator.pushReplacementNamed(context, '/loginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Bill CHAP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        //backgroundColor: Colors.blue[700],
         actions: [
           PopupMenuButton<String>(
             icon:  Icon(Icons.person_2_rounded, color: Theme.of(context).colorScheme.primary),
             onSelected: (value) {
               if (value == 'logout') {
                 _logout(context);
               }
             },
             itemBuilder: (BuildContext context) {
               return [
                 const PopupMenuItem(
                   value: 'profile',
                   child: ListTile(
                     leading: Icon(Icons.person),
                     title: Text('Profile'),
                   ),
                 ),
                 const PopupMenuItem(
                   value: 'logout',
                   child: ListTile(
                     leading: Icon(Icons.logout),
                     title: Text('Logout'),
                   ),
                 ),
               ];
             },
           ),
         ],
       ),
      body: _pages[_index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Theme.of(context).colorScheme.primary, // Background color for selected item
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                    color: Colors.white); // Active icon color
              }
              return  IconThemeData(
                  color: Theme.of(context).colorScheme.primary); // Inactive icon color
            },
          ),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary, // Active label color
                );
              }
              return const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Inactive label color
              );
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: _navigateBottomBar,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined), // Outlined icon
              selectedIcon: Icon(Icons.home), // Bold icon
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline), // Outlined icon
              selectedIcon: Icon(Icons.add_circle), // Bold icon
              label: 'Add Stock',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_outlined), // Outlined icon
              selectedIcon: Icon(Icons.menu), // Bold icon
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
