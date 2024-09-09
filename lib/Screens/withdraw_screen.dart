import 'package:coinforge/Screens/send_screen.dart';
import 'package:coinforge/appbar.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(title: "Withdraw", actionIcon: Icons.info_outline_rounded, leadingIconPresent: false, color: Colors.black, bgColor: Colors.white, centerTitle: false),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Search", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  TextField(
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black54,
                    ),
                    decoration: InputDecoration(
                      hintText: "Account No",
                      hintStyle: TextStyle(fontFamily: "SpaceGrotesk"),
                      suffixIcon: Icon(Icons.qr_code, color: Colors.blueAccent,),
                      suffixIconColor: Colors.black,
                      focusColor: Color.fromRGBO(0, 3, 252, 1),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  const Text("Recent", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                              child: Icon(Icons.wallet_rounded),
                            ),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("0xasd23da....23f1", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                Text("sent 2 days ago")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("0.0021 FGC", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                            Text("\$44.85")
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                              child: Icon(Icons.wallet_rounded),
                            ),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("0xqgf5asd....ujfa", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                Text("sent 4 days ago")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("0.0011 FGC", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                            Text("\$23.49")
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                              child: Icon(Icons.wallet_rounded),
                            ),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("0xvwah5dr....5ffh", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                                Text("sent 1 Aug")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("0.0002 FGC", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                            Text("\$4.27")
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
          )),
      floatingActionButton: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(15, 75, 167, 1)),
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SendScreen()));
        },
        child: const Text("Send", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
