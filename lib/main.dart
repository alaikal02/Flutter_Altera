import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 62, 62, 62),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    ContactScreen(),
    SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
              ),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {'name': 'William Core', 'phone': '+62 812 3456 7890'},
      {'name': 'Tom Odell', 'phone': '+62 812 9876 5432'},
      {'name': 'David Garret', 'phone': '+62 812 1111 2222'},
      {'name': 'Nick Strand', 'phone': '+62 811 2222 3333'},
      {'name': 'Alice Steelheart', 'phone': '+62 811 2233 4433'},
      {'name': 'Alex Carpenter', 'phone': '+62 811 3322 3333'},
      {'name': 'James Arthur', 'phone': '+62 811 2332 3333'},
      {'name': 'Ina Wroldsen', 'phone': '+62 811 3232 3333'},
      {'name': 'Lana Del Rey', 'phone': '+62 811 2323 3333'},
      {'name': 'Vian Izak', 'phone': '+62 811 2333 3333'},
      {'name': 'Dean Lewis', 'phone': '+62 811 2222 3222'},
      {'name': 'Axel Johansson', 'phone': '+62 811 2223 3333'},
      {'name': 'Trevor Daniel', 'phone': '+62 811 2322 3333'},
      {'name': 'Bill Conti', 'phone': '+62 811 3332 3333'},
      {'name': 'Isak Danielson', 'phone': '+62 811 2222 3232'},
    ];

    contacts.sort((a, b) => a['name']!.compareTo(b['name']!));

    return ListView(
      children: contacts.map((contact) {
        return ContactItem(
          name: contact['name']!,
          phone: contact['phone']!,
        );
      }).toList(),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final String phone;

  const ContactItem({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: Text(
              name[0],
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                phone,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Press the drawer to see settings'),
    );
  }
}
