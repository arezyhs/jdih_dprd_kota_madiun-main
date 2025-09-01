import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'beranda_page.dart';
import 'profil_page.dart';
import 'berita_page.dart';
import 'produk_hukum_page.dart';
import 'monografi_page.dart';
import 'kontak_page.dart';

class MainMenu extends StatefulWidget {
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final List<Map<String, String>> menuData = [
    {'name': 'BERANDA', 'icon': 'assets/img/beranda.png'},
    {'name': 'PROFIL', 'icon': 'assets/img/profil.png'},
    {'name': 'BERITA', 'icon': 'assets/img/berita.png'},
    {'name': 'PRODUK', 'icon': 'assets/img/produkhukum.png'},
    {'name': 'MONOGRAF', 'icon': 'assets/img/propemperda.png'},
    {'name': 'KONTAK', 'icon': 'assets/img/bankumaskin.png'},
  ];

  int _selectedIndex = 0;

  List<Widget> get _pages => [
        BerandaPage(),
        ProfilPage(),
        BeritaPage(),
        ProdukHukumPage(),
        MonografiPage(),
        KontakPage(),
      ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        } else {
          bool exit = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Konfirmasi'),
              content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Keluar'),
                ),
              ],
            ),
          );
          return exit ?? false;
        }
      },
      child: Scaffold(
        // AppBar dihapus, header langsung dari web
        body: SafeArea(
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 255, 175, 54),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle:
              TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 11),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: List.generate(menuData.length, (index) {
            return BottomNavigationBarItem(
              icon: Image.asset(
                menuData[index]['icon']!,
                width: 28,
                height: 28,
              ),
              label: menuData[index]['name'],
            );
          }),
        ),
      ),
    );
  }
}
