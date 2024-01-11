import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joosesales/cubit/purchasE/purchase_cubit.dart';
import 'package:joosesales/localization/app_localization.dart';
import 'package:joosesales/models/purchase_dtls_class.dart';
import 'package:joosesales/pages/purchase_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joosesales/repository/purchaseRepo.dart';
import 'package:joosesales/utils/util.dart';
import 'package:joosesales/widgets/drawer.dart';
import 'package:joosesales/widgets/jooseAlert.dart';
import 'package:joosesales/widgets/joose_text_style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Purchase_Details extends StatefulWidget {
  final String? skey,qty;
  const Purchase_Details({Key? key,this.skey,this.qty}) : super(key: key);

  @override
  _Purchase_DetailsState createState() => _Purchase_DetailsState();
}

class _Purchase_DetailsState extends State<Purchase_Details> {

  GlobalKey<ScaffoldState>? _key = GlobalKey();

  late PurchaseCubit purchaseCubit;
  Purchasedetails? pdetails;


  @override
  void initState() {
    purchaseCubit = PurchaseCubit(DashBordRepository());
    super.initState();
    purchaseCubit.purchasedetails(widget.skey, widget.qty);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drowerAfterlogin(),
      key: _key,
      resizeToAvoidBottomInset: false,
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
          text: AppLocalizations.of(context).translate("PURCHASE DETAILS"),
          fontColor: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),

      ),

      body: SafeArea(
        child: BlocProvider(
            create: (context) => purchaseCubit,
            child: BlocListener<PurchaseCubit, PurchaseState>(
              bloc: purchaseCubit,
              listener: (context, state) {
                if (state is Initial) {}
                if (state is Loading) {
                } else if (state is Successfull) {
                  pdetails = state.pdetails;

                  Fluttertoast.showToast(
                      msg:  AppLocalizations.of(context).translate("Order Successfully!"),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);

                } else if (state is Faild) {
                  Utils.showDialouge(
                      context, AlertType.error,  AppLocalizations.of(context).translate("Oops"), state.msg);
                }

              },
              child: BlocBuilder<PurchaseCubit, PurchaseState>(
                  builder: (context, state) {
                    // print("gjgfjhfjf" + cart_count.toString());
                    if (state is Initial) {}
                    if (state is Loading) {
                      return Column(
                        children:  [
                          SizedBox(
                            height: MediaQuery.of(context).size.height* 0.45,
                          ),
                          const Center(
                            child: CupertinoActivityIndicator(
                              radius: 10,
                            ),
                          ),
                        ],
                      );
                    } else if (state is Successfull) {
                      return detailsform();
                    } else if (state is Faild) {
                      return detailsform();
                    }
                    else {
                      return Container();
                    }
                  }),
            )),
      ),

    );
  }

  Widget detailsform(){
    if(pdetails==null){
      return nopurchase();
    }else{
      var tempDate = pdetails?.purchaseDate==null ? "0000-00-00 00:00:00": pdetails?.purchaseDate;
      var correct = DateUtil().formattedDate(DateTime.parse(tempDate!));
      var tempDate1 = pdetails?.updatedAt==null? "0000-00-00 00:00:00" : pdetails?.updatedAt;
      var correct1 = DateUtil().formattedDate(DateTime.parse(tempDate1!));
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white
          // image: DecorationImage(
          //   image: AssetImage("assets/images/Canvas.png"),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              //Back Button
              Container(
                  margin: EdgeInsets.only(left: 20, top: 25,bottom: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {


                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) =>  PurchasePage(),
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
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),

                    ],
                  )),


              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text:  AppLocalizations.of(context).translate("Order Id") + ": #${pdetails?.id??""}",
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 5),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text: AppLocalizations.of(context).translate("Name") + ": ${pdetails?.name??""}",
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 5),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text: AppLocalizations.of(context).translate("Store") + ": ${pdetails?.storeId??""}",
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 5),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text: AppLocalizations.of(context).translate("Purchase status") + ": ${pdetails?.purchaseStatus??""}",
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 5),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text:AppLocalizations.of(context).translate("Purchase Date") +  ": " +  correct,
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 5),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text: AppLocalizations.of(context).translate("Updated At") + ": " + correct1,
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20,top: 5),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JooseText(
                            text:AppLocalizations.of(context).translate("Quantity")  + ": ${pdetails?.quantity??""}",
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30,top: 50),
                      child: InkWell(
                        splashColor: Color.fromARGB(255,255,111,0),
                        highlightColor: Colors.white,
                        focusColor: Colors.white,
                        onTap: (){

                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => PurchasePage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var tween = Tween(begin: begin, end: end);
                                var offsetAnimation =
                                animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration:
                              Duration(milliseconds: 500),
                            ),
                          );

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
                            child: JooseText(
                              text: AppLocalizations.of(context).translate("DONE") ,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),



            ],
          ),
        ),
      );
    }
  }

  Widget nopurchase(){
    return Column(
      children:  [
        SizedBox(
          height: MediaQuery.of(context).size.height* 0.23,
        ),
         Center(
          child: JooseText(text: AppLocalizations.of(context).translate("No Purchases found here"),fontColor: Colors.black, fontWeight: FontWeight.w600, fontSize: 20,),
        ),
        const SizedBox(height: 20),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.black,
              primary: Colors.redAccent.shade700,
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              child:  JooseText(
                text: AppLocalizations.of(context).translate("Return to Scan Page"),
                fontColor: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            onPressed: () {



              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  PurchasePage(),
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


              // Navigator.pushReplacement(
              //   context,
              //   PageTransition(
              //       duration: Duration(milliseconds: 500),
              //       type: PageTransitionType.leftToRight,
              //       child: Scanpage(),
              //       inheritTheme: true,
              //       ctx: context),
              // );

            },
          ),
        ),
      ],
    );
  }



}

class DateUtil {
  String formattedDate(DateTime dateTime) {
    return DateFormat.yMMMEd ().format (dateTime);
  }
}