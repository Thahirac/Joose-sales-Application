import 'package:flutter/material.dart';
import 'package:joosesales/localization/app_localization.dart';
import 'package:joosesales/pages/purchase_page.dart';
import 'package:joosesales/pages/redeem_page.dart';
import 'package:joosesales/widgets/drawer.dart';
import 'package:joosesales/widgets/joose_text_style.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>? _key = GlobalKey();



    return Scaffold(
      drawer:  const drowerAfterlogin(),
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow.shade700,
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 30),
                      child: IconButton(onPressed: (){
                        _key.currentState!.openDrawer();

                      },  icon: Icon(Icons.menu_rounded,size: 30,color: Colors.white,),
                      ),
                    ),


                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(
                      top: 67,left: 40),
                  child: JooseText(
                    text: AppLocalizations.of(context).translate("Dashboard"),
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
              ],
            ),
            height: 190.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.yellow.shade600,
                image: const DecorationImage(
                    image: AssetImage("assets/images/appBarimg.png"),
                    fit: BoxFit.fill
                ),
                boxShadow: [
                  const BoxShadow(color: Colors.yellow,spreadRadius: 0.5,blurRadius: 59)
                ]
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top:25),
              decoration:  const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),),color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [



                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => PurchasePage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var tween = Tween(begin: begin, end: end);
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), //color of shadow
                                spreadRadius: 2, //spread radius
                                blurRadius: 2, // blur radius
                                offset: const Offset(0, 1.0),
                              ) ]),
                            height: 130,width: 150,


                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/shopingCart.png",
                                  width: 70,
                                  height: 70,
                                ),
                                 Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: JooseText(
                                    text:AppLocalizations.of(context).translate("Purchase"),
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => RedeemPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var tween = Tween(begin: begin, end: end);
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), //color of shadow
                                spreadRadius: 2, //spread radius
                                blurRadius: 2, // blur radius
                                offset: const Offset(0, 1.0),
                              ) ]),
                            height: 130,width: 150,


                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/gift-solid.png",
                                  fit: BoxFit.contain,
                                  height: 70,
                                  width: 70,
                                ),
                                 Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: JooseText(
                                    text: AppLocalizations.of(context).translate("Redeem"),
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),


                    ],),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }


// Widget DashButton(icon,name,ontap){
//   return Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5), //color of shadow
//           spreadRadius: 2, //spread radius
//           blurRadius: 2, // blur radius
//           offset: const Offset(0, 1.0),
//         ) ]),
//       height: 130,width: 150,
//       child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children:[
//             RadiantGradientMask(
//                 child:  Icon(icon,color: Colors.white,size:50,)),   Text('$name',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700),)]));
// }
}


// class RadiantGradientMask extends StatelessWidget {
//   RadiantGradientMask({required this.child});
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => const RadialGradient(
//         center: Alignment.center,
//         radius: 0.8,
//         colors: [Colors.pink,Colors.orangeAccent],
//         tileMode: TileMode.mirror,
//       ).createShader(bounds),
//       child: child,
//     );
//   }
//
// }





















