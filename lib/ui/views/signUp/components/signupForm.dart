import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Email"),
          ),
          SizedBox(
            height: _size.height * 0.01,
          ),
          _buildEmail(),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Password"),
          ),
          SizedBox(
            height: _size.height * 0.01,
          ),
          _buildPasswordl(),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Confirm Password"),
          ),
          SizedBox(
            height: _size.height * 0.01,
          ),
          _buildConfirmPassword(),
        ],
      ),
    );
  }
}

Widget _buildEmail() {
  return TextFormField(
    decoration: InputDecoration(
      // labelText: "Email",
      hintText: "Password@gmail.com",
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(3)),
    ),
    keyboardType: TextInputType.emailAddress,
  );
}

Widget _buildPasswordl() {
  return TextFormField(
    obscuringCharacter: "*",
    decoration: InputDecoration(
        // labelText: "Email",
        hintText: "Password",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(3),
        ),
        suffixIcon: Icon(Icons.remove_red_eye)),
  );
}

Widget _buildConfirmPassword() {
  return TextFormField(
    obscuringCharacter: "*",
    decoration: InputDecoration(
        // labelText: "Email",
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(3),
        ),
        suffixIcon: Icon(Icons.remove_red_eye)),
  );
}
