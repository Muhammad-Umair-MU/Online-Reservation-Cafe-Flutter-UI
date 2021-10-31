// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedItem extends StatefulWidget {
  const SelectedItem(
      {Key? key,
      this.heroTag,
      required this.imageLabel,
      required this.itemName,
      required this.price})
      : super(key: key);

  final heroTag;
  final String imageLabel;
  final String itemName;
  final String price;

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}
int quantity = 1;
class _SelectedItemState extends State<SelectedItem> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(children: [
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
                        color: Color(0xFFFE7D6A).withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0))
                  ],
                  color: Color(0xFFFE7D6A),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(widget.itemName,
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                  tag: widget.heroTag,
                  child: Image.asset(
                    'assets/${widget.imageLabel}',
                    height: 230,
                    width: 220,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  children: [
                    icons(
                      iconData: Icons.favorite_border,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    icons(
                      iconData: Icons.restore,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + (int.parse(widget.price) * quantity).toString(),
                style: GoogleFonts.notoSans(
                    fontSize: 40.0,
                    color: Color(0xFF5E6166),
                    fontWeight: FontWeight.w500),
              ),
              Container(
                width: 270.0,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  color: Color(0xFFFE7D6A),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 45.0,
                      width: 112.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 17.0,
                            onPressed: () {
                              setState(() {
                                if(quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove, color: Color(0xFFFE7D6A)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(color: Color(0xFFFE7D6A)),
                          ),
                          IconButton(
                            iconSize: 17.0,
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFFFE7D6A),
                            ),
                            padding: EdgeInsets.all(0.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Add to Cart',
                      style:  GoogleFonts.notoSans(
                        fontSize: 20.0,color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Featured',
            style: GoogleFonts.notoSans(
                fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
            height: 180.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //  _buildFood('cheese.png','Cheese','10'),
                //   _buildFood('cheese.png','Cheese','10'),
                _buildFoodColumn(
                    color1: Color(0xFFFBD6F5),
                    color2: Color(0xFFFED6CF),
                    imageLabel1: 'cheese.png',
                    itemName1: 'Sweet Cheese',
                    price1: '11',
                    imageLabel2: 'popcorn.png',
                    itemName2: 'Sweet Popcorn',
                    price2: '6'),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: _buildFoodColumn(
                      color1: Color(0xFFC4E2FD),
                      color2: Color(0xFFC5F6C5),
                      imageLabel1: 'taco.png',
                      itemName1: 'Taco',
                      price1: '6',
                      imageLabel2: 'sandwich.png',
                      itemName2: 'Sandwich',
                      price2: '9'),
                )
              ],
            ))
      ]),
    );
  }
}

class icons extends StatelessWidget {
  const icons({Key? key, required this.iconData}) : super(key: key);
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFFE7D6A).withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                  offset: Offset(5.0, 11.0))
            ],
            color: Colors.white),
        child: Center(
            child: Icon(iconData, color: Color(0xFFFE7D6A), size: 30.0)));
  }
}

_buildFoodColumn(
    {required color1,
    required color2,
    required String imageLabel1,
    required String imageLabel2,
    required String itemName1,
    required String itemName2,
    required String price1,
    required String price2}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildFood(
        color1,
        imageLabel1,
        itemName1,
        price1,
      ),
      _buildFood(
        color2,
        imageLabel2,
        itemName2,
        price2,
      ),
    ],
  );
}

_buildFood(color, String imageLabel, String itemName, String salePrice) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
    child: Row(
      children: [
        Container(
          width: 65.0,
          height: 65.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Center(
            child: Image.asset(
              'assets/$imageLabel',
              width: 45.0,
              height: 45.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(itemName,
                    style: GoogleFonts.notoSans(
                        fontSize: 16.0, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '\$$salePrice',
                  style: GoogleFonts.lato(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      textStyle: TextStyle(color: Color(0xFFF68D7F))),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}




              // _buildQuantityCounter(
              //     minusFunction: () {
              //       setState(() {
              //         quantity++;
              //       });
              //     },
              //     plusFunction: () {
              //       setState(() {
              //         quantity--;
              //       });
              //     },
              //     quantity: quantity.toString())


// Widget _buildQuantityCounter(
//     {required VoidCallback minusFunction,
//     required VoidCallback plusFunction,
//     required String quantity}) {
//   return Container(
//     width: 270.0,
//     height: 80,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(15.0),
//         bottomLeft: Radius.circular(15.0),
//       ),
//       color: Color(0xFFFE7D6A),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Container(
//           height: 45.0,
//           width: 112.0,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0), color: Colors.white),
//           child: Row(
//             children: [
//               IconButton(
//                 iconSize: 17.0,
//                 onPressed: () {
//                   minusFunction;
//                 },
//                 icon: Icon(Icons.remove, color: Color(0xFFFE7D6A)),
//                 padding: EdgeInsets.all(0.0),
//               ),
//               Text(
//                 quantity,
//                 style: TextStyle(color: Color(0xFFFE7D6A)),
//               ),
//               IconButton(
//                 iconSize: 17.0,
//                 onPressed: () {
//                   plusFunction;
//                 },
//                 icon: Icon(
//                   Icons.add,
//                   color: Color(0xFFFE7D6A),
//                 ),
//                 padding: EdgeInsets.all(0.0),
//               ),
//             ],
//           ),
//         ),
//         Text(
//           'Add to Cart',
//           style: TextStyle(color: Colors.white),
//         ),
//       ],
//     ),
//   );
// }