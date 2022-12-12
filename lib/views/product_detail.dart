import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';
import '../theme/colors.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var finalPrice = 0.0;
  var extraPrice = 0.0;
  var qty = 1;

  @override
  void initState() {
    super.initState();
    setExtraPrice();
    finalPrice = widget.product.price + extraPrice;
  }

  void setExtraPrice() {
    extraPrice = 0.0;
    for (var element in widget.product.type) {
      if (element.isSelected) {
        extraPrice += element.priceAdd;
      }
    }
  }

  void setFinalPrice() {
    finalPrice = (widget.product.price + extraPrice) * qty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 46.0,
                      height: 46.0,
                      decoration: BoxDecoration(
                        color: BaseColors.grey,
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset('assets/icons/ic_back.svg'),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 58.0,
                    height: 58.0,
                  ),
                  Container(
                    width: 46.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: BaseColors.grey,
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.product.isFavorite =
                              !widget.product.isFavorite;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: widget.product.isFavorite
                            ? BaseColors.red
                            : BaseColors.greyDark,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 34.0),
                      Container(
                        height: 382.0,
                        decoration: BoxDecoration(
                          color: widget.product.color,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                'assets/images/shadow2.png',
                                height: 108.0,
                                width: 270.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 18.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Hero(
                                  tag: widget.product.id,
                                  child: Image.asset(
                                    widget.product.imageUrl,
                                    height: 244.0,
                                    width: 144.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23.0),
                                    color: BaseColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (qty > 1) {
                                              qty--;
                                              setFinalPrice();
                                            }
                                          });
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            color: BaseColors.primary,
                                            height: 34.0,
                                            width: 34.0,
                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: GoogleFonts.poppins(
                                                  color: BaseColors.white,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      SizedBox(
                                        width: 24.0,
                                        child: Text(
                                          qty.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: BaseColors.primary,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            qty++;
                                            setFinalPrice();
                                          });
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            color: BaseColors.primary,
                                            height: 34.0,
                                            width: 34.0,
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: GoogleFonts.poppins(
                                                  color: BaseColors.white,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Coffee',
                        style: GoogleFonts.raleway(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.title,
                              style: GoogleFonts.raleway(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: BaseColors.yellow,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            widget.product.rate.toString(),
                            style: GoogleFonts.raleway(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: BaseColors.greyDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22.0),
                      Text(
                        widget.product.description,
                        style: GoogleFonts.raleway(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: BaseColors.descProduct,
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      SizedBox(
                        height: 103.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.product.type.length,
                                  itemBuilder: (context, index) {
                                    var type = widget.product.type[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20.0,
                                      ),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                for (var element
                                                    in widget.product.type) {
                                                  element.isSelected = false;
                                                }
                                                type.isSelected = true;
                                                extraPrice = type.priceAdd;
                                                setFinalPrice();
                                              });
                                            },
                                            child: Container(
                                              height: 78.0,
                                              width: 78.0,
                                              decoration: BoxDecoration(
                                                color: type.isSelected
                                                    ? BaseColors.primary
                                                    : BaseColors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  type.imageUrl,
                                                  height: 40.0,
                                                  width: 40.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6.0),
                                          Text(
                                            type.type,
                                            style: GoogleFonts.raleway(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: type.isSelected
                                                  ? BaseColors.primary
                                                  : BaseColors.greyDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 48.0,
                                    width: 1.0,
                                    color: BaseColors.divider,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    '\$ $finalPrice',
                                    style: GoogleFonts.raleway(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      color: BaseColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 42.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BaseColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: GoogleFonts.raleway(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
