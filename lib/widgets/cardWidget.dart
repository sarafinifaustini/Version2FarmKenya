import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CardWidget extends StatefulWidget {
  static var screenHeight;
  final String? imagePath;
  final String? commodityName;
  final String? county;
  // final VoidCallback? goToDetails;
  final String? price;
  final String? weight;

  const CardWidget(
      {Key? key,
      required this.imagePath,
      required this.price,
      required this.weight,
      required this.commodityName, required this.county})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  @override
  Widget build(BuildContext context) {
    CardWidget.screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width / 1,
        height: size.height / 2,
        child: Stack(children: <Widget>[
          Container(
              width: size.width / 1,
              height: size.height / 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(231, 238, 233, 1),
              )),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //image
            Container(
                width: size.width,
                height: size.height / 3.5,
                // width: 157,
                // height: 127,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: NetworkImage("https://farmkenya.standardmedia.co.ke/CommodityImages/${widget.imagePath}"),
                      fit: BoxFit.cover),
                )),
            //title
            Text(
              widget.commodityName!,
              textAlign: TextAlign.center,
              style: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Nunito',
            fontSize: 32,
            letterSpacing:
                1 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.bold,
              ),
            ),
            //whole sale price
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Text(
                      'Whole-sale',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.800000011920929),
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Ksh',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        ),
                      ),
                      Text(
                        widget.price!.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                      ),
                      const Text(
                        '/kg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                      ),
                    ],
                  )),
                ],
              )),
            ),
            //retail price
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Text(
                      'Retail Price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.800000011920929),
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Ksh',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        ),
                      ),
                      Text(
                        widget.price!.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                      ),
                      const Text(
                        '/kg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                      ),
                    ],
                  )),
                ],
              )),
            ),
            //location
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Iconify(
                  Ic.baseline_location_on,
                  size: 24,
                ),
                Text(widget.county!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        )),
              ],
            )),
          ]),
        ]));
  }
}
