import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController _fNamecontroller = TextEditingController();
  TextEditingController _uNamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phoneNumbercontroller = TextEditingController();
  String firstName = "";
  String lastName = "";
  String email = "";
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    // Call your function here
    loadPreferences();
    print(lastName);
  }

  Future<void> loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? '';
      lastName = prefs.getString('lastName') ?? '';
      email = prefs.getString('email') ?? '';
      phoneNumber = prefs.getString('phoneNumber') ?? '';

      _fNamecontroller.text = "$firstName $lastName";
      _uNamecontroller.text = firstName + lastName;
      _emailcontroller.text = email;
      _phoneNumbercontroller.text = phoneNumber;
    });
  }

  // TextEditingController _fNamecontroller = TextEditingController();
  // TextEditingController _lNamecontroller = TextEditingController();
  // TextEditingController _emailcontroller = TextEditingController();
  // TextEditingController _passwordcontroller = TextEditingController();
  // TextEditingController _phoneNumbercontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Edit Profile"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _fNamecontroller ,
                  style: const TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black54),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(206, 226, 240, 0.5),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "User Name",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _uNamecontroller,
                  style: const TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black54),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(206, 226, 240, 0.5),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _emailcontroller,
                  style: const TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black54),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(206, 226, 240, 0.5),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _phoneNumbercontroller,
                  keyboardType: const TextInputType.numberWithOptions(),
                  style: const TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black54),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(206, 226, 240, 0.5),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        dropdownColor: const Color.fromRGBO(215, 235, 250, 1),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(206, 226, 240, 0.5),
                          focusColor: const Color.fromRGBO(0, 3, 252, 1),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Country',
                        ),
                        value: '+92',
                        items: const [
                          DropdownMenuItem(
                            value: '+92',
                            child: Text('Pakistan'),
                          ),
                          DropdownMenuItem(
                            value: '+91',
                            child: Text('India'),
                          ),
                          DropdownMenuItem(
                            value: '+86',
                            child: Text('China'),
                          ),
                          DropdownMenuItem(
                            value: '+62',
                            child: Text('USA'),
                          ),
                          // Add more country codes here
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        dropdownColor: const Color.fromRGBO(215, 235, 250, 1),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(206, 226, 240, 0.5),
                          focusColor: const Color.fromRGBO(0, 3, 252, 1),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Gender',
                        ),
                        value: 'M',
                        items: const [
                          DropdownMenuItem(
                            value: 'M',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'F',
                            child: Text('Female'),
                          ),
                          // Add more country codes here
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(15, 75, 167, 1)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}
