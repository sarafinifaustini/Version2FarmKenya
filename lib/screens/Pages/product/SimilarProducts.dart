import 'package:farmkenya/API/APICalls.dart';
import 'package:farmkenya/models/Products.dart';
import 'package:farmkenya/widgets/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'ProductDetailScreen.dart';
class SimilarProducts extends StatefulWidget {
  static var screenHeight;
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  @override
  Widget build(BuildContext context) {
    SimilarProducts.screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return  Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            FutureBuilder<List<Products>>(
                future: APICalls.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SizedBox(
                      // width: double.infinity,
                      height: size.height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Shimmer.fromColors(
                          baseColor:
                          Theme.of(context).primaryColorDark,
                          highlightColor:
                          Theme.of(context).primaryColorLight,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (BuildContext context,
                                  int index) =>
                                  Center(
                                      child:
                                      const Text("iko shida"))),
                        ),
                      ),
                    );
                  } else if (!snapshot.hasData) {
                    return SizedBox(
                      // width: double.infinity,
                      height: size.height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Shimmer.fromColors(
                          baseColor:
                          Theme.of(context).primaryColorDark,
                          highlightColor:
                          Theme.of(context).primaryColorLight,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (BuildContext context,
                                  int index) =>
                              const Center(
                                  child: Text("no data"))),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<Products>? data = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: size.height,
                            child: DefaultTabController(
                              length: 1,
                              child: NestedScrollView(
                                headerSliverBuilder:
                                    (BuildContext context,
                                    bool innerBoxIsScrolled) {
                                  return [
                                    SliverOverlapAbsorber(
                                        handle: NestedScrollView
                                            .sliverOverlapAbsorberHandleFor(
                                            context),
                                        sliver: SliverSafeArea(
                                            top: false,
                                            sliver: SliverAppBar(

                                              ///Properties of app bar
                                                backgroundColor: Theme
                                                    .of(context)
                                                    .scaffoldBackgroundColor,
                                                floating: true,
                                                pinned: true,
                                                // expandedHeight: 200.0,
                                                // title: Text("More Videos"),
                                                bottom: TabBar(
                                                    indicatorColor:
                                                    Theme.of(
                                                        context)
                                                        .backgroundColor,
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                        "A title",
                                                      ),
                                                      // Tab(text: "Popular Shows")
                                                    ])))),
                                  ];
                                },
                                body: CustomScrollView(slivers: [
                                  SliverGrid(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      mainAxisExtent: 200.0,
                                    ),
                                    delegate:
                                    SliverChildBuilderDelegate(
                                          (BuildContext context,
                                          int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen(productDetail: data![index].id.toString(),)));
                                          },
                                          child: FittedBox(
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  CardWidget(imagePath: data![index].poster, price:data[index].wholeSalePrice, weight: data[index].volume, commodityName: data[index].commodityName, county: data[index].countyName,)
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      childCount: data!.length,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Center();
                  // child: CircularProgressIndicator(),
                  // );
                }),
          ],
        ),
      ),
    );
  }
}
