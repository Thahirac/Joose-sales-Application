import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joosesales/localization/app_localization.dart';
import 'package:joosesales/pages/login_page.dart';
import 'package:joosesales/pages/purchase_page.dart';
import 'package:joosesales/pages/redeem_page.dart';
import 'package:joosesales/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'joose_text_style.dart';



class drowerAfterlogin extends StatefulWidget {
  const drowerAfterlogin({Key? key}) : super(key: key);

  @override
  _drowerAfterloginState createState() => _drowerAfterloginState();
}

class _drowerAfterloginState extends State<drowerAfterlogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 90),
      // height: MediaQuery.of(context).size.height * 0.745,
      width: MediaQuery.of(context).size.width - 70,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(image: DecorationImage(image:  AssetImage( "assets/images/appBarimg.png"), fit: BoxFit.cover,)),
              // color: Colors.red.shade800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 34,
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 60,left: 20),
                    child: JooseText(
                      text: AppLocalizations.of(context).translate("Menu"),
                      fontColor: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),

                ],
              ),
            ),
          ),



          ///New Purchase
          InkWell(
            splashColor: Colors.amber,
            hoverColor: Colors.amber,
            focusColor: Colors.amber,
            onTap: () {


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

              // Navigator.push(
              //   context,
              //   PageTransition(
              //       duration: Duration(milliseconds: 500),
              //       type: PageTransitionType.rightToLeft,
              //       child: settings(),
              //       inheritTheme: true,
              //       ctx: context),
              // );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 10),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey.shade600,width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        "assets/images/shopping-cart-solid.png",
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                   JooseText(
                    text: AppLocalizations.of(context).translate("Purchase"),
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )
                ],
              ),
            ),
          ),



          ///Redeem
          InkWell(
            splashColor: Colors.amber,
            hoverColor: Colors.amber,
            focusColor: Colors.amber,
            onTap: () {

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

              // Navigator.push(
              //   context,
              //   PageTransition(
              //       duration: Duration(milliseconds: 500),
              //       type: PageTransitionType.rightToLeft,
              //       child: settings(),
              //       inheritTheme: true,
              //       ctx: context),
              // );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 10),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey.shade600,width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        "assets/images/gift.png",
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  JooseText(
                    text: AppLocalizations.of(context).translate("Redeem"),
                    fontColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          ),



          ///SETTINGS
          InkWell(
            splashColor: Colors.amber,
            hoverColor: Colors.amber,
            focusColor: Colors.amber,
            onTap: () {

              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  settings(),
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


              // Navigator.push(
              //   context,
              //   PageTransition(
              //       duration: Duration(milliseconds: 500),
              //       type: PageTransitionType.rightToLeft,
              //       child: settings(),
              //       inheritTheme: true,
              //       ctx: context),
              // );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 10),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey.shade600,width: 1.5)),
                    child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.settings,size: 25,color: Colors.grey.shade700,)
                    ),
                  ),
                  JooseText(
                    text: AppLocalizations.of(context).translate('Settings'),
                    fontColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          ),


          const Expanded(child: SizedBox()),

          ///LOGOUT
          GestureDetector(
            onTap: () async{
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();

              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Login(),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.redAccent.shade700,),
                  width: 120,
                  height: 45,

                  margin: const EdgeInsets.only(
                      left: 30, top: 0, bottom: 15, right: 30),
                  child: Center(
                    child: JooseText(
                      text:  AppLocalizations.of(context).translate('Logout'),
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}



