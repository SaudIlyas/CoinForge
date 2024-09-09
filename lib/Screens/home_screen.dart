import 'dart:async';
import 'package:coinforge/appbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _tapper = false;
  double _time = 0;


  onStartPressed(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
        if(_time <= 0.99  && _tapper == true){
          setState(() {
            // _time= 0;
            timer.cancel();
          });

        } else if(_time <= 0.99) {
          setState(() {
            _time = _time + 0.01;
          });
        } else {
          setState(() {
            _time= 0;
            timer.cancel();
          });
        }
    });
  }
  onTapPressed(){
      if(_time <= 0.99){
        setState(() {
          _time = _time + 0.01;
        });
      } else {
        setState(() {
          _time= 0;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(
          title: "CoinForge",
          actionIcon: Icons.notifications_active_outlined,
          leadingIconPresent: false,
          color: Colors.black,
          bgColor: Colors.white,
          centerTitle: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width ,
                  height: MediaQuery.sizeOf(context).width * 0.15,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(8, 51, 117, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Daily Reward",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.sizeOf(context).width*0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: "Wallet Id: ", style: TextStyle(color: Colors.grey.shade700, fontSize: 17, fontWeight: FontWeight.bold)),
                          const TextSpan(text: "540911745",  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold))
                        ]
                    )
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Account Balance", style: TextStyle(fontFamily: "Montserrat"),),
                                const SizedBox(height: 4,),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text("0.015 FGC"),
                                  )
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text("Last 24-Hour Earning", style: TextStyle(fontFamily: "Montserrat"),),
                                const SizedBox(height: 4,),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text("0.0005 FGC"),
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                animationDuration: 1000,
                                radius: 140,
                                lineWidth: 30,
                                percent: _time,
                                progressColor: Colors.blueAccent,
                                backgroundColor: Colors.blue.shade100,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: TextButton(onPressed: _tapper == false && _time <= 0 ? onStartPressed : onTapPressed, child: Text(_tapper == false ? "S T A R T" : "T A P", style: TextStyle(fontFamily: "Montserrat", fontSize: 40, color: Colors.blueAccent, fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          ),
                        )
                      ),
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(15, 75, 167, 1)),
                    ),
                    onPressed: (){
                  if(_tapper == false){
                    setState(() {
                      _tapper = true;
                    });
                  } else {
                    setState(() {
                      _tapper = false;
                    });
                  }
                }, child: Text(_tapper == false ? "Use Tapper Instead" : "Use Timer Instead", style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
