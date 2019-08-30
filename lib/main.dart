import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOJO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_background(), _form()],
      ),
    );
  }

  Widget _background() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("resources/images/bg.jpg"), fit: BoxFit.cover)),
    );
  }

  Widget _form() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 14, right: 14),
      child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _getLogo(),
                _getEmailFormField(),
                _getPasswordFormField(),
                _getLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLogo() {
    return Image.asset(
      "resources/images/flutter.png",
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }

  Widget _getLoginButton() {
    return FlatButton(
      onPressed: () {
        _formKey.currentState.validate();
      },
      color: Colors.white,
      child: Text("Login"),
    );
  }

  TextFormField _getEmailFormField() {
    return _getDefaultFormField("E-mail", "Invalid e-mail", false);
  }

  TextFormField _getPasswordFormField() {
    return _getDefaultFormField("Password", "Invalid password", true);
  }

  TextFormField _getDefaultFormField(
      String hintText, String errorMessage, bool obscureText) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 18,
              backgroundColor: Colors.transparent,
              color: Colors.grey),
          border: _getDefaultFormFieldsBorder(),
          enabledBorder: _getDefaultFormFieldsBorder(),
          focusedBorder: _getDefaultFormFieldsBorder(),
          disabledBorder: _getDefaultFormFieldsBorder(),
          errorBorder: _getDefaultFormFieldsBorder(),
          focusedErrorBorder: _getDefaultFormFieldsBorder()),
      style: TextStyle(
        color: Colors.white,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }

  UnderlineInputBorder _getDefaultFormFieldsBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
