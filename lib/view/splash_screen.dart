import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/view/main_screen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/main.dart';


class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainScreen()));
    });



    super.initState();
  }
    




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          
        Image.asset(Assets.images.logo.path, height: 64,),
        SizedBox(height: 32,),
        SpinKitFadingCube(
          color: SolidColors.primaryColor,
          size: 32.0,
        )
        
        
        ]),),
    );
  }
}
    
  
  