import 'package:coinforge/Register&Login/login.dart';
import 'package:coinforge/Register&Login/register.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
            
          }, child: const Text("Sign in", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),))
        ],
      ),
      body: Padding(
        padding: const  EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Container(
                    height: MediaQuery.sizeOf(context).height*0.386,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/Images/Welcome.png"), fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Earn & Sell Crypto in one app", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),softWrap: true, textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  const Text("It's easier to make cryptocurrency transactions in your hand, wherever and whenever. Get the lowest fees ever!", textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 15, fontFamily: "Montserrat"),),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width*0.15,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(15, 75, 167, 1)),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                },
                child: const Text("Register - It’s free", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      )
    );
  }
}
