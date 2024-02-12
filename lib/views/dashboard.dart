import 'package:flutter/material.dart';
import 'package:flutter_project/views/about.dart';
import 'package:flutter_project/views/home.dart';
import 'package:flutter_project/views/profile.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({super.key, required this.title});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final String titleMenu;
  late final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Elon Musk"),
              accountEmail: Text("elon@gmail.com"),
              currentAccountPicture: CircleAvatar(
                // child: Icon(Icons.android),
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/0/08/Elon_Musk_at_a_Press_Conference.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Dashboard"),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DashboardPage(title: "Dashboard Page"),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text("About Page"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(title: "About Page"),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile Page"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const AboutPage(title: "Profile Page"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: [
            CardWidget(
              titleMenu: 'RESTful API',
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(title: "RESTful API"),
                  ),
                );
                debugPrint("Dashboard Page");
              },
            ),
            CardWidget(
              titleMenu: 'About Page',
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(title: "About Page"),
                  ),
                );
                debugPrint("About Page");
              },
            ),
            CardWidget(
              titleMenu: 'Profile Page',
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfilePage(title: "Profile Page"),
                  ),
                );
                debugPrint("Profile Page");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget CardWidget(
      {required String titleMenu, required GestureTapCallback onTap}) {
    return Card(
      elevation: 20.0,
      color: Colors.red,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            titleMenu,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
