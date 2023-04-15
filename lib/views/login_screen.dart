import 'package:flutter/material.dart';
import 'package:provider_counter/resources/components/roundbutton.dart';
import 'package:provider_counter/utils/routes/routes_name.dart';
import 'package:provider_counter/utils/utils.dart';
import 'package:provider_counter/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.FieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                }),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) => TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword.value,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obscurePassword.value = !_obscurePassword.value;
                      },
                      child: Icon(Icons.visibility_off_outlined),
                    )),
              ),
            ),
            SizedBox(
              height: height * .085,
            ),
            RoundButon(
                title: 'Login',
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.SnakBar('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMesssage(
                        'Please enter password', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMesssage(
                        'Please enter 6 digit password', context);
                  } else {
                    print('API hit');
                  }
                }),
            RoundButon(title: 'Sign Up', onPress: () {},
           ),
          ],
        ),
      ),
    );
  }
}
