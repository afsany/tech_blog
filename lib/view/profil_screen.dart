import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';
import 'my_componet.dart';



class profilScreen extends StatelessWidget {




  const profilScreen ({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        Image.asset(Assets.images.profileAvatar.path, 
        height: 100,
        ),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(Assets.icons.bluePen.provider(),
            color: SolidColors.seeMore,
            ),
        const SizedBox(width: 8,),
        Text(
          MyStrings.imageProfileEdit,
          style: textTheme.headline3 ,
        )




          ],
        ),
        const SizedBox(height: 60,),
        Text("احمد فیروز بخت", style: textTheme.headline4,),
        Text("afsany@gmail.com", style: textTheme.headline4,),
        const SizedBox(height: 40,),
        techDivider(size: size),
        InkWell(onTap: ((){

        }),
        splashColor: SolidColors.primaryColor,
        child: SizedBox(
          height: 45,
          child: Center(
            child: Text(MyStrings.myFavBlog,
            style: textTheme.headline4,
            ),
          ),
        ),
        
        ),
        techDivider(size: size),
        InkWell(onTap: ((){

        }),
        splashColor: SolidColors.primaryColor,
        child: SizedBox(
          height: 45,
          child: Center(
            child: Text(MyStrings.myFavPodcast,
            style: textTheme.headline4,
            ),
          ),
        ),
        
        ),
        techDivider(size: size),
        InkWell(onTap: ((){

        }),
        splashColor: SolidColors.primaryColor,
        child: SizedBox(
          height: 45,
          child: Center(
            child: Text(MyStrings.logOut,
            style: textTheme.headline4,
            ),
          ),
        ),
        
        ),
        const SizedBox(height: 60,)
        
      ],)
      
      );
  }
}

