import 'package:farmkenya/screens/Pages/GoogleMaps/MapScreen.dart';
import 'package:farmkenya/screens/Pages/OrganicProduct/OrganicProductsScreen.dart';
import 'package:farmkenya/screens/Pages/product/ProductsScreen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons
import 'package:colorful_iconify_flutter/icons/emojione.dart'; // for Colorful Icons
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/tabler.dart';


class LandingPageScreen extends StatefulWidget {
  static var screenHeight;
  static int landingPageIndex = 0;
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();


}

class _LandingPageScreenState extends State<LandingPageScreen> {

  PageController pageController =
  PageController(initialPage: LandingPageScreen.landingPageIndex);

  int _selectedIndex = LandingPageScreen.landingPageIndex;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ), Text(
      'Index 4: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    OrganicProductsScreen.screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorLight,
    title: FittedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container( height: size.height * 0.04,
            child: Image.asset("assets/images/logo.webp")),
        Text("Products",textAlign:TextAlign.end,style:TextStyle(color: Colors.black,) ,),
      ],
    ),
    ),
        ),
    body:PageView(
    physics: const NeverScrollableScrollPhysics(),
    controller: pageController,
    onPageChanged: (index) {
    setState(() {
    _selectedIndex = index;
    });
    },
    children:const [
    ProductsScreen(),
    OrganicProductsScreen(),
     MapScreen(),
      OrganicProductsScreen(),
      OrganicProductsScreen(),
    // ProductsScreen(),
    // ProductsScreen(),
    // ProductsScreen(),

    ],
    ),

    bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Iconify(Mdi.barn,),
    label: 'Farm',
    backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
    icon: Iconify(Ic.round_compost,color: Colors.white,) ,// widget
    label: 'Organic',
    backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
    icon: Iconify(Mdi.map_marker_multiple_outline,color: Colors.white,),// widget
    label: 'near you',
    backgroundColor: Colors.green,

    ),
    BottomNavigationBarItem(
    icon: Iconify(Mdi.bell_badge_outline), // widget
    label: 'Notifications',
    backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
    icon: Iconify(Mdi.account_cowboy_hat_outline,color: Colors.white,), // widget
    label: 'My Farm',
    backgroundColor: Colors.green,
    ),

    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.white,
      onTap: (newIndex) {
        pageController.animateToPage(newIndex,
            duration: Duration(milliseconds: 10),
            curve: Curves.easeInOut);
      },
    //
    // onTap:
    // _onItemTapped
    // ,
    )
    ,
    );
  }
}
