import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_navigation_provider.dart';
import '../controllers/home_navigation_controller.dart';
import '../widgets/dashboard_card.dart';

class ResidentHomeScreen extends ConsumerWidget {
  const ResidentHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.read(homeNavigationProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            _buildTitle(theme),
            _buildDashboardGrid(context, nav),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTopBar() {
    return Container(
      color: const Color(0xFF003F5C),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Liz Hopper',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Resident Services',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(Icons.account_circle, color: Color(0xFF003F5C)),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: Text(
        'Manage your housing',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDashboardGrid(
    BuildContext context,
    HomeNavigationController nav,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            DashboardCard(
              icon: Icons.build,
              label: 'Work Order',
              onTap: () => nav.goToWorkOrder(context),
            ),
            DashboardCard(
              icon: Icons.insert_drive_file,
              label: 'Recertification',
              onTap: () => nav.goToRecertification(context),
            ),
            DashboardCard(
              icon: Icons.assignment_turned_in,
              label: 'Inspection',
              onTap: () => nav.goToInspection(context),
            ),
            DashboardCard(
              icon: Icons.local_shipping,
              label: 'Package Delivery',
              onTap: () => nav.goToPackageDelivery(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: const Color(0xFF003F5C),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Activity'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
