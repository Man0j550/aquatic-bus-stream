import 'package:flutter/material.dart';
import '../acc/LoginPage.dart';
import 'Mainpagee.dart';
import 'Profilepagee.dart';
import 'about.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Mainpage(),
    ProfilePage(),
    const Text('Booking Page'),
    AboutPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selecting an item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text(
          'Aquatic Stream Bus',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: const IconThemeData(color: Colors.white), // Set drawer icon color
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )
              )
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white)
              ),
              leading: const Icon(
                Icons.home,
                color: Colors.white
              ),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0)
            ),
            ListTile(
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.white)
              ),
              leading: const Icon(
                Icons.account_circle,
                color: Colors.white
              ),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1)
            ),
            ListTile(
              title: const Text(
                'Booking',
                style: TextStyle(color: Colors.white)
              ),
              leading: const Icon(
                Icons.book,
                color: Colors.white
              ),
              selected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2)
            ),
            ListTile(
              title: const Text(
                'About App',
                style: TextStyle(color: Colors.white)
              ),
              leading: const Icon(
                Icons.info,
                color: Colors.white
              ),
              selected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3)
            ),
            const Divider(
              color: Colors.white
            ),
            ListTile(
              title: const Row(
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.white)
                  ),
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white
                  )
                ]
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage())
                );
              }
            )
          ]
        )
      )
    );
  }
}
