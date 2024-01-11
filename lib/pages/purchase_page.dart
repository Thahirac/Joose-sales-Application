import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joosesales/localization/app_localization.dart';
import 'package:joosesales/pages/purchase_dtls_page.dart';
import 'package:joosesales/widgets/drawer.dart';
import 'package:joosesales/widgets/joose_text_style.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'dash_board.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  GlobalKey<ScaffoldState>? _key = GlobalKey();
  var qty_controller = TextEditingController();
  bool _isloading=false;
  String? barcodeScanRes;
  Future<void> scanQR() async {

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      if(barcodeScanRes!="-1"){

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Purchase_Details(skey: barcodeScanRes,qty: qty_controller.text,),
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
            transitionDuration: Duration(milliseconds: 400),
          ),
        );
      }

      setState(() {
        _isloading=false;
      });

    } on PlatformException {

      setState(() {
        _isloading=false;
      });

      barcodeScanRes = 'Failed to get platform version.';
    }


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drowerAfterlogin(),
      key: _key,
      resizeToAvoidBottomInset: true,
      appBar:  AppBar(
        leading: IconButton(
            onPressed: (){
              _key!.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu_rounded,size: 30,color: Colors.white,)),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 0.01,
        flexibleSpace: Container(
          decoration:
          const BoxDecoration(
            image: DecorationImage(
              image: AssetImage( "assets/images/appbarimg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:  JooseText(
          text: AppLocalizations.of(context).translate("PURCHASE"),
          fontColor: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),

      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          //color: Colors.white
          image: DecorationImage(
            image: AssetImage("assets/images/Canvas.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [


              //Back Button
              Container(
                  margin: EdgeInsets.only(left: 10, top: 10,bottom: 100),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => Dashboard(),
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
                              transitionDuration: Duration(milliseconds: 400),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),

                    ],
                  )),

              Align(
                  alignment: Alignment.center,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/scand.gif"), fit: BoxFit.contain),
                    ),
                    child: Center(child: Image.asset(
                      "assets/images/qr.png",
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250,
                    ),
                   ),
                  ),

              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30,top: 20),
                child: InkWell(
                  splashColor: Color.fromARGB(255,255,111,0),
                  highlightColor: Colors.white,
                  focusColor: Colors.white,
                  onTap: (){

                    if(qty_controller.text.isNotEmpty){

                      setState(() {
                        _isloading=true;
                      });

                      scanQR();

                    }
                    else{

                      Fluttertoast.showToast(
                          msg:  AppLocalizations.of(context).translate("Please enter quantity"),
                          backgroundColor: Colors.amber,
                          textColor: Colors.black,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 2,
                          fontSize: 16.0
                      );

                    }




                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(
                          colors: [

                            Color.fromARGB(255,255,111,0),
                            Color.fromARGB(255,247,79,15),
                            Color.fromARGB(255,247,79,15),
                            Color.fromARGB(255,232,22,43)
                            //add more colors for gradient
                          ],
                          begin: Alignment.topLeft, //begin of the gradient color
                          end: Alignment.bottomRight, //end of the gradient color
                          stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                        //set the stops number equal to numbers of color
                      ),
                    ),
                    child: Center(
                      child:  _isloading ? const Padding(padding: EdgeInsets.all(10.0), child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 1,color: Colors.white,)),) : JooseText(
                        text: AppLocalizations.of(context).translate("Scan"),
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15), //border corner radius
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 2, //spread radius
                      blurRadius: 3, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: TextFormField(
                 controller: qty_controller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    filled: true,
                    hintText:  AppLocalizations.of(context).translate("Quantity"),
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor("28292C")),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }


}
