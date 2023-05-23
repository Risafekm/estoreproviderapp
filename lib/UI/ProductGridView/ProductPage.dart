import 'package:estoreproviderapp/UI/BottomNavigationBarPages/BottomCart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Animations/PageRouteAnimations/PageRouteAnimaton.dart';
import '../../Model/gridCardItem.dart';
import '../Widgets/widget.dart';

class ProductPage extends StatelessWidget {
  final GridCardItem productitem;
  const ProductPage({Key? key, required this.productitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appbar(context),
      body: SingleChildScrollView(
        child: Column(children: [
          productName(context),
          const Divider(),
          priceBigText(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 0.9,
          ),
          selectSizePrice(),
          const Divider(
            thickness: 0.9,
          ),
          const SizedBox(
            height: 10,
          ),
          addCartButton(context),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  productName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Visit the Lymio Store',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            ratingANDSale(),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  productitem.itemName.toString(),
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(160, 2, 2, 2),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Hero(
          tag: 'tag-1-${productitem.images.toString()}',
          transitionOnUserGestures: true,
          child: Image.network(
            productitem.images.toString(),
            fit: BoxFit.cover,
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }

  ratingANDSale() {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                productitem.itemStar.toString(),
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 51, 227, 16),
                    fontWeight: FontWeight.w500),
              ),
              const Icon(
                Icons.star,
                size: 20,
                color: Color.fromARGB(255, 229, 209, 25),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[200],
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: Color.fromARGB(255, 5, 66, 116),
            ),
          ),
          Text(
            'Product details',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 5, 66, 116),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteAnimation(
                  widget: const BottomCart(),
                  alignment: Alignment.centerRight,
                  curves: Curves.decelerate,
                  animationTime: const Duration(milliseconds: 300),
                ),
              );
            },
            child: const Icon(
              Icons.shopping_cart_checkout,
              size: 22,
              color: Color.fromARGB(255, 5, 66, 116),
            ),
          ),
        ],
      ),
    );
  }

  selectSizePrice() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: productModel.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
              ),
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              height: 120,
              width: 100,
              child: Column(
                children: [
                  Text(
                    productModel[index].size,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    productModel[index].mainPrice.toString(),
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 93, 103, 211),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productModel[index].offerPrice.toString(),
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough,
                        color: Color.fromARGB(255, 142, 40, 225),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  priceBigText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                productitem.itemPrice.toString(),
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 93, 103, 211),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                productitem.itemmainPrice.toString(),
                style: GoogleFonts.lora(
                  decoration: TextDecoration.lineThrough,
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 142, 40, 225),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Inclusive of all taxes',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Pay with Amazon Pay UPI\nEnjoy faster payments & instant refunds',
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addCartButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
          onPressed: () {},
          style: elevatedButtonStyle(),
          child: Text(
            'Add to Cart',
            style: GoogleFonts.crimsonText(
                fontSize: 22, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class ProductModel {
  String size;
  String offerPrice;
  String mainPrice;

  ProductModel(
      {required this.size, required this.mainPrice, required this.offerPrice});
}

List<ProductModel> productModel = [
  ProductModel(size: "XS", mainPrice: '₹469', offerPrice: '₹1050'),
  ProductModel(size: "S", mainPrice: '₹550', offerPrice: '₹1050'),
  ProductModel(size: "M", mainPrice: '₹650', offerPrice: '₹1150'),
  ProductModel(size: "L", mainPrice: '₹750', offerPrice: '₹1250'),
  ProductModel(size: "XL", mainPrice: '₹800', offerPrice: '₹1450'),
  ProductModel(size: "XXL", mainPrice: '₹840', offerPrice: '₹1650'),
];
