import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/pages/custom-widgets/appbar_title.dart';
import 'package:pharmacy_system/pages/profile/profile.dart';

// ignore: must_be_immutable
class Account extends StatelessWidget {
  Coloring coloring = Coloring();
  Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppbar(pageName: "Account"),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.pushNamed(context,"/");
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [Icon(Icons.home, size: 30), Text("Home")],
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Go to Saved page'),
      //               duration: Duration(seconds: 1), // how long it shows
      //             ),
      //           );
      //           Navigator.pushNamed(context, '/SavedPage');
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.favorite_border, size: 30),
      //             Text("Saved"),
      //           ],
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Go to Cart page'),
      //               duration: Duration(seconds: 1), // how long it shows
      //             ),
      //           );
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.shopping_cart_outlined, size: 30),
      //             Text("Cart"),
      //           ],
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Don\'t go anywhere'),
      //               duration: Duration(seconds: 1), // how long it shows
      //             ),
      //           );
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.person_outline, color: coloring.p700, size: 30),
      //             Text("Account"),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: ListView(
          children: [
            _buildMenuItem(
              icon: Icons.person_outline,
              text: 'Your Profile',
              onTap: () {
                // Navigator.pushNamed(context,'/Profile');
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Profile()),
                    );
                },
            ),
            _buildMenuItem(
              icon: Icons.receipt_long_outlined,
              text: 'My Order',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.credit_card_outlined,
              text: 'Payment Methods',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.notifications_none_outlined,
              text: 'Notifications',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.lock_outline,
              text: 'Privacy Policy',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              text: 'Help Center',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.person_add_alt,
              text: 'Invite Friends',
              onTap: () {},
            ),
            // const Divider(),
            ListTile(
              leading: Icon(Icons.power_settings_new, color: Colors.red),
              title: Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                // handle logout
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.black54),
            title: Text(text),
            trailing: Icon(Icons.chevron_right),
            onTap: onTap,
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
