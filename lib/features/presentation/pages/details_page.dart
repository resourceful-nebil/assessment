import 'package:evaluation_app/features/domain/entity/grocery.dart';
import 'package:evaluation_app/features/presentation/pages/home_page.dart';
import 'package:evaluation_app/features/presentation/widgets/detail_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final Grocery groceryObject;
  const DetailsPage({super.key, required this.groceryObject});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // Outline color
              width: 8.0, // Outline width
            ),
          ),
          child: ListView(
            children: [
              DetailImage(imageUrl: groceryObject.imageUrl),
              Container(
                child: Column(
                  children: <Widget>[
                    //name
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            groceryObject.title,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Color.fromRGBO(62, 62, 62, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //price
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            groceryObject.price.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Color.fromRGBO(152, 157, 163, 1),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            (groceryObject.price - groceryObject.discount)
                                .toString(),
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: Color.fromRGBO(255, 99, 71, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //rating
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromRGBO(255, 215, 0, 1),
                              ),
                              SizedBox(width: 4),
                              Text(
                                groceryObject.rating.toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(13, 18, 23, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('See All Reviews',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(105, 112, 121, 1),
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ],
                      ),

                      //description
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        groceryObject.description,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Color.fromRGBO(105, 112, 121, 1),
                          ),
                        ),
                      ),
                    ),
                    //see more
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('See More',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(105, 112, 121, 1),
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ),
                      ],
                    ),
                    //additional options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Additional Options:',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //options
                    //1
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                groceryObject.options[0].name,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    groceryObject.options[0].price.toString(),
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Checkbox(
                                      value: false,
                                      onChanged: (bool? newValue) {})
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                groceryObject.options[1].name,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    groceryObject.options[1].price.toString(),
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Checkbox(
                                      value: false,
                                      onChanged: (bool? newValue) {})
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                groceryObject.options[2].name,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    groceryObject.options[2].price.toString(),
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Checkbox(
                                      value: false,
                                      onChanged: (bool? newValue) {})
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //2
                    //3
                  ],
                ),
              ),
              //bottom container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('1',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ),
                        )),
                    SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 99, 71, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // Adjust padding if needed
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Adjust the row size to fit the content
                        children: [
                          SizedBox(width: 8), // Add space between text and icon
                          Icon(
                            Icons.shopping_cart, // Use the desired icon
                            color: Colors
                                .white, // Customize icon color to match text
                          ),
                          SizedBox(width: 8), // Add space between text and icon
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16, // Adjust font size if needed
                              fontWeight:
                                  FontWeight.bold, // Customize font weight
                              color: Colors.white, // Customize text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // bottomSheet: ,
      ),
    );
  }
}
