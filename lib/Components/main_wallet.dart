 import 'package:flutter/material.dart';

class MainWallet extends StatelessWidget {
  const MainWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(             //Card
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).width * 0.4,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(8, 51, 117, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 13),
            child: Text("Main Wallet", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 18, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Balance", style: TextStyle(color: Colors.grey.shade300, fontFamily: "Montserrat", fontSize: 15),),
                    const SizedBox(height: 5,),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: "\$349.92",style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                          TextSpan(text: " USD", style: TextStyle(color: Colors.grey.shade300, fontFamily: "Montserrat")),
                        ]
                      )
                    ),
                    Text("0.015 FGC", style: TextStyle(color: Colors.grey.shade300, fontFamily: "Montserrat")),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monthly Profit", style: TextStyle(color: Colors.grey.shade300, fontFamily: "Montserrat", fontSize: 15),),
                    const SizedBox(height: 5,),
                    Text.rich(
                        TextSpan(
                            children: [
                              const TextSpan(text: "\$16.64",style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                              TextSpan(text: " USD", style: TextStyle(color: Colors.grey.shade300, fontFamily: "Montserrat")),
                            ]
                        )
                    ),
                    Text("0.00078 FGC", style: TextStyle(color: Colors.grey.shade300, fontFamily: "Montserrat")),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
