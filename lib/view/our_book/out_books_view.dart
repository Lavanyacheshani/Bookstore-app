import 'package:book_grocer/common/color_extenstion.dart';
import 'package:flutter/material.dart';

class OurBooksView extends StatefulWidget {
  const OurBooksView({super.key});

  @override
  State<OurBooksView> createState() => _OurBooksViewState();
}

class _OurBooksViewState extends State<OurBooksView> {

  List imageArr = ["assets/img/ob1.png","assets/img/ob2.png","assets/img/ob3.png"];

  @override
  Widget build(BuildContext context) {
    var media  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [

              Image.asset("assets/img/our_books_top.png", width:  media.width, fit: BoxFit.fitWidth, ),
             

              AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),

                Container(
                  height: media.width * 0.9 ,
                 
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:  Row( children: imageArr.map((iName) {
                      var isFirst= imageArr.first == iName;
                      var isLast = imageArr.last == iName;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: isFirst ? const EdgeInsets.only(left: 15 ) : ( isLast ? const EdgeInsets.only(right: 15) : null ) ,
                      child: Image.asset( iName,  height: 120 , fit: BoxFit.fitHeight, ),);
                  } ).toList() , ),),
                )

              

            ],),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Text("""Our specialty is sourcing discounted books of excellent quality and passing on the best possible prices to our customers.
We take our book-buying very seriously. We search tirelessly across Sri Lanka and beyond, collaborating with top publishers and suppliers to find the best deals. However, no book finds its way into our stores simply because it's affordable. It has to be a book we would love to read ourselves and confidently recommend to others.

We take pride in being a business that sells discounted books but maintains the ambiance and service quality of a traditional retail bookstore.

We are a proud Sri Lankan, family-owned business. Our journey began in 2000 with the opening of our first store in Colombo.

In 2007, we introduced the first Book Nook in Kandy. Since then, Book Nook stores have expanded across major cities, including Galle, Jaffna, and Colombo.

Our staff share a deep love for reading and are passionate about recommending books to others. We are proud of the role they play in showing our customers just how amazing discounted books can be.""", textAlign: TextAlign.center , style: TextStyle(color: TColor.subTitle, fontSize: 15),),
            )
            
          ],
        ),
      ),
    );
  }
}
