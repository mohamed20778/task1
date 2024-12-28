import 'package:flutter/material.dart';
import 'package:task1/constants.dart';
import 'package:task1/models/product_model.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, this.productModel});
  ProductModel? productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.network(
                  widget.productModel!.images,
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel!.title.substring(0, 20),
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.productModel!.description.substring(0, 37),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '\$' + widget.productModel!.price.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orange,
                      fontFamily: 'Playfair',
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star_rate, color: Colors.orange, size: 18),
                      SizedBox(width: 5),
                      Text(
                        '4.8 Ratings',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        spacing: 6,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Size',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),

                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 11.5,
                                backgroundColor: Colors.white,
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ourFont,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 11.5,
                                backgroundColor: Colors.white,
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ourFont,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 11.5,
                                backgroundColor: Colors.white,
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ourFont,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .145),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isfavourite = !isfavourite;
                          });
                        },
                        icon: Icon(
                          isfavourite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
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
