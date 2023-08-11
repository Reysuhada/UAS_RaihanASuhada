import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.brown),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/menu1': (context) => MenuPage(
              title: 'Haikyu',
              imageAsset: 'assets/images/menu1.png',
              description:
                  'Merupakan Sebuah Anime bertemakan Volly yang Mengajarkan Tentang Kerja keras dan perjuangan.',
            ),
        '/menu2': (context) => MenuPage(
              title: 'Kuroko No Basuke',
              imageAsset: 'assets/images/menu2.png',
              description:
                  'Merupakan Sebuah Anime Bertemakan Basket yang mengajarkan tentang arti dari menghargai seseorang.',
            ),
        '/menu3': (context) => MenuPage(
              title: 'blue Lock',
              imageAsset: 'assets/images/menu3.png',
              description:
                  'Merupakan Sebuah Anime Bertemakan Sepak Bola yang Mengajarkan tentang arti berjuang ditengah tengah kompetitif.',
            ),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Anda dapat menambahkan validasi username dan password di sini
                // Misalnya, jika berhasil, navigasikan ke halaman dashboard
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu1');
              },
              child: Text('Haikyu'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu2');
              },
              child: Text('Kuroko No Basuke'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu3');
              },
              child: Text('blue Lock'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String description;

  MenuPage({
    required this.title,
    required this.imageAsset,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            width: 150,
            height: 150,
          ),
          SizedBox(height: 16.0),
          Text(description, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
