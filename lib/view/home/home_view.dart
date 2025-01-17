import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/book_reading/book_reading_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common_widget/best_seller_cell.dart';
import '../../common_widget/genres_cell.dart';
import '../../common_widget/recently_cell.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/top_picks_cell.dart';
import '../login/sign_up_view.dart';
import '../main_tab/main_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();

  final List<Map<String, dynamic>> topPicksArr = [
    {
      "name": "The Dissapearance of Emila Zola",
      "author": "Michael Rosen",
      "img": "assets/img/1.jpg"
    },
    {
      "name": "Fatherhood",
      "author": "Marcus Berkmann",
      "img": "assets/img/2.jpg"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Stride Lottie",
      "img": "assets/img/3.jpg"
    }
  ];

  final List<Map<String, dynamic>> bestArr = [
    {
      "name": "Fatherhood",
      "author": "by Christopher Wilson",
      "img": "assets/img/4.jpg",
      "rating": 5.0
    },
    {
      "name": "In A Land Of Paper Gods",
      "author": "by Rebecca Mackenzie",
      "img": "assets/img/5.jpg",
      "rating": 4.0
    },
    {
      "name": "Tattletale",
      "author": "by Sarah J. Noughton",
      "img": "assets/img/6.jpg",
      "rating": 3.0
    }
  ];

  final List<Map<String, String>> genresArr = [
    {"name": "Graphic Novels", "img": "assets/img/g1.png"},
    {"name": "Graphic Novels", "img": "assets/img/g1.png"},
    {"name": "Graphic Novels", "img": "assets/img/g1.png"}
  ];

  final List<Map<String, dynamic>> recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/img/10.jpg"
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/img/11.jpg"
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/img/12.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(media.width * 0.5),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: media.width * 0.1),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(
                        children: const [
                          Text(
                            "Our Top Picks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                          onPressed: () {
                            sideMenuScaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: const Icon(Icons.menu),
                        )
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex];
                          return TopPicksCell(iObj: iObj);
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    _buildSectionTitle("Bestsellers", TColor.text),
                    _buildHorizontalList(media.width * 0.9, bestArr,
                        (bObj) => BookReadingView(bObj: bObj)),
                    _buildSectionTitle("Genres", TColor.text),
                    _buildHorizontalList(media.width * 0.6, genresArr, null,
                        isGenre: true),
                    SizedBox(height: media.width * 0.1),
                    _buildSectionTitle("Recently Viewed", TColor.text),
                    _buildHorizontalList(media.width * 0.7, recentArr, null),
                    SizedBox(height: media.width * 0.1),
                    _buildSectionTitle("Monthly Newsletter", TColor.text),
                    _buildNewsletterSection(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHorizontalList(
      double height, List items, Widget Function(Map<String, dynamic>)? onTap,
      {bool isGenre = false}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          var bObj = items[index] as Map<String, dynamic>;
          return GestureDetector(
            onTap: onTap != null
                ? () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => onTap(bObj)))
                : null,
            child: isGenre
                ? GenresCell(
                    bObj: bObj,
                    bgcolor: index % 2 == 0 ? TColor.color1 : TColor.color2,
                  )
                : RecentlyCell(iObj: bObj),
          );
        },
      ),
    );
  }

  Widget _buildNewsletterSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: TColor.textbox.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Receive our monthly newsletter and receive updates on new stock, books, and the occasional promotion.",
            style: TextStyle(
              color: TColor.subTitle,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 15),
          RoundTextField(controller: txtName, hintText: "Name"),
          const SizedBox(height: 15),
          RoundTextField(controller: txtEmail, hintText: "Email Address"),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MiniRoundButton(
                title: "Sign Up",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpView()),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
