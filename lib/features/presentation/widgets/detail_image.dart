
import 'package:evaluation_app/features/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Stack(
                  children: [
                    Hero(
                      tag: 'product',
                      child: Container(
                        color: const Color.fromRGBO(190, 162, 155, 350),
                        child: Image.asset(
                          'images/burger.png',
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // child: Image.network(widget.productObject.imageUr),
                      ),
                    ),
                    Positioned(
                      right: 304,
                      bottom: 210,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // context.read<ProductBloc>().add(LoadAllProductEvent());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.1),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 18,
                              color: Color.fromRGBO(13, 18, 23, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
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
              );
  }
}