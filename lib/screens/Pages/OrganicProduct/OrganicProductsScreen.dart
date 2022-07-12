import 'package:farmkenya/screens/Pages/product/ProductDetailScreen.dart';
import 'package:farmkenya/widgets/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:shimmer/shimmer.dart';
import '../../../API/APICalls.dart';
import '../../../models/Products.dart';


class OrganicProductsScreen extends StatefulWidget {
  static var screenHeight;

  const OrganicProductsScreen({Key? key}) : super(key: key);

  @override
  State<OrganicProductsScreen> createState() => _OrganicProductsScreenState();
}

class _OrganicProductsScreenState extends State<OrganicProductsScreen> {

  @override
  Widget build(BuildContext context) {
    //get the size of  page
    OrganicProductsScreen.screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      // appBar: AppBar(
      //   elevation: 5,
      //   title: const Text("Products"),
      // ),
      body: Center(
        child: Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              // physics: const NeverScrollableScrollPhysics(),
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        // MoreVideosPage(theDetail: "/ktn-news/videos/23/0/20",theIndex: 1,),
                        FutureBuilder<List<Products>>(
                            future: APICalls.getOrganicProducts(),
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
                    )
                  ],
                ))
          // }
          // }
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }),
          // ),
        ),
      ),

      // const Center(child: CardWidget(imagePath: "",weight: "kg", price: '2000',)),
    );


  }
}
