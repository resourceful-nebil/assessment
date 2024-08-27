// import 'package:evaluation_app/features/presentation/bloc/grocery_bloc.dart';
// import 'package:evaluation_app/features/presentation/bloc/grocery_event.dart';
// import 'package:evaluation_app/features/presentation/bloc/grocery_state.dart';
// import 'package:evaluation_app/features/presentation/widgets/grocery_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100.0),
//         child: Container(
//           margin: const EdgeInsets.only(top: 28.0),
//           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//           child: AppBar(
//             backgroundColor: Colors.white,
//             shadowColor: null,
//             elevation: 0.0,
//             // leading: Image.asset(
//             //   'images/placeImage.png',
//             // ),
//             actions: [],
//           ),
//         ),
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           // Add the refresh logic here, e.g., refetching products
//           context.read<GroceryBloc>().add(LoadAllGroceriesEvent());
//         },
//         child: Column(
//           children: [
//             _middlebar(context),
//             BlocBuilder<GroceryBloc, GroceryState>(
//               builder: (context, state) {
//                 if (state is GroceryLoadingState) {
//                   print('Loading');
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is GroceryErrorState) {
//                   print('error');
//                   return Center(
//                     child: Text(state.message),
//                   );
//                 } else if (state is GroceriesLoadedState) {
//                   print('Loaded');
//                   state.groceries;
//                   return Container(
//                     height: (MediaQuery.of(context).size.height) * 0.75,
//                     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                     child: ListView(
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         for (var grocery in state.groceries)
//                           GroceryCard(groceryObject: grocery),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _middlebar(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       width: double.maxFinite,
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               'Available Products',
//               style: GoogleFonts.poppins(
//                   textStyle: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 18,
//                 color: Color.fromRGBO(62, 62, 62, 1),
//               )),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: Colors.white,
//               shape: BoxShape.rectangle,
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 2,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const SearchPage(),
//                     //   ),
//                     // );
//                   },
//                   icon: const Icon(
//                     Icons.search_outlined,
//                     size: 24,
//                     color: Color.fromRGBO(217, 217, 217, 1),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:evaluation_app/features/data/model/grocery_model.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_bloc.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_event.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_state.dart';
import 'package:evaluation_app/features/presentation/pages/data.dart';
import 'package:evaluation_app/features/presentation/widgets/grocery_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GroceryModel> groceryItems = parseGroceryData(jsonData);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 8),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        elevation: 5,
                        padding: EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        // Action when the button is pressed
                        print('Circular button pressed');
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/appbar_burger.png'),
                        SizedBox(width: 10),
                        Text(
                          'Burger',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              color: Color.fromRGBO(13, 18, 23, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Search bar
              Container(
                padding: EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for food',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.filter_list),
                    filled: true,
                    fillColor: Color.fromRGBO(233, 234, 235, 1),
                  ),
                ),
              ),
              SizedBox(
                  height: 20), // Add space between search bar and grocery list
              // List of groceries
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: groceryItems.length,
                  itemBuilder: (context, index) {
                    return GroceryCard(grocery: groceryItems[index]);
                  },
                ),
                // child: RefreshIndicator(
                //   onRefresh: () async {
                //     BlocProvider.of<GroceryBloc>(context)
                //         .add(LoadAllGroceriesEvent());
                //   },
                //   child: BlocBuilder<GroceryBloc, GroceryState>(
                //     builder: (BuildContext context, state) {
                //       if (state is GroceryLoadingState) {
                //         return Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       } else if (state is GroceriesLoadedState) {
                //         // return GridView.builder(
                //         //   padding: const EdgeInsets.all(8.0),
                //         //   gridDelegate:
                //         //       SliverGridDelegateWithFixedCrossAxisCount(
                //         //     crossAxisCount: 2,
                //         //     crossAxisSpacing: 8.0,
                //         //     mainAxisSpacing: 8.0,
                //         //   ),
                //         //   itemCount: groceryItems.length,
                //         //   itemBuilder: (context, index) {
                //         //     return GroceryCard(grocery: groceryItems[index]);
                //         //   },
                //         // );
                //         // return GridView.builder(
                //         //   gridDelegate:
                //         //       SliverGridDelegateWithFixedCrossAxisCount(
                //         //     crossAxisCount: 2, // Number of items per row
                //         //     crossAxisSpacing:
                //         //         16.0, // Space between items horizontally
                //         //     mainAxisSpacing:
                //         //         16.0, // Space between items vertically
                //         //   ),
                //         //   itemCount: state.groceries.length, // Number of items
                //         //   itemBuilder: (context, index) {
                //         //     final grocery = state.groceries[index];
                //         //     return GroceryCard(groceryObject: grocery);
                //         //   },
                //         // );
                //         // Container(
                //         //   height: (MediaQuery.of(context).size.height) * 0.75,
                //         //   padding:
                //         //       const EdgeInsets.only(left: 10.0, right: 10.0),
                //         //   child: ListView(
                //         //     children: [
                //         //       SizedBox(
                //         //         height: 10,
                //         //       ),
                //         //       for (var product in state.groceries)
                //         //         GroceryCard(groceryObject: product),
                //         //       SizedBox(
                //         //         height: 10,
                //         //       ),
                //         //     ],
                //         //   ),
                //         // );
                //         // return GridView.builder(
                //         //   gridDelegate:
                //         //       SliverGridDelegateWithFixedCrossAxisCount(
                //         //     crossAxisCount: 2,
                //         //     crossAxisSpacing: 16.0,
                //         //     mainAxisSpacing: 16.0,
                //         //   ),
                //         //   itemCount: state.groceries.length,
                //         //   itemBuilder: (context, index) {
                //         //     final grocery = state.groceries[index];
                //         //     return GroceryCard(groceryObject: grocery);
                //         //   },
                //         // );
                //       } else if (state is GroceryErrorState) {
                //         return Center(
                //           child: Text(state.message),
                //         );
                //       }
                //       return Container(); // Default return
                //     },
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // import 'package:evaluation_app/features/presentation/bloc/grocery_bloc.dart';
// // import 'package:evaluation_app/features/presentation/bloc/grocery_event.dart';
// // import 'package:evaluation_app/features/presentation/bloc/grocery_state.dart';
// // import 'package:evaluation_app/features/presentation/widgets/grocery_card.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         // AppBar
// //         body: Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: Column(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.fromLTRB(0, 40, 0, 8), // Padding around the app bar
// //                 child: Row(
// //                   children: [
// //                     ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         shape: CircleBorder(),
// //                         backgroundColor: Colors.white, // Background color of the button
// //                         elevation: 5, // Elevation of the button
// //                         padding: EdgeInsets.all(12), // Padding inside the button
// //                       ),
// //                       onPressed: () {
// //                         // Action when the button is pressed
// //                         print('Circular button pressed');
// //                       },
// //                       child: Icon(
// //                         Icons.menu, // Icon inside the button
// //                         color: Colors.black, // Color of the icon
// //                       ),
// //                     ),
// //                     SizedBox(width: 50),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Image.asset('images/appbar_burger.png'),
// //                         SizedBox(width: 10),
// //                         Text(
// //                           'Burger',
// //                           style: GoogleFonts.roboto(
// //                             textStyle: const TextStyle(
// //                               fontWeight: FontWeight.w600,
// //                               fontSize: 22,
// //                               color: Color.fromRGBO(13, 18, 23, 1),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               // Search bar
// //               Container(
// //                 padding: EdgeInsets.all(8),
// //                 child: TextField(
// //                   decoration: InputDecoration(
// //                     hintText: 'Search for food',
// //                     prefixIcon: Icon(Icons.search),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     suffixIcon: Icon(Icons.filter_list),
// //                     filled: true,
// //                     fillColor: Color.fromRGBO(233, 234, 235, 1),
// //                   ),
// //                 ),
// //               ),
// //               // List of groceries
// //               Column(
// //                 children: [
// //                   Expanded(
// //                     child: RefreshIndicator(
// //                       onRefresh: () async {
// //                         BlocProvider.of<GroceryBloc>(context).add(LoadAllGroceriesEvent());
// //                       },
// //                       child: BlocBuilder<GroceryBloc, GroceryState>(
// //                         builder: (BuildContext context, state) {
// //                           if (state is GroceryLoadingState) {
// //                             return Center(
// //                               child: CircularProgressIndicator(),
// //                             );
// //                           } else if (state is GroceriesLoadedState) {
// //                             return GridView.builder(
// //                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                                 crossAxisCount: 2, // Number of items per row
// //                                 crossAxisSpacing: 16.0, // Space between items horizontally
// //                                 mainAxisSpacing: 16.0, // Space between items vertically
// //                               ),
// //                               itemCount: state.groceries.length, // Number of items
// //                               itemBuilder: (context, index) {
// //                                 final grocery = state.groceries[index];
// //                                 return GroceryCard(groceryObject: grocery);
// //                               },
// //                             );
// //                           } else if (state is GroceryErrorState) {
// //                             return Center(
// //                               child: Text(state.message),
// //                             );
// //                           }
// //                           return Container(); // Add a default return statement
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:evaluation_app/features/presentation/bloc/grocery_bloc.dart';
// // import 'package:evaluation_app/features/presentation/bloc/grocery_event.dart';
// // import 'package:evaluation_app/features/presentation/bloc/grocery_state.dart';
// // import 'package:evaluation_app/features/presentation/widgets/grocery_card.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         // AppBar
// //         body: Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: Column(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.fromLTRB(0, 40, 0, 8), // Padding around the app bar
// //                 child: Row(
// //                   children: [
// //                     ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         shape: CircleBorder(),
// //                         backgroundColor: Colors.white, // Background color of the button
// //                         elevation: 5, // Elevation of the button
// //                         padding: EdgeInsets.all(12), // Padding inside the button
// //                       ),
// //                       onPressed: () {
// //                         // Action when the button is pressed
// //                         print('Circular button pressed');
// //                       },
// //                       child: Icon(
// //                         Icons.menu, // Icon inside the button
// //                         color: Colors.black, // Color of the icon
// //                       ),
// //                     ),
// //                     SizedBox(width: 50),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Image.asset('images/appbar_burger.png'),
// //                         SizedBox(width: 10),
// //                         Text(
// //                           'Burger',
// //                           style: GoogleFonts.roboto(
// //                             textStyle: const TextStyle(
// //                               fontWeight: FontWeight.w600,
// //                               fontSize: 22,
// //                               color: Color.fromRGBO(13, 18, 23, 1),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               // Search bar
// //               Container(
// //                 padding: EdgeInsets.all(8),
// //                 child: TextField(
// //                   decoration: InputDecoration(
// //                     hintText: 'Search for food',
// //                     prefixIcon: Icon(Icons.search),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     suffixIcon: Icon(Icons.filter_list),
// //                     filled: true,
// //                     fillColor: Color.fromRGBO(233, 234, 235, 1),
// //                   ),
// //                 ),
// //               ),
// //               // List of groceries
// //               // RefreshIndicator(
// //               //   onRefresh: () async {
// //               //     BlocProvider.of<GroceryBloc>(context).add(LoadAllGroceriesEvent());
// //               //   },
// //                 Expanded(
// //                   child: BlocBuilder<GroceryBloc, GroceryState>(
// //                     builder: (BuildContext context, state) {
// //                       if (state is GroceryLoadingState) {
// //                         return Center(
// //                           child: CircularProgressIndicator(),
// //                         );
// //                       } else if (state is GroceriesLoadedState) {
// //                         return GridView.builder(
// //                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                             crossAxisCount: 2, // Number of items per row
// //                             crossAxisSpacing: 16.0, // Space between items horizontally
// //                             mainAxisSpacing: 16.0, // Space between items vertically
// //                           ),
// //                           itemCount: state.groceries.length, // Number of items
// //                           itemBuilder: (context, index) {
// //                             final grocery = state.groceries[index];
// //                             return GroceryCard(groceryObject: grocery);
// //                           },
// //                         );
// //                       } else if (state is GroceryErrorState) {
// //                         return Center(
// //                           child: Text(state.message),
// //                         );
// //                       }
// //                       return Container(); // Add a default return statement
// //                     },
// //                   ),
// //                 ),

// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// //                     //   if (state is GroceryLoadingState) {
// //                     //     return Center(
// //                     //       child: CircularProgressIndicator(),
// //                     //     );
// //                     //   } else if (state is GroceriesLoadedState) {
// //                     //     return GridView.builder(
// //                     //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                     //         crossAxisCount: 2, // Number of items per row
// //                     //         crossAxisSpacing:
// //                     //             16.0, // Space between items horizontally
// //                     //         mainAxisSpacing:
// //                     //             16.0, // Space between items vertically
// //                     //       ),
// //                     //       itemCount: state.groceries.length, // Number of items
// //                     //       itemBuilder: (context, index) {
// //                     //         for (var grocery in state.groceries) {
// //                     //           return GroceryCard(groceryObject: grocery);
// //                     //         }
// //                     //       },
// //                     //     );
// //                     //   } else if (state is GroceryErrorState) {
// //                     //     return Center(
// //                     //       child: Text(state.message),
// //                     //     );
// //                     //   }
// //                     // },
// //                     // child: GridView.builder(
// //                     //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                     //     crossAxisCount: 2, // Number of items per row
// //                     //     crossAxisSpacing: 16.0, // Space between items horizontally
// //                     //     mainAxisSpacing: 16.0, // Space between items vertically
// //                     //   ),
// //                     //   itemCount: 10, // Number of items
// //                     //   itemBuilder: (context, index) {
// //                     //     return GroceryCard(
// //                     //       title: 'Grocery Item $index',
// //                     //       imageUrl:
// //                     //           'images/burger.png', // Replace with your image path or URL
// //                     //       oldPrice: '\$5.00',
// //                     //       newPrice: '\$3.00',
// //                     //       rating: 4.0,
// //                     //     );
// //                     //   },
// //                     // ),
