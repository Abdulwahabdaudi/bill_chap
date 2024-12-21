import 'package:flutter/material.dart';
import 'package:outer_pos_app/helpers/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    Map<String, String> userData = await getUserData();
    setState(() {
      username = userData['name']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome $username !',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Card with Gradient Header
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        // Gradient Header
                        Container(
                          width: double.infinity,
                          height: 150,
                          padding: const EdgeInsets.all(16.0),
                          decoration:  BoxDecoration(
                            // gradient: LinearGradient(
                            //   colors: [Colors.blue, Colors.blueAccent],
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.bottomRight,
                            // ),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Empowering your business,",
                                style: TextStyle(
                                  fontSize: 18,
                                  color:  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                "Bill Faster!",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color:  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Quick Action Buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickActionButton('Sales', Icons.point_of_sale_outlined,
                      Colors.green, '/salesScreen'),
                  _buildQuickActionButton(
                      'Products',
                      Icons.inventory_2_outlined,
                      Colors.orange,
                      '/productScreen'),
                  _buildQuickActionButton('Customers', Icons.person_2_outlined,
                      Colors.purple, '/customerScreen'),
                ],
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cartScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_shopping_cart, color: Colors.white),
                      SizedBox(height: 4),
                      Text(
                        'Create New Bill',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Recent Transactions
              //   Text(
              //     'Recent Transactions',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   SizedBox(height: 10),
              //   _buildRecentTransactionsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              Icon(icon, color: Colors.blue[700], size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(
      String label, IconData icon, Color color, String screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, screen);
      },
      style: ElevatedButton.styleFrom(
        // backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      child: Column(
        children: [
          Icon(icon, color:  Theme.of(context).colorScheme.primary),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactionsList() {
    return Column(
      children: [
        _buildTransactionItem('John Doe', '\$45.67', '10:30 AM'),
        _buildTransactionItem('Coffee Shop', '\$32.50', '09:15 AM'),
        _buildTransactionItem('Retail Store', '\$87.22', '08:45 AM'),
      ],
    );
  }

  Widget _buildTransactionItem(String name, String amount, String time) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(name[0], style: TextStyle(color: Colors.blue[700])),
        ),
        title: Text(name),
        subtitle: Text(time),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

// Widget for Metrics
Widget _buildMetric(String label, String value, IconData icon) {
  return Row(
    children: [
      Icon(icon, color: Colors.blueAccent, size: 28),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          Text(
            value,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    ],
  );
}
