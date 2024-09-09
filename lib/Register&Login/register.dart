import 'package:coinforge/navbar.dart';
import 'package:coinforge/utils/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Register extends StatelessWidget {
  final PageController _pageController = PageController();
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  TextEditingController _fNamecontroller = TextEditingController();
  TextEditingController _lNamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _phoneNumbercontroller = TextEditingController();

  Register({super.key});

  void printUsers(List<User> users) {
    for (var user in users) {
      print(user); // This will now use the custom toString method
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(),
        ),
        centerTitle: true,
      ),
      body: Obx(() => PageView(
            controller: _pageController,
            // physics: const NeverScrollableScrollPhysics(), // Disable swiping manually
            onPageChanged: (index) =>
                registrationController.currentStep.value = index,
            children: [
              // Step 1: Create Account
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create your account',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text("First Name"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _fNamecontroller,
                        style: const TextStyle(
                            fontFamily: 'Montserrat', color: Colors.black54),
                        decoration: InputDecoration(
                          focusColor: Colors.blueAccent,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Last Name"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _lNamecontroller,
                        style: const TextStyle(
                            fontFamily: 'Montserrat', color: Colors.black54),
                        decoration: InputDecoration(
                          focusColor: Colors.blueAccent,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Email"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _emailcontroller,
                        style: const TextStyle(
                            fontFamily: 'Montserrat', color: Colors.black54),
                        decoration: InputDecoration(
                          focusColor: Colors.blueAccent,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Password"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _passwordcontroller,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black54,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.visibility_outlined),
                          suffixIconColor: Colors.black,
                          focusColor: const Color.fromRGBO(0, 3, 252, 1),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.check_box_rounded,
                          color: Colors.blueAccent,
                        )),
                        TextSpan(
                            text:
                                "I certify that I’m 18 years of age or older, and I agree to the User Agreement and Privacy Policy",
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 13))
                      ])),
                      const SizedBox(
                        height: 90,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).width * 0.15,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(15, 75, 167, 1)),
                          ),
                          onPressed: () async {
                            // final prefs = await SharedPreferences.getInstance();
                            // await prefs.setString('firstName', _fNamecontroller.text);
                            // await prefs.setString('lastName', _lNamecontroller.text);
                            // await prefs.setString('email', _emailcontroller.text);
                            // await prefs.setString('loggedEmail', _emailcontroller.text);
                            // await prefs.setString('password', _passwordcontroller.text);
                            // Validate form before moving to the next step
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          child: const Text(
                            "Create account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Step 2: 2-Step Verification
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Set up 2-step verification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Enter your phone number so we can text you an authentication code',
                      style: TextStyle(fontSize: 14, fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: DropdownButtonFormField<String>(
                            dropdownColor:
                                const Color.fromRGBO(215, 235, 250, 1),
                            decoration: InputDecoration(
                              focusColor: const Color.fromRGBO(0, 3, 252, 1),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              floatingLabelStyle:
                                  const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              labelText: 'Country',
                            ),
                            value: '+92',
                            items: const [
                              DropdownMenuItem(
                                value: '+92',
                                child: Text('+92'),
                              ),
                              DropdownMenuItem(
                                value: '+91',
                                child: Text('+91'),
                              ),
                              DropdownMenuItem(
                                value: '+86',
                                child: Text('+86'),
                              ),
                              DropdownMenuItem(
                                value: '+62',
                                child: Text('+62'),
                              ),
                              // Add more country codes here
                            ],
                            onChanged: (value) => registrationController
                                .countryCode.value = value!,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _phoneNumbercontroller,
                            decoration: InputDecoration(
                                focusColor: const Color.fromRGBO(0, 3, 252, 1),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(10)),
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.black),
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                labelText: 'Phone'),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) => registrationController
                                .phoneNumber.value = value,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).width * 0.15,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(15, 75, 167, 1)),
                        ),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          // await prefs.setString('phoneNumber', _phoneNumbercontroller.text);
                          // print(prefs.getString('phoneNumber'));
                          //--------------------------------------------------------------------------
                          // Create the User object
                          User newUser = new User();
                          newUser.firstName = _fNamecontroller.text;
                          newUser.lastName = _lNamecontroller.text;
                          newUser.email = _emailcontroller.text;
                          newUser.password = _passwordcontroller.text;
                          newUser.countryCode = registrationController.countryCode.value;
                          newUser.phoneNumber = _phoneNumbercontroller.text;


                          // Retrieve the current list of users from SharedPreferences
                          String? usersString = prefs.getString('users');
                          List<User> users = usersString != null
                              ? User.decode(usersString)
                              : [];

                          // Add the new user to the list
                          users.add(newUser);

                          // Save the updated list back to SharedPreferences
                          prefs.setString('users', User.encode(users));
                          prefs.setString('loggedEmail', _emailcontroller.text);

                          // Log for debugging
                          printUsers(users);

                          // Move to the next step

                          //--------------------------------------------------------------------------

                          // Validate phone number and then move to the next step
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Step 3: Enter Authentication Code
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter authentication code',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Enter the 4-digit code that we have sent to your phone number, ${registrationController.countryCode.value} ${registrationController.phoneNumber.value}',
                      style: const TextStyle(
                          fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      style: const TextStyle(
                          fontFamily: 'Montserrat', color: Colors.black54),
                      decoration: InputDecoration(
                        focusColor: Colors.blueAccent,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black26),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).width * 0.15,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(15, 75, 167, 1)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationMenu()));
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).width * 0.15,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.grey.shade300),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class RegistrationController extends GetxController {
  var currentStep = 0.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var countryCode = '+92'.obs;
  var phoneNumber = ''.obs;
  var verificationCode = ''.obs;

  Future<void> saveRegistrationData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName.value.toString());
    await prefs.setString('lastName', lastName.value.toString());
    await prefs.setString('email', email.value.toString());
    await prefs.setString('password', password.value.toString());
    await prefs.setString('phoneNumber', phoneNumber.value.toString());
    print(firstName);
  }
}
