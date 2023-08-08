import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';
import 'my_componet.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: [
            homePagePoster(size: size, textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            homePageTageList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            seeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
            homePageBlog(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            seeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            homePagePoscast(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class homePagePoscast extends StatelessWidget {
  const homePagePoscast({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            /// blog item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 2.4,
                      height: size.height / 5.4,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: GradientColors.blogPost)),
                        ),
                        Row(
                          children: [
                            Positioned(
                              right: 0,
                              top: 8,
                              bottom: 8,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: textTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogList[index].views,
                                          style: textTheme.subtitle1,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        blogList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          })),
    );
  }
}

class seeMorePodcast extends StatelessWidget {
  const seeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphon.provider(),
            color: SolidColors.seeMore,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class homePageBlog extends StatelessWidget {
  const homePageBlog({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            /// blog item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 2.4,
                      height: size.height / 5.4,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: GradientColors.blogPost)),
                        ),
                        Row(
                          children: [
                            Positioned(
                              right: 0,
                              top: 8,
                              bottom: 8,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: textTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogList[index].views,
                                          style: textTheme.subtitle1,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        blogList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          })),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.provider(),
            color: SolidColors.seeMore,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class homePageTageList extends StatelessWidget {
  const homePageTageList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(textTheme: textTheme, index: index,
            ));
          })),
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.textTheme,
     required this.index,
  });

  final TextTheme textTheme;
    var index;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(
                Assets.icons.hashtagicon.provider(),
                size: 10,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                tagList[index].title,
                style: textTheme.headline2,
              )
            ],
          ),
        ));
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 8,
        ),
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(HomePagePosterMap["imageAsset"]),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        Positioned(
          bottom: 8,
          right: 0,
          top: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text(HomePagePosterMap["wirter"]+" - "+HomePagePosterMap["date"], style: textTheme.subtitle1,),
                  Row(
                    children: [
                      Text(
                        HomePagePosterMap["view"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),

                  Text(
                    HomePagePosterMap["title"],
                    style: textTheme.headline1,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
