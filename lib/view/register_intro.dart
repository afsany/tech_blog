import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';
import 'package:validators/validators.dart';

import 'my_cats.dart';

class RegisterIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.images.tcbot,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcom, style: textTheme.headline4)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: () {
                _showEmailButtomSheet(context, size, textTheme);
              },
              child: const Text("بزن بریم"),
            ),
          )
        ]),
      ),
    ));
  }

  Future<dynamic> _showEmailButtomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYourEmail,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        onChanged: (value) {
                          print(
                              value + " is Email " + isEmail(value).toString());
                        },
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "afsany@gamil.com",
                            hintStyle: textTheme.headline5),
                      ),
                    ),
                    ElevatedButton(onPressed: (() {
                      Navigator.pop(context);
                    _activateCodeButtomSheet(context, size, textTheme);
                    }), child: Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<dynamic> _activateCodeButtomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.activateCode,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        onChanged: (value) {
                         
                          print(value + " is Email :  "+ isEmail(value).toString());
                         
                        },
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "******",
                            hintStyle: textTheme.headline5),
                      ),
                    ),
                    ElevatedButton(onPressed: (() {

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyCats()));
                    }), child: Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
