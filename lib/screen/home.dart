import 'package:bmi_cal/widgets/left_bar.dart';
import 'package:bmi_cal/widgets/right_bar.dart';
import 'package:bmi_cal/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.5)
                      )
                    ),

                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.5)
                        )
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double x = double.parse(_heightController.text)/100;
                double y = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = y /(x * x);
                  if(_bmiResult >= 25 && _bmiResult <= 29.5){
                    _textResult = "Over weight";
                  }
                  else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "Normal Weight";
                  }
                  else if(_bmiResult < 18){
                    _textResult = "Under Weight";
                  }
                  else{
                    _textResult = "Obesse";
                  }

                });
                FocusScope.of(context).unfocus();

              },
            child: Container(
              child: Text("Calculate", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: accentHexColor,),),
            ),
          ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                setState(() {
                  _heightController.clear();
                  _weightController.clear();
                  _bmiResult = 0.00;
                  _textResult = "";

                });

              },
              child: Container(
                child: Text("Reset", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: accentHexColor,),),
              ),
            ),

            SizedBox(height: 40,),
            Container(child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(fontSize: 90, color: accentHexColor,),)
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: _textResult.isNotEmpty,
               child: Container(
                 child: Text(_textResult, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400,color: accentHexColor,),),
             ),
            ),
            SizedBox(height: 0,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 5,),
            RightBar(barWidth: 40,),
            SizedBox(height: 20,),
            RightBar(barWidth: 70,),
        ],
      ),
     )
    );
  }
}
