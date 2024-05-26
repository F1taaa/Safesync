import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:safesync/pages/dashboarditem_pages/agencies_page.dart';
import 'package:safesync/pages/dashboarditem_pages/information_page.dart';
import 'package:safesync/pages/dashboarditem_pages/quickcall_page.dart';
import 'package:safesync/pages/dashboarditem_pages/reports_page.dart';
import 'package:safesync/pages/account_page.dart';
import 'package:safesync/pages/location.dart';
import 'package:safesync/pages/messages.dart';
import 'package:safesync/pages/notifications.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (_) => const Scaffold(body: MyHomePage()),
        '/account': (_) => const AccountDashboard(),
        '/agencies': (_) => AgenciesPage(),
        '/quickcall': (_) => const QuickCallPage(),
        '/information': (_) => InformationPage(),
        '/reports': (_) => ReportsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
    });
  }

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Dashboard(username: username,),
      const MessagesPage(),
      const NotificationsPage(),
      const LocationPage(),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color(0xFF1375E8),
      ),
      child: Scaffold(
        
        body: _widgetOptions.elementAt(_selectedIndex),
        
        bottomNavigationBar: Container(
          child: BottomNavigationBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.location),
              label: 'Locations',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFF1375E8),
          unselectedItemColor: Colors.black45,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {

  final String username;

  const Dashboard({Key? key, required this.username}) : super(key: key);

  Widget _buildDashboardItem(BuildContext context, String title, IconData iconData, Color background, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.black26
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _AppBar(username: username),
              _buildDashboardContainer(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildDashboardItem(context, 'Agencies', Icons.shield, Colors.deepOrange, '/agencies'),
          _buildDashboardItem(context, 'Quick Call', Icons.phone, Colors.green, '/quickcall'),
          _buildDashboardItem(context, 'Information', Icons.book, Colors.purple, '/information'),
          _buildDashboardItem(context, 'Reports', Icons.report, Colors.blue, '/reports'),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final String username;

  const _AppBar({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 40),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/account');
        },
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          title: Text('Welcome Back, $username', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          trailing: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black12,
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 55,
            ),
          ),
        ),
      ),
    );
  }
}