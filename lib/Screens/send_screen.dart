import 'package:coinforge/appbar.dart';
import 'package:flutter/material.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(
          title: "Withdraw Money",
          actionIcon: Icons.info_outline_rounded,
          leadingIconPresent: true,
          color: Colors.black,
          bgColor: Colors.white,
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("To", style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            TextField(
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                hintText: "Account No",
                hintStyle: const TextStyle(fontFamily: "SpaceGrotesk"),
                suffixIcon: const Icon(Icons.qr_code, color: Colors.blueAccent,),
                suffixIconColor: Colors.black,
                focusColor: const Color.fromRGBO(0, 3, 252, 1),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Amount", style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                hintText: "Amount",
                hintStyle: const TextStyle(fontFamily: "SpaceGrotesk"),
                focusColor: const Color.fromRGBO(0, 3, 252, 1),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width*0.15,
              child: DropdownButtonFormField<String>(
                icon: Icon(Icons.wallet_rounded),
                decoration: InputDecoration(
                  focusColor: const Color.fromRGBO(0, 3, 252, 1),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(40)
                  ),
                ),
                value: 'MW',
                items: const [
                  DropdownMenuItem(
                    value: 'MW',
                    child: Text('Main Wallet', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width*0.15,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(15, 75, 167, 1)),
                ),
                onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SendScreen()));
                },
                child: const Text("Send", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
