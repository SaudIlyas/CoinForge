import 'package:coinforge/Components/main_wallet.dart';
import 'package:coinforge/appbar.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(
        title: "My Wallet",
        actionIcon: Icons.receipt_long_rounded,
        leadingIconPresent: false,
        color: Colors.black,
        bgColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.5,
                ),
                const Positioned(
                  left: 20,
                  right: 20,
                  bottom: 0,
                  child: MainWallet(),
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.3,
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).width * 0.2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(35, 35, 35, 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Wallet Id: ", style: TextStyle(color: Colors.grey, fontSize: 17, fontWeight: FontWeight.bold)),
                                TextSpan(text: "540911745",  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold))
                              ]
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Transactions", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: const Card(
                  color: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(width: 5,),
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                                ),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                        Text("ForgeCoin", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                        Text("FGC")
                                      ],
                                    ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                        Text("\$149.92", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                        Text("0.0062 FGC")
                                  ],
                                ),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(width: 5,),
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                                ),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("ForgeCoin", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                    Text("FGC")
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("\$149.92", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                    Text("0.0062 FGC")
                                  ],
                                ),
                                SizedBox(width: 5,),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(width: 5,),
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                                ),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("ForgeCoin", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                    Text("FGC")
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("\$149.92", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                    Text("0.0062 FGC")
                                  ],
                                ),
                                SizedBox(width: 5,),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
