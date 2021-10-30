// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_burger_emoji/selected_item.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 30.0,
            ),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0))
                  ],
                  color: Color(0xFFC6E7FE),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain)),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 15.0,
        ),
        child: Text('Search For',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 15.0,
        ),
        child: Text('Recipies',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      SizedBox(
        height: 25.0,
      ),
      Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: Icon(Icons.search, color: Colors.grey)),
              ))),
      SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 15.0,
        ),
        child: Text('Recommended',
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      Container(
        height: 180,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildListRecommendItems(Color(0xFFFFE9C6), 'burger.png',
                'Hamburger', '15', Color(0xFFDA9551), context),
            _buildListRecommendItems(Color(0xFFC2E3FE), 'fries.png', 'Fries',
                '10', Color(0xFF6A8CAA), context),
            _buildListRecommendItems(Color(0xFFD7FADA), 'doughnut.png',
                'Doughnut', '20', Color(0xFF56CC7E), context),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15.0),
        child: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            labelStyle: GoogleFonts.notoSans(
                fontSize: 15.0, fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 12.0, fontWeight: FontWeight.w500),
            tabs: [
              Tab(child: Text('FEATURED')),
              Tab(child: Text('COMBO')),
              Tab(child: Text('FAVORITES')),
              Tab(child: Text('RECOMMENDED')),
            ]),
      ),
      Container(
          height: 145.0,
          child: TabBarView(controller: tabController, children: [
            _buildFoodColumn(),
            _buildFoodColumn(),
            _buildFoodColumn(),
            _buildFoodColumn(),
          ]))
    ]);
  }
}

Widget _buildListRecommendItems(
  Color containerColor,
  String imageLabel,
  String itemname,
  String price,
  Color textColor,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectedItem(
                    heroTag: itemname,
                    imageLabel: imageLabel,
                    itemName: itemname,
                    price: price,
                  )),
        );
      },
      child: Container(
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: containerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: itemname,
              child: Container(
                width: 75.0,
                height: 75.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Center(
                    child: Image.asset('assets/$imageLabel',
                        height: 50.0, width: 50.0)),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              itemname,
              style: GoogleFonts.notoSans(fontSize: 16.0, color: textColor),
            ),
            Text(
              '\$' + price,
              style: GoogleFonts.notoSans(fontSize: 16.0, color: textColor),
            ),
          ],
        ),
      ),
    ),
  );
}

_buildFoodColumn() {
  return Column(
    children: [
      _buildFood('hotdog.png', 'Delicious Hotdog', '6', '18'),
      _buildFood('pizza.png', 'Pizza', '12', '18'),
    ],
  );
}

_buildFood(String imageLabel, String itemName, String salePrice,
    String originalPrice) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Container(
            width: 62.0,
            height: 62.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFFFE4E0),
            ),
            child: Center(
              child: Image.asset(
                'assets/$imageLabel',
                width: 43.0,
                height: 43.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(itemName,
                      style: GoogleFonts.notoSans(
                          fontSize: 15.0, fontWeight: FontWeight.w500)),
                ),
                RatingBar.builder(
                  itemSize: 17.0,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: '\$$salePrice',
                      style: GoogleFonts.lato(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(color: Color(0xFFF68D7F))),
                    ),
                    WidgetSpan(
                        child: SizedBox(
                      width: 10.0,
                    )),
                    TextSpan(
                        text: '\$$originalPrice',
                        style: GoogleFonts.lato(
                          fontSize: 12.0,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w600,
                          textStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.9)),
                        ))
                  ])),
                ),
              ],
            ),
          )
        ],
      ),
      FloatingActionButton(
        onPressed: () {},
        mini: true,
        child: Center(child: Icon(Icons.add, color: Colors.white)),
        backgroundColor: Color(0xFFFE7D6A),
      )
    ]),
  );
}

// rating,
// rating.toInt(),


// SelectedItem(
//                     heroTag: itemname,
//                     imageLabel: imageLabel,
//                   )             )