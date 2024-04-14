import 'package:flutter/material.dart';

class ProductsCustomCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? price;
  final String? description;
  final String? productId;
  final String? category;

  ProductsCustomCard({
    this.image,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.productId,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            decoration: const BoxDecoration(),
            child: Stack(
              children: <Widget>[
                Container(
                  width: 382,
                  height: 210,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFA082),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Embrace Mental Wellness ',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  // fontFamily: poppins,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Flexible(
                              child: Text(
                                'score 1-10 ',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16), // Add spacing between the text and image
                      Image.network(
                        'https://via.placeholder.com/80x80',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
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