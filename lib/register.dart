import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../assets/images/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.transparent,
        body: buildRegisterBody(context),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget buildRegisterBody(BuildContext context) {
    return Stack(
      children: [
        buildCreateAccountText(),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              right: 35,
              left: 35,
              top: MediaQuery.of(context).size.height * 0.27,
            ),
            child: Column(
              children: [
                buildNameTextField(),
                SizedBox(height: 30),
                buildEmailTextField(),
                SizedBox(height: 30),
                buildPasswordTextField(),
                SizedBox(height: 40),
                buildSignInButton(),
                SizedBox(height: 40),
                buildLoginOption(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCreateAccountText() {
    return Container(
      padding: const EdgeInsets.only(left: 35, top: 80),
      child: const Text(
        "Create\nAccount",
        style: TextStyle(color: Colors.white, fontSize: 33),
      ),
    );
  }

  Widget buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: 'Name',
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildEmailTextField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: 'Email',
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildSignInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xff4c505b),
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              signInWithEmailAndPassword();
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }

  Widget buildLoginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'login');
          },
          child: const Text(
            'Login',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void signInWithEmailAndPassword() async {
  try {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Registration successful, navigate to the next screen
    } else {
      // Display an error message or handle empty email/password fields
    }
  } catch (e) {
    // Display an error message or handle the authentication error
    print('Registration failed: $e');
  }
 }
}
