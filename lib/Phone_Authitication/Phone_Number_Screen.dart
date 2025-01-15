import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pureit/utils/utils.dart';
import 'package:pureit/Phone_Authitication/Verify_Screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  String selectedCode = ' +01';
  String selectedCountry = 'Pakistan';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                selectedCode = '+${country.phoneCode}';
                                selectedCountry = country.name;
                              });
                            },
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 74, 2, 87))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedCode,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: 'Enter phone number',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 50, 10, 30),
                width: 300,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    FocusScope.of(context).unfocus();
                    debugPrint(selectedCode.toString() +
                        phoneController.text.toString());

                    await _auth.verifyPhoneNumber(
                      phoneNumber: selectedCode.toString() +
                          phoneController.text.toString(),
                      verificationCompleted: (PhoneAuthCredential credential) {
                        setState(() {
                          debugPrint('in verify phone number case');
                          isLoading = false;
                        });
                      },
                      verificationFailed: (e) {
                        Utils.toastMessage(e.toString());
                        setState(() {
                          debugPrint('in verification field  case');
                          isLoading = false;
                        });
                      },
                      codeSent: (String verficationCode, int? reSendtoken) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyScreen(
                                verificationId: verficationCode,
                              ),
                            ));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils.toastMessage(e.toString());
                        setState(() {
                          debugPrint('in timeout case case');
                          isLoading = false;
                        });
                      },
                    );
                  },
                  child: isLoading == true
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
