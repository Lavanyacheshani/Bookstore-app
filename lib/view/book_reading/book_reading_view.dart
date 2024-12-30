import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extenstion.dart';

class BookReadingView extends StatefulWidget {
  final Map bObj;
  const BookReadingView({super.key, required this.bObj});

  @override
  State<BookReadingView> createState() => _BookReadingViewState();
}

class _BookReadingViewState extends State<BookReadingView> {
  double fontSize = 20;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  isDark ? Colors.black : Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                widget.bObj["name"].toString(),
                style: TextStyle(
                    color:  isDark ? Colors.white : TColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TColor.primary,
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Switch(
                      activeColor: TColor.primary,
                      value: isDark , onChanged:(value) {
                        setState(() {
                          isDark = value;
                        });
                    },),

                    Text("Dark ", style: TextStyle(color: isDark ? Colors.white : TColor.text , fontWeight: FontWeight.bold ), ),

                    

                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          isScrollControlled: true,
                          builder: (context) {
                            var orientation = MediaQuery.of(context).orientation;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: orientation == Orientation.portrait
                                      ? 25
                                      : 60),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: TColor.text,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.text_decrease,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                              updateUi();
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.text_increase,
                                        color: TColor.text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: TColor.textbox,
                                        border: Border.all(
                                            color: Colors.black26, width: 0.5),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: const Text("Font"),
                                      underline: Container(),
                                      items: ["Font1", "Font2"].map((name) {
                                        return DropdownMenuItem(
                                          value: name,
                                          child: Text(name),
                                        );
                                      }).toList(),
                                      onChanged: (selectVal) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations([
                                            DeviceOrientation.portraitDown,
                                            DeviceOrientation.portraitUp
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.portrait
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_portrait,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations([
                                            DeviceOrientation.landscapeLeft,
                                            DeviceOrientation.landscapeRight
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.landscape
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_landscape,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.settings,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            )
          ];
        },
       
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: SelectableText(
              """
In a quiet corner of the bustling city of Colombo, five teenagers formed an unbreakable bond over their love for adventure and their hunger for justice. Aarav, the sharp-witted leader; Meera, the fearless strategist; Ruwan, the tech genius; Priya, the empathetic healer; and Kavi, the spirited fighter, called themselves “The Gang.”

The Gang’s headquarters was an abandoned bookshop on Lotus Lane, a place steeped in mystery. It was here, while exploring the dusty shelves, they discovered an ancient, leather-bound book simply titled Gang.

The book was no ordinary tome. Its pages chronicled the escapades of a legendary group of vigilantes who once roamed the city centuries ago, righting wrongs and protecting the powerless. As they read, the Gang realized they weren’t just spectators; the book was alive, its stories shifting and growing with their actions.

Inspired, they took up the mantle of the book’s previous heroes. Their first mission: to expose a corrupt businessman exploiting a nearby community. Using Meera’s plans, Ruwan’s gadgets, and their unyielding teamwork, they gathered evidence, leaked it online, and brought the culprit to justice.

But the book had a secret of its own. Each success came with a price—the Gang found themselves entangled in a deeper conspiracy, one that connected them to the book's original owners and a centuries-old battle for justice.

As the Gang uncovered more truths, they realized their fight wasn’t just about the city but about keeping the legacy of Gang alive.
""",
              style: TextStyle(color: isDark ? Colors.white : TColor.text, fontSize: fontSize),
            ),
          ),
      ),
    );
  }

  void updateUi(){
    setState(() {
      
    });
  }
}
