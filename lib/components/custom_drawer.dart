import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import '../screens/settings_page.dart';
import '../services/auth/auth_service.dart';
import 'custom_drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout() async{
    //Get auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //App logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),
          //Home list tile
          CustomDrawerTile(
            title: 'H O M E',
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          //Settings list tile
          CustomDrawerTile(
            title: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),

          const Spacer(),
          //Logout
          CustomDrawerTile(
            title: 'L O G O U T',
            icon: Icons.logout,
            onTap: logout,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
