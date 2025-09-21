import 'package:flutter/material.dart';
import 'package:twitter_z/pages/chathome_page.dart';
import 'package:twitter_z/pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/search_page.dart';
import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';
import 'my_drawer_tile.dart';

/*

DRAWER

This is a menu drawer which is usually access on the left side of the app bar

--------------------------------------------------------------------------------

Contains 5 menu options:

- Home
- Profile
- Search
- Settings
- Logout

*/

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  // access auth service
  final _auth = AuthService();

  // logout
  void logout() {
    _auth.logout();
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // Drawer
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // app logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              // divider line
              Divider(color: Theme.of(context).colorScheme.secondary),

              const SizedBox(height: 10),

              // home list tile
              // MyDrawerTile(
              //   title: "H O M E",
              //   icon: Icons.home,
              //   onTap: () {
              //     // pop menu drawer since we are already at home
              //     Navigator.pop(context);
              //   },
              // ),

              MyDrawerTile(
                title: "H O M E",
                icon: Icons.home,
                onTap: () {
                  // pop menu drawer since we are already at home
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  HomePage(),
                    ),
                  );
                },
              ),

              MyDrawerTile(
                title: "C H A T",
                icon: Icons.chat,
                onTap: () {
                  // pop menu drawer since we are already at home
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ChatHomePage(),
                    ),
                  );
                },
              ),

              // profile list tile
              MyDrawerTile(
                title: "P R O F I L E",
                icon: Icons.person,
                onTap: () {
                  // pop menu drawer
                  Navigator.pop(context);

                  // go to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(uid: _auth.getCurrentUid()),
                    ),
                  );
                },
              ),

              // search list tile
              MyDrawerTile(
                title: "S E A R C H",
                icon: Icons.search,
                onTap: () {
                  // pop menu drawer
                  Navigator.pop(context);

                  // go to search page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
              ),

              // settings list tile
              MyDrawerTile(
                title: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () {
                  // pop menu drawer
                  Navigator.pop(context);

                  // go to settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // logout list tile
              MyDrawerTile(
                title: "L O G O U T",
                icon: Icons.logout,
                onTap: logout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
