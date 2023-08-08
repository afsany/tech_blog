import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_strings.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/profil_screen.dart';
import '../models/fake_data.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {

  @override

  State<MainScreen> createState() => _MainScreenState();
}
final GlobalKey<ScaffoldState> _key = GlobalKey();


class _MainScreenState extends State<MainScreen> {

  var selectedPageIndex = 0;

  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    


    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding:  EdgeInsets.only(top: bodyMargin, left: bodyMargin),
            child: ListView(children: [
            DrawerHeader(child: 
            Center(child: Image.asset(Assets.images.logo.path, scale: 3,),)
            ),
            ListTile(
              title: Text("پروفایل کاربری", style: textTheme.headline4,),
              onTap: () {
                
              },
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),


            ListTile(
              title: Text("درباره تک بلاگ", style: textTheme.headline4,),
              onTap: () {
                
              },
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),


            ListTile(
              title: Text("اشتراک گذاری تک بلاگ", style: textTheme.headline4,),
              onTap: () {
                
              },
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),
          
          
            
            ListTile(
              title: Text("تک بلاگ در گیت هاب", style: textTheme.headline4,),
              onTap: () {
                
              },
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),
          
          
            ]
            ),
          ),
        ),
      
        
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title:
              //appbar
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: ((){
                   _key.currentState!.openDrawer();
                }), 
                  
                
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                Assets.images.logo.path,
                height: size.height / 13.6,
              ),
              const Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Positioned.fill(
                child: IndexedStack(
                  index: 0,
                  children: [
                  homeScreen(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
                  profilScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin)
                  ],
                )
              ),
            ),
            BottomNav(size: size, bodyMargin: bodyMargin,
            changeScreen: (int value){

                 setState(() {
                   selectedPageIndex = value;
                 });
            },

            ),
          ],
        ),
        
      
    
      ),
    
      
    );
  
    
  }
}



class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: GradientColors.bottomNav,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (()=> changeScreen(0)) ,
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (()=>changeScreen(1)) ,
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
