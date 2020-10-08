import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/container/image_background.dart';
import 'package:ohmyfood_flutter/components/form/filled_input.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = 'SignupScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  String _usernameErrorText = '';
  String _phoneErrorText = '';
  String _passwordErrorText = '';
  String _confirmErrorText = '';
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: ImageBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Text(''),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Sign up with',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: kBlueColor,
                          ),
                        ),
                      ),
                      FilledInput(
                        controller: _usernameController,
                        errorText: _usernameErrorText,
                        onChanged: (text) {
                          setState(() {
                            _usernameErrorText = '';
                            if (text.isEmpty) {
                              _usernameErrorText =
                                  'Username must not be empty!';
                            }
                          });
                        },
                        hintText: 'Name',
                      ),
                      FilledInput(
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        errorText: _phoneErrorText,
                        onChanged: (text) {
                          setState(() {
                            _phoneErrorText = '';
                            if (text.length < 9 || text.length > 11) {
                              _phoneErrorText =
                                  'Phone number must between 9 and 11 characters!';
                            }
                          });
                        },
                        hintText: 'Phone number',
                      ),
                      FilledInput(
                        obscureText: true,
                        controller: _passwordController,
                        errorText: _passwordErrorText,
                        onChanged: (text) {
                          setState(() {
                            _passwordErrorText = '';
                            if (text.isEmpty) {
                              _passwordErrorText =
                                  'Password must not be empty!';
                            }
                          });
                        },
                        hintText: 'Password',
                      ),
                      FilledInput(
                        obscureText: true,
                        controller: _confirmController,
                        errorText: _confirmErrorText,
                        onChanged: (text) {
                          setState(() {
                            _confirmErrorText = '';
                            if (text.isEmpty) {
                              _confirmErrorText = 'Password does not match!';
                            }
                          });
                        },
                        hintText: 'Re-enter password',
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: _agree,
                                onChanged: (checked) {
                                  setState(() {
                                    _agree = checked;
                                  });
                                }),
                            Text(
                              'I agree with terms and condition',
                              style: TextStyle(
                                color: kLabelColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              title: 'Sign up',
                              color: kBlueColor,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
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
