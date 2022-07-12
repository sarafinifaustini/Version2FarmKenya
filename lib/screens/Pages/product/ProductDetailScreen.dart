import 'package:farmkenya/API/APICalls.dart';
import 'package:farmkenya/screens/Pages/product/SimilarProducts.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import '../../../FadeIn.dart';
import '../../../models/Products.dart';
import 'ProductsScreen.dart';

import 'package:iconify_flutter/icons/ph.dart';
class ProductDetailScreen extends StatefulWidget {
  final String? productDetail;

  const ProductDetailScreen({Key? key, this.productDetail}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        child: Scaffold(
      body: FutureBuilder<List<Products>>(
          future: APICalls.getProductDetails(widget.productDetail!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: const Text("has problem"));
            } else if (snapshot.hasError) {
              return Center(child: const Text("has eerror"));
            } else if (snapshot.hasData) {
              List<Products>? data = snapshot.data;
              return DefaultTabController(
                length: 2, // This is the number of tabs.
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    // These are the slivers that show up in the "outer" scroll view.
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverSafeArea(
                          top: false,
                          sliver: SliverAppBar(
                            floating: true,
                            pinned: true,
                            snap: false,
                            primary: true,
                            forceElevated: innerBoxIsScrolled,
                            // leading: ,
                            title: Text(
                              data![0].commodityName!,
                            ),
                            centerTitle: false,
                            expandedHeight: 100,
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductsScreen();
                                      },
                                    ),
                                  );
                                },
                                icon: Iconify(
                                  Ion.arrow_back_circle,
                                  color: Colors.white,
                                ) // widget
                                ),

                            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: IconButton(
                                      icon: Iconify(
                                        Mdi.share_outline,
                                        color: Colors.white,
                                      ), // widget,
                                      onPressed: () {
                                        // _shareLink(theLink!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            bottom: TabBar(
                                indicatorColor:
                                    Theme.of(context).backgroundColor,
                                tabs: [
                                  Tab(
                                    text: " Details",
                                  ),
                                  Tab(
                                    text: "Simmilar Product",
                                  ),
                                ]
                                // These are the widgets to put in each tab in the tab bar.
                                // tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                                ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: <Widget>[
                      SingleChildScrollView(
                          // controller: _scrollViewController,
                          child: Column(children: [
                        Container(
                          width: double.infinity,
                          height: size.height * 0.64,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 60,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      FadeIn(
                                        delay: 2,
                                        child: Hero(
                                          tag: 1,
                                          child: Container(
                                            width: double.infinity,
                                            height: size.height / 2,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            child: Image.network(
                                              "https://farmkenya.standardmedia.co.ke/CommodityImages/${data![0].poster}",
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Center(
                                                    child: Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Row(children: [
                                                      Icon(Icons.error_outline),
                                                      Text(
                                                          '  Oops! Something went wrong')
                                                    ]),
                                                  ),
                                                ));
                                              },
                                              width: size.width,
                                              height: size.height,
                                              fit: BoxFit.cover,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.52,
                                left: 20,
                                right: 20,
                                bottom: 0,
                                child: FadeIn(
                                  delay: 3,
                                  child: Card(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "County",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle()),
                                              ),
                                              Text(
                                              data[0].countyName!,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle()),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Amount  in stock",
                                                style: GoogleFonts.poppins(),
                                              ),
                                              Text(
                                                data[0].volume!,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle()),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Description",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    Iconify(Ph.tree_fill,color: Theme.of(context).primaryColor,) // widget
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColorDark
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Market",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                        SizedBox(width: 12.0),
                                        Text(data[0].marketName!
                                          ,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Category",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                        Text(
                                          data[0].categoryName!,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColorDark
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Whole Sale price",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                        SizedBox(width: 12.0),
                                        Text(
                                          "Ksh ${data[0].wholeSalePrice!} /Kg",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Retail Price",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                        SizedBox(width: 12.0),
                                        Text(
                                            "Ksh ${data[0].wholeSalePrice!} /Kg",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColorDark
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Harvest date",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                        SizedBox(width: 12.0),
                                        Text(
                                          data[0].harvestDate == null ? 'Not given' : data[0].harvestDate!,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Accessories",
                                            style: GoogleFonts.raleway(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.cogs,
                                        ),
                                      ],
                                    ),
                                  ])
                              // ]
                              ),
                        )
                      ])

                          // ),

                          ),
                     SimilarProducts()
                    ],
                    // controller: _tabController,
                  ),
                ),
              );
            }
            return Center();
          }),
      floatingActionButton: FloatingActionButton(
          // backgroundColor: kPrimaryLightColor,
          child: Iconify(
            Tabler.message,
            color: Colors.white,
          ), // widget,
          onPressed: () {
            // theTawkWidget(context);
          }),
      // bottomNavigationBar: getBottom2(),
    ));
  }


}
