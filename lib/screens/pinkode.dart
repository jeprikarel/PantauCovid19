import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pantaucovid19/components/inputfield.dart';
import 'package:pantaucovid19/components/primary_btn.dart';
import 'package:pantaucovid19/components/toast_util.dart';
import 'package:intl/intl.dart';

class PinKodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: PinKode(),
      ),
    );
  }
}

class PinKode extends StatefulWidget {
  @override
  _PinKodeState createState() => _PinKodeState();
}

class _PinKodeState extends State<PinKode> {
  var pinKodeController = TextEditingController();
  // DateTime now = DateTime.now();
  // String currentTime = new DateFormat("yyyy-mm-dd").format(now); 

  void pinkode(BuildContext context) {
    if (pinKodeController.text.isNotEmpty) {

      if (pinKodeController.text.toString() == "b3rc4" ) {
        Navigator.pushNamedAndRemoveUntil(
          context, "/mainscreen", (Route<dynamic> routes) => false);
      } else {
      ToastUtils.show("Pin Salah");  
      }
      
    } else {
      ToastUtils.show("Harap isi Pin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Bagian headers
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              color: Colors.yellow[800],
              child: SafeArea(
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_alert, size: 70, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "Pantau Covid19",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
        ),

        //Bagian field login
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: <Widget>[
              InputField(
                action: TextInputAction.done,
                type: TextInputType.text,
                controller: pinKodeController,
                hintText: "PIN",
                secureText: true,
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: PrimaryButton(
                  color: Colors.yellow[800],
                  text: "MASUK",
                  onClick: () => pinkode(context),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
