import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_app/theme/colors.dart';

import '../models/category.dart';
import '../models/product.dart';
import 'product_detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

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
                  Container(
                    width: 46.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: BaseColors.grey,
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset('assets/icons/ic_menu.svg'),
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/icons/ic_shop.png'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 45.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Our way of loving\nyou back',
                        style: GoogleFonts.raleway(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 38.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: SizedBox(
                        height: 54.0,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            labelText: 'Search',
                            fillColor: BaseColors.background,
                            filled: true,
                            labelStyle: GoogleFonts.raleway(
                              fontSize: 16.0,
                              color: BaseColors.black.withOpacity(0.58),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18.0,
                                vertical: 18.0,
                              ),
                              child: SvgPicture.asset('assets/icons/ic_search.svg'),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(27.0),
                              ),
                              borderSide: BorderSide(
                                color: BaseColors.background,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(27.0),
                              ),
                              borderSide: BorderSide(
                                color: BaseColors.background,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(27.0),
                              ),
                              borderSide: BorderSide(
                                color: BaseColors.primary,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: Container(
                              width: 54.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: BaseColors.white,
                                borderRadius: BorderRadius.circular(27.0),
                              ),
                              child: Center(
                                child: Container(
                                  width: 46.0,
                                  height: 46.0,
                                  decoration: BoxDecoration(
                                    color: BaseColors.primary,
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child:
                                    SvgPicture.asset('assets/icons/ic_filter.svg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      height: 40.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            var item = categories[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 24.0 : 0.0,
                                right: 14.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    for (var element in categories) {
                                      element.isSelected = false;
                                    }
                                    item.isSelected = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: item.isSelected
                                        ? BaseColors.primary
                                        : BaseColors.background,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.title,
                                        style: GoogleFonts.raleway(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          color: item.isSelected
                                              ? BaseColors.white
                                              : BaseColors.black.withOpacity(0.58),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 34.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: GoogleFonts.raleway(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'See All',
                            style: GoogleFonts.raleway(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: BaseColors.primary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 384.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            var item = products[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 24.0 : 0.0,
                                right: 24.0,
                                top: 20.0,
                                bottom: 8.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                        product: item,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 256.0,
                                  decoration: BoxDecoration(
                                    color: BaseColors.white,
                                    borderRadius: BorderRadius.circular(14.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: BaseColors.black.withOpacity(0.15),
                                        blurRadius: 8.0,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 270.0,
                                        decoration: BoxDecoration(
                                          color: item.color,
                                          borderRadius: BorderRadius.circular(14.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset(
                                                'assets/images/shadow.png',
                                                height: 85.0,
                                                width: 200.0,
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
                                                  tag: item.id,
                                                  child: Image.asset(
                                                    item.imageUrl,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 14.0),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title,
                                              style: GoogleFonts.raleway(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 6.0),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '\$ ${item.price}',
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: BaseColors.primary,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      item.isFavorite =
                                                      !item.isFavorite;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: item.isFavorite
                                                        ? BaseColors.red
                                                        : BaseColors.greyDark,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 14.0),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
