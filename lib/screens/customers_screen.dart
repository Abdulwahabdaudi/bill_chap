import 'package:flutter/material.dart';

// Customer model
class Customer {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String registrationDate;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.registrationDate,
  });
}

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomersScreen> {
  // Dummy customer data (replace with your actual data source)
  final List<Customer> customers = [
    Customer(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '+1 (555) 123-4567',
      registrationDate: '2023-05-15',
    ),
    Customer(
      id: '2',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '+1 (555) 987-6543',
      registrationDate: '2023-06-20',
    ),
    // Add more customers
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customer Management', 
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddCustomerBottomSheet,
            tooltip: 'Add New Customer',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshCustomers,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search customers...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: _filterCustomers,
              ),
              const SizedBox(height: 16),
              
              // Customer List
              Expanded(
                child: ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    final customer = customers[index];
                    return _buildCustomerCard(customer);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerCard(Customer customer) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          customer.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              customer.email,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              customer.phoneNumber,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _editCustomer(customer),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteCustomer(customer),
            ),
          ],
        ),
      ),
    );
  }

  // Placeholder methods (implement your actual logic)
  void _showAddCustomerBottomSheet() {
    // Implement bottom sheet for adding a new customer
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New Customer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add form fields for new customer
            ],
          ),
        );
      },
    );
  }

  void _filterCustomers(String query) {
    // Implement customer filtering logic
  }

  Future<void> _refreshCustomers() async {
    // Implement customer list refresh logic
    await Future.delayed(const Duration(seconds: 2));
  }

  void _editCustomer(Customer customer) {
    // Implement customer edit logic
  }

  void _deleteCustomer(Customer customer) {
    // Implement customer deletion logic
  }
}

