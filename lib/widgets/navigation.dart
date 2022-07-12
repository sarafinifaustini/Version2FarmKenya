import 'package:flutter/material.dart';


class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator NavbarWidget - COMPONENT
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 360,
          height: 60,

          child: Stack(
              children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 360,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color : Color.fromRGBO(231, 238, 233, 1),
                        )
                    )
                ),Positioned(
                    top: 9,
                    left: 17.454544067382812,
                    child: Container()
                ),Positioned(
                    top: 9,
                    left: 86.18181610107422,
                    child: Container()
                ),Positioned(
                    top: 9,
                    left: 223.63636779785156,
                    child: Container()
                ),Positioned(
                    top: 9,
                    left: 154.90908813476562,
                    child: Container()
                ),Positioned(
                    top: 9,
                    left: 292.3636474609375,
                    child: Container()
                ),
              ]
          )
      ),
    );
  }
}
