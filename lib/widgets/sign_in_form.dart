import 'package:flutter/material.dart';
import 'package:instagram/constants/auth_input_decor.dart';
import 'package:instagram/constants/common_size.dart';
import 'package:instagram/home_page.dart';
import 'package:instagram/widgets/or_divider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              TextFormField(
                // controller: _emailController,
                initialValue: "test@test.net",
                cursorColor: Colors.black54,
                decoration: textInputDecor('이메일'),
                validator: (text) {
                  if (text!.isNotEmpty && text.contains("@")) {
                    return null;
                  } else {
                    return '정확한 이메일 주소를 입력해주세요';
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                // controller: _pwController,
                initialValue: "qqqqqq",
                cursorColor: Colors.black54,
                obscureText: true,
                decoration: textInputDecor('비밀번호'),
                validator: (text) {
                  if (text!.isNotEmpty && text.length > 5) {
                    return null;
                  } else {
                    return '제대로 된 비밀번호를 입력해주세요';
                  }
                },
              ),

              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 12),
                  primary: Colors.blueAccent,
                  alignment: Alignment.centerRight
                ),
                child: Text("비밀번호를 잊어버리셨나요?"),
              ),
              SizedBox(
                height: common_s_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_s_gap,
              ),
              OrDivider(),
              TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.amberAccent,
                  ),
                  icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                  label: Text("카카오톡 로그인"))
            ],
          ),
        ),
      ),
    );
  }

  Padding _submitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: common_gap),
      child: SizedBox(
        height: 42,
        child: FlatButton(
          color: Colors.blue,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print("유효성검사 통과");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          child: Text('로그인', style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}