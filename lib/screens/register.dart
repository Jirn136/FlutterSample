import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/constants.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  final TextEditingController _nameController = TextEditingController();
  int _age = 0;
  final TextEditingController _ageController = TextEditingController();
  String _emailId = '';
  final TextEditingController _emailIdController = TextEditingController();
  String _location = '';
  final TextEditingController _locationController = TextEditingController();
  String _password = '';
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PreferenceUtils prefs = PreferenceUtils();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Register',
          style: TextStyle(
            letterSpacing: 1.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Container(
        decoration: customBoxDecoration,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Stack(children: [
                          const Positioned(
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.face,
                                size: 50.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70.0,
                            top: 70.0,
                            child: IconButton(
                              onPressed: () {
                                customToast('Coming soon');
                              },
                              icon: const CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.black,
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        child: TextFormField(
                          cursorColor: Colors.green[300],
                          textInputAction: TextInputAction.next,
                          decoration: customInputDecoration('Name'),
                          controller: _nameController,
                          onChanged: (_) {
                            saveFormState(_formKey);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name should not be empty";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _name = value!;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Colors.green[300],
                                textInputAction: TextInputAction.next,
                                maxLength: 2,
                                controller: _ageController,
                                onChanged: (_) {
                                  saveFormState(_formKey);
                                },
                                validator: (value) {
                                  try {
                                    if (value != null) {
                                      final age = int.parse(value);
                                      if (value.isEmpty ||
                                          age.clamp(10, 60) != age) {
                                        return '10 to 60';
                                      }
                                    }
                                  } catch (e) {
                                    e.toString();
                                    return '10 to 60';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _age = int.parse(value!);
                                },
                                // Adjust the maximum length for
                                keyboardType: TextInputType.number,
                                decoration: customInputDecoration('Age'),
                                style: const TextStyle(height: 1),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: const TextStyle(height: 1),
                                cursorColor: Colors.green[300],
                                textInputAction: TextInputAction.next,
                                decoration: customInputDecoration('Location'),
                                controller: _locationController,
                                onSaved: (value) {
                                  _location = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Location needed';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  saveFormState(_formKey);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.green[300],
                          textInputAction: TextInputAction.next,
                          decoration: customInputDecoration('Email id'),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailIdController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _emailId = value!;
                          },
                          onChanged: (_) {
                            saveFormState(_formKey);
                          }, // Use phone keyboard type
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.green[300],
                          textInputAction: TextInputAction.done,
                          decoration: customInputDecoration('Password'),
                          obscureText: true,
                          maxLength: 15,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (!isPasswordValid(value)) {
                              return 'password must be alphanumeric and case sensitive';
                            }
                            if (value.length.clamp(8, 15) != value.length) {
                              return 'password length must have 8 to 15 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                          onChanged: (_) {
                            saveFormState(_formKey);
                          }, // Use phone keyboard type
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[400],
                              minimumSize: const Size(190.0, 50.0)),
                          onPressed: () {
                            if (saveFormState(_formKey)) {
                              prefs.save(Constants.username, _name);
                              prefs.save(Constants.emailId, _emailId);
                              prefs.save(Constants.age, _age);
                              prefs.save(Constants.password, _password);
                              prefs.save(Constants.location, _location);

                              Navigator.of(context)
                                  .pushReplacementNamed("/list_screen");
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
