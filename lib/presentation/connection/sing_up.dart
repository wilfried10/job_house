import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_house/constantes.dart';
import 'package:job_house/data/model/user.dart';
import 'package:job_house/presentation/home.dart';
import 'package:job_house/widget/customs_buttom.dart';

import '../../data/provider/user_provider.dart';
import '../../services/shared_pref.dart';
import '../../widget/animation.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? profil;
  bool _isLoading = false;
  final UserProvider userManager = UserProvider();

  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final storageRef = FirebaseStorage.instance.ref().child("images");

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Animated(
              delay: 50,
              child: Image.asset(
                'asset/img/logo.jpg',
                width: 100,
                height: 50,
              ))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Animated(
            delay: 400,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "asset/img/login.png",
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
                    Text("New Account",
                        style: secondaryText.copyWith(fontSize: 25)),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) => SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: const Icon(Icons.camera),
                                            title: const Text("Camera"),
                                            onTap: () async {
                                              final XFile? photo =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.camera);

                                              if (photo != null) {
                                                setState(() {
                                                  profil = File(photo.path);
                                                });
                                              }
                                              Navigator.pop(
                                                context,
                                              );
                                            },
                                          ),
                                          ListTile(
                                            leading:
                                                const Icon(Icons.photo_sharp),
                                            title: const Text("Galerie"),
                                            onTap: () async {
                                              final XFile? photo =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (photo != null) {
                                                setState(() {
                                                  profil = File(photo.path);
                                                });
                                              }
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                            // final XFile? photo  = await _picker.pickImage(source: ImageSource.camera);
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            child: Container(
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
                        const Text('upload picture')
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
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
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
                            controller: username,
                            decoration: const InputDecoration(
                              labelText: "Username",
                              icon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: password,
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
                          CustomButton(
                            name: "S 'inscrire",
                            isLoading: _isLoading,
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                // if (profil != null) {
                                //   try {
                                //     final task =
                                //         await storageRef.putFile(profil!);
                                //   } on FirebaseException catch (e) {
                                //     // ...
                                //   }
                                // }

                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email.text.trim(),
                                    password: password.text.trim(),
                                  )
                                      .then((value) {
                                    userManager
                                        .addUserByDoc(
                                            value.user!.uid,
                                            UserModel(
                                                email.text.trim(),
                                                username.text.trim(),
                                                password.text.trim()))
                                        .then((value) {
                                      Shared.setConnect(true);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const Home()),
                                          (route) => false);
                                    });
                                  });
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Le mot de passe est faible')),
                                    );
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Email deja utilise ')),
                                    );
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }

                              setState(() {
                                _isLoading = false;
                              });
                            },
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
