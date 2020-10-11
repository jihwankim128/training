import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void _validate() {
    if (formKey.currentState.validate()) print("succes");
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //container
              Stack(
                children: <Widget>[
                  loginForm(size),
                  loginButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Text("계정이 없으신가요? Create Account"),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: RaisedButton(
        child: Text(
          '로그인',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: _validate,
      ),
    );
  }

  Widget loginForm(Size size) {
    return Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 12, bottom: 32),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: idController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "이메일"),
                        validator: (value) =>
                            value.isEmpty ? 'ex) xxxxx@narasarang.or.kr' : null,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: pwController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), labelText: "패스워드"),
                        validator: (value) =>
                            value.isEmpty ? '패스워드를 입력하세요.' : null,
                      ),
                      Text(""),
                      Text("비밀번호가 기억나지 않습니까?"),
                    ],
                  ))),
        ));
  }
}
