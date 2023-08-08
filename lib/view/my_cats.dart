import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/data_models.dart';
import 'package:tech_blog/models/fake_data.dart';
import '../my_colors.dart';
import 'my_componet.dart';

import '../my_strings.dart';

class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();

  static void add(HashTagModel hashTagModel) {}
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    var textTheme = Theme.of(context).textTheme;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.images.tcbot,
                      height: 100,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      MyStrings.successfulRegistration,
                      style: textTheme.headline4,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "نام و نام خانوادگی",
                          hintStyle: textTheme.headline4),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      MyStrings.chooseCats,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: GridView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: tagList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 0.3),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                  onTap: (() {

                                    setState(() {

                                      selectedTags.add(tagList[index]);
                                    });
                                  }),
                                  child: MainTags(
                                      textTheme: textTheme, index: index));
                            })),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      Assets.icons.downCatArrow.path,
                      scale: 3,
                    ),


                    //selected tags
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: GridView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: selectedTags.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 0.2),
                            itemBuilder: ((context, index) {
                              return Container(
                                
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      color: SolidColors.surface),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                        
                                          selectedTags[index].title,
                                          style: textTheme.headline4,
                                        ),
                                        
                                        InkWell(
                                          onTap: ((){

                                        setState(() {
                                          selectedTags.removeAt(index);
                                        });

                                          }),

                                          
                                          
                                          child: Icon(CupertinoIcons.delete, color: Colors.grey,)),

                                      ],
                                    ),
                                  ));
                            })),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
