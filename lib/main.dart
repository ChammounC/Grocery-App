import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/provider/providers/cartItemCount.dart';
import 'package:theharmony/screens/splash.dart';
import 'package:theharmony/widgets/customNavbar/floating_navbar.dart';
import 'package:theharmony/widgets/customNavbar/floating_navbar_item.dart';
import 'screens/homeScreen.dart';
import 'screens/productsScreen.dart';
import 'screens/referScreen.dart';
import 'screens/moreScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 767),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ListenableProvider<CartItem>(create: (_)=>CartItem()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const SplashPage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pages = <Widget>[
    HomeScreen(),
    ProductScreen(),
    // MemberScreen(),
    ReferScreen(),
    MoreScreen()
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingNavbar(
          onTap: _selectPage,
          currentIndex: _selectedIndex,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(
                icon: Icons.category_outlined, title: 'Products'),
            FloatingNavbarItem(
                icon: Icons.person_add_alt_1_outlined, title: 'Refer'),
            FloatingNavbarItem(icon: Icons.settings, title: 'More'),
          ],
        ),
      ),
      // BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.category_outlined),
      //       label: 'Products',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Member',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_add_alt_1_outlined),
      //       label: 'Refer',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'More',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   unselectedItemColor: Colors.black,
      //   selectedItemColor: AppColors.PRIMARY_COLOR,
      //   showUnselectedLabels: true,
      //   onTap: _selectPage,
      // ),
    );
  }
}
