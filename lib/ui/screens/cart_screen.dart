import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      initialIndex: 1, // Start with the "Cart" panel
      child: Scaffold(
        appBar: AppBar(
          title: Text('Billing field'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search), text: 'Search Product'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
              Tab(icon: Icon(Icons.qr_code_scanner), text: 'Scan Product'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Search Product Panel
            SearchProductPanel(),
            // Cart Panel
            CartPanel(),
            // Scan Product Panel
            ScanProductPanel(),
          ],
        ),
      ),
    );
  }
}

class SearchProductPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              // Search logic
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with product list count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Product ${index + 1}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Add to cart logic
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5, // Replace with cart item count
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Product Name'),
                subtitle: Text('Qty: 1 x Price: \$10.00'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove item logic
                  },
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$50.00',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Create bill logic
                },
                child: Text('Create Bill'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScanProductPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_scanner, size: 100),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Scan product logic
            },
            child: Text('Start Scanning'),
          ),
        ],
      ),
    );
  }
}
