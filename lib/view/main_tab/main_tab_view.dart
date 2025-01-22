import 'package:book_grocer/common/color_extenstion.dart';
import 'package:flutter/material.dart';

import '../account/account_view.dart';
import '../home/home_view.dart';
import '../our_book/out_books_view.dart';
import '../search/search_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: TColor.dColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(media.width * 0.7),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black54, blurRadius: 15)
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuArr.map((mObj) {
                      var index = menuArr.indexOf(mObj);
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: selectMenu == index
                            ? BoxDecoration(color: TColor.primary, boxShadow: [
                                BoxShadow(
                                    color: TColor.primary,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ])
                            : null,
                        child: GestureDetector(
                          onTap: () {
                            if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OurBooksView()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 7) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountView()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            }
                            setState(() {
                              selectMenu = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mObj["name"].toString(),
                                style: TextStyle(
                                    color: selectMenu == index
                                        ? Colors.white
                                        : TColor.text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                mObj["icon"] as IconData? ?? Icons.home,
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.primary,
                                size: 33,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: TColor.subTitle,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(controller: controller, children: [
        const HomeView(),
        const SearchView(),
        const WishlistView(), // Updated Wishlist tab
        Container(),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: TColor.primary,
        child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.menu),
                text: "Books",
              ),
              Tab(
                icon: Icon(Icons.shopping_bag),
                text: "Cart",
              ),
            ]),
      ),
    );
  }
}

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> books = [
      {
        "title": "The Girl In The Woods",
        "author": "Robert T. Kiyosaki",
        "price": "Rs.1250",
        "image": "assets/img/1.jpg"
      },
      {
        "title": "The Red House",
        "author": "Benjamin Graham",
        "price": "Rs.1500",
        "image": "assets/img/2.jpg"
      },
      {
        "title": "The Young Wizard",
        "author": "James Clear",
        "price": "Rs.800",
        "image": "assets/img/3.jpg"
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          var book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    book["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    book["author"]!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    book["image"]!,
                    width: double.infinity,
                    height: 550,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        book["price"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle add to cart functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColor.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Add to Cart"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
