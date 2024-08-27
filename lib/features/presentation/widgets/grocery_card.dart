// import 'package:evaluation_app/features/data/model/grocery_model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GroceryCard extends StatelessWidget {
//   final GroceryModel grocery;

//   GroceryCard({required this.grocery});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // margin: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             'images/burger.png',
//             height: 120,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               grocery.title,
//               style:
//                   GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '\$${grocery.price.toStringAsFixed(2)}',
//                   style: GoogleFonts.lato(
//                       fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Rating: ${grocery.rating}',
//                   style: GoogleFonts.lato(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GroceryCard extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final double oldPrice;
//   final double newPrice;
//   final double rating;

//   const GroceryCard({
//     Key? key,
//     required this.title,
//     required this.imageUrl,
//     required this.oldPrice,
//     required this.newPrice,
//     required this.rating,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Image.network(
//                   imageUrl,
//                   height: 150,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8.0,
//                 right: 8.0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                   child: Text(
//                     '-${((oldPrice - newPrice) / oldPrice * 100).toStringAsFixed(0)}%',
//                     style: GoogleFonts.lato(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.lato(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Text(
//                   '\$${newPrice.toStringAsFixed(2)}',
//                   style: GoogleFonts.lato(
//                     fontSize: 14.0,
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Text(
//                   '\$${oldPrice.toStringAsFixed(2)}',
//                   style: GoogleFonts.lato(
//                     fontSize: 12.0,
//                     color: Colors.grey,
//                     decoration: TextDecoration.lineThrough,
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: Colors.yellow,
//                       size: 16.0,
//                     ),
//                     const SizedBox(width: 4.0),
//                     Text(
//                       rating.toStringAsFixed(1),
//                       style: GoogleFonts.lato(
//                         fontSize: 14.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:evaluation_app/features/domain/entity/grocery.dart';
import 'package:evaluation_app/features/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryCard extends StatelessWidget {
  final Grocery groceryObject;

  const GroceryCard({
    required this.groceryObject
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsPage(groceryObject: groceryObject)));
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        width: 160,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Favorite Icon
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Stack(
                children: [
                  Image.network(
                    groceryObject.imageUrl,
                    height: 90, // Increase height if needed
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Name
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Text(
                groceryObject.title,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color.fromRGBO(62, 62, 62, 1),
                  ),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            // Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 10,
                    color: Color.fromRGBO(255, 215, 0, 1),
                  ),
                  SizedBox(width: 4),
                  Text(
                    groceryObject.rating.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0,
                        color: Color.fromRGBO(13, 18, 23, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Price
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
                        fontSize: 14,
                        color: Color.fromRGBO(152, 157, 163, 1),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    (groceryObject.price - groceryObject.discount).toString(),
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color.fromRGBO(255, 99, 71, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // // Container(
// // //                               height: 20,
// // //                               width: 20,
// // //                               decoration: BoxDecoration(
// // //                                 color: Colors.white,
// // //                                 shape: BoxShape.circle,
// // //                               ),
// // //                               child: Icon(
// // //                                 Icons.add,
// // //                                 color: Colors.black,
// // //                                 size: 15,
// // //                               ),
// // //                             )