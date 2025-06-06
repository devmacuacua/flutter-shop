import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/custom_drawer/custom_drawer.dart';
import 'package:store/models/page_manager.dart';
import 'package:store/screens/login/login_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context){
     return Provider(
       create: (_) => PageManager(pageController) ,
       child: PageView(
        controller:pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget> [
          LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home2'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home3'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home4'),
            ),
          ),
          Container(color: Colors.red,),
          Container(color: Colors.yellow,),
          Container(color: Colors.green,)
        ],
    ),
     );
  }
}