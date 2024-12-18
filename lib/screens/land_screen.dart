import 'package:flutter/material.dart';
import 'package:outer_pos_app/screens/cart_screen.dart';
import 'package:outer_pos_app/screens/home_screen.dart';
import 'package:outer_pos_app/components/indicator.dart';
import '../data/services/auth_service.dart';


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
    const CartScreen(),
    const LoadingIndicatorsShowcase(),
    //const ScanPage()
    //CartPage(),
  ];

  Future<void> _logout(BuildContext context) async {
    await _authService.logout();
    Navigator.pushReplacementNamed(context, '/loginPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OuterPos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.person_2_rounded, color: Colors.white),
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
          indicatorColor: Colors.blue, // Background color for selected item
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                    color: Colors.white); // Active icon color
              }
              return const IconThemeData(
                  color: Colors.blue); // Inactive icon color
            },
          ),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Active label color
                );
              }
              return const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black, // Inactive label color
              );
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: _navigateBottomBar,
          height: 60,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined), // Outlined icon
              selectedIcon: Icon(Icons.home), // Bold icon
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline), // Outlined icon
              selectedIcon: Icon(Icons.add_circle), // Bold icon
              label: 'Add Product',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined), // Outlined icon
              selectedIcon: Icon(Icons.bar_chart), // Bold icon
              label: 'Reports',
            ),
          ],
        ),
      ),
    );
  }
}
