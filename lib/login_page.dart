import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
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
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Stack(
                children: <Widget>[
                  loginForm(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Text("계정이 없으신가요? 계정 만들기"),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ],
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
                            icon: Icon(Icons.account_circle), labelText: "아이디"),
                        validator: (value) =>
                            value.isEmpty ? '아이디를 입력하세요.' : null,
                      ),
                      TextFormField(
                        controller: pwController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), labelText: "패스워드"),
                        validator: (value) =>
                            value.isEmpty ? '패스워드를 입력하세요.' : null,
                      ),
                      Text("비밀번호를 잃어 버리셨습니까?"),
                    ],
                  ))),
        ));
  }
}
