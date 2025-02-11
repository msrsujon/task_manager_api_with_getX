import 'package:flutter/material.dart';
import 'package:task_manager_api/api/apiClient.dart';
import '../../style/style.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  Map<String, String> FormValues = {"email": "", "password": ""};
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required !');
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required !');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await LoginRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : (SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Get Start With', style: Head1Text(colorDarkBlue)),
                        SizedBox(height: 1),
                        Text('Leran with Suzon Islam',
                            style: Head6Text(colorLightGray)),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("email", Textvalue);
                          },
                          decoration: AppInputDecoration('Email'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("password", Textvalue);
                          },
                          decoration: AppInputDecoration('Password'),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild('Login'),
                              onPressed: () {
                                FormOnSubmit();
                              }),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/emailVerification');
                                },
                                child: Text('Forgot Password'),
                              ),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/registration');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have a account?",
                                        style: Head7Text(colorDarkBlue)),
                                    Text(" SignUp",
                                        style: Head7Text(colorGreen))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
