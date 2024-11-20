import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Layout'),
        centerTitle: true,
      ),
     backgroundColor: const Color.fromARGB(255, 209, 142, 137),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2,
          ),
          itemCount: dashboardItems.length,
          itemBuilder: (context, index) {
            final item = dashboardItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: item.color,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, size: 48, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;

  DashboardItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
  });
}

final List<DashboardItem> dashboardItems = [
  DashboardItem(
    title: 'Statistics',
    subtitle: 'View detailed stats',
    description: 'Track your performance and view detailed analytics.',
    icon: Icons.bar_chart,
    color: Colors.blue,
  ),
  DashboardItem(
    title: 'Notifications',
    subtitle: 'View recent updates',
    description: 'Stay updated with the latest notifications and alerts.',
    icon: Icons.notifications,
    color: Colors.red,
  ),
  DashboardItem(
    title: 'Messages',
    subtitle: 'Check your inbox',
    description: 'Read and respond to messages from your connections.',
    icon: Icons.message,
    color: Colors.green,
  ),
  DashboardItem(
    title: 'Settings',
    subtitle: 'Adjust preferences',
    description: 'Modify your account and application preferences.',
    icon: Icons.settings,
    color: Colors.purple,
  ),
  DashboardItem(
    title: 'Profile',
    subtitle: 'View your account',
    description: 'Manage your profile information and settings.',
    icon: Icons.person,
    color: Colors.orange,
  ),
  DashboardItem(
    title: 'Help',
    subtitle: 'Get assistance',
    description: 'Find FAQs or contact support for further assistance.',
    icon: Icons.help,
    color: Colors.teal,
  ),
];

class DetailScreen extends StatelessWidget {
  final DashboardItem item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(item.icon, size: 48, color: item.color),
                const SizedBox(width: 16),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: item.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              item.subtitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}