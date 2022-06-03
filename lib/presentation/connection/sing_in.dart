import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_house/constantes.dart';
import 'package:job_house/widget/customs_buttom.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? profil;
  bool loading = true;


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            'asset/img/logo.jpg',
            width: 100,
            height: 50,
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Image.asset(
                  "asset/img/pass.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 3.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Text("welcome back ",
                          style: secondaryText.copyWith(fontSize: 17))),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // final XFile? photo  = await _picker.pickImage(source: ImageSource.camera);
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            width: 50,
                            height: 50,
                            child: profil != null
                                ? Image.file(
                                    profil!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.add_a_photo),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primaryCouleur,
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  margin: const EdgeInsets.all(9),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          
                          decoration: const InputDecoration(
                            labelText: "Mail",
                            icon: Icon(Icons.mail),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            }
                            return 'invalid email';
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "PassWord",
                            icon: Icon(Icons.keyboard_alt_rounded),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value == 8) {
                              return 'le mot de passe doit avoir 8 caracteres';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Forgot Password ?",
                              style: TextStyle(color: primaryCouleur),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomButton(
                          name: "Se connecter",
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                        ),
                        // Column(
                        //   children: [
                        //     const Center(child: Text("or sign in with")),
                        //     const SizedBox(
                        //       height: 9,
                        //     ),
                        //     Row(
                        //       children: [
                        //         Image.asset(
                        //           'asset/img/go.png',
                        //           width: 100,
                        //           height: 20,
                        //         ),
                        //         Image.asset(
                        //           'asset/img/facebook.png',
                        //           width: 100,
                        //           height: 20,
                        //         ),
                        //         Image.asset(
                        //           'asset/img/twitter.png',
                        //           width: 100,
                        //           height: 20,
                        //         )
                        //       ],
                        //     )
                        //   ],
                        // )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
