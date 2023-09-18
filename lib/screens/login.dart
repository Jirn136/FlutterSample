import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/register.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';

import '../utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  final PreferenceUtils prefs = PreferenceUtils();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.green;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: customBoxDecoration,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.green[300],
                        decoration: customInputDecoration('Email id'),
                        controller: _emailIdController,
                        onChanged: (_) {
                          saveFormState(_formKey);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email address';
                          }

                          if (value != prefs.getString(Constants.emailId)) {
                            return 'Email id is not registered';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.green[300],
                        decoration: customInputDecoration('Password'),
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

                          if (value != prefs.getString(Constants.password)) {
                            return "Password doesn't match";
                          }
                          return null;
                        },
                        onChanged: (_) {
                          saveFormState(_formKey);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: CheckboxListTile(
                        fillColor: MaterialStateColor.resolveWith(getColor),
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        side: MaterialStateBorderSide.resolveWith((states) =>
                            const BorderSide(width: 1.0, color: Colors.green)),
                        title: const Text(
                          'Remember Me',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[400],
                              minimumSize: const Size(190.0, 50.0)),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (saveFormState(_formKey)) {
                              prefs.save(Constants.isChecked, _isChecked);
                              Navigator.of(context).pushReplacementNamed("/list_screen");
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: RichText(
                        selectionColor: Colors.blue,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'No Account? ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                  decoration: TextDecoration.none,
                                  fontSize: 10.0),
                            ),
                            TextSpan(
                                text: 'Click here',
                                style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.blue,
                                    decorationColor: Colors.green,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.solid),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Register()));
                                  }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
