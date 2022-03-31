import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text("Калькулятор площади"),),
      body: const MyForm(),
    ),
  )
);

class MyForm extends StatefulWidget{
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State{
  final _formKey = GlobalKey<FormState>();
  var shir;
  var dlin;
  String resText = "Задайте параметры";

  @override
  Widget build(BuildContext context)
  {
    return Container(child:
      Form(key: _formKey, child: Column(verticalDirection: VerticalDirection.down, children: <Widget>[

        Row(verticalDirection: VerticalDirection.up, children: [
          const Text("Высота (ММ)", style: TextStyle(fontSize: 18)),
          Expanded(child:
          TextFormField(validator: (value)
          {
            if(value!.isEmpty || int.tryParse(value) == null)
              return "Укажите высоту!";
            else
              dlin = value;
          }
            ,))
        ]),


        Row(verticalDirection: VerticalDirection.up, children: [
          const Text("Ширина (ММ)", style: TextStyle(fontSize: 18),),

          Expanded(child: TextFormField(validator: (value)
              {
                if(value!.isEmpty || int.tryParse(value) == null)
                  return "Укажите ширину!";
                else
                  shir = value;
              }
          ,))],),

        ElevatedButton(onPressed: ()
        {
          if(_formKey.currentState!.validate())
            {
              int dl = int.parse(dlin);
              int sh = int.parse(shir);

              int res = sh * dl;

              setState(() {
                resText = "S = $shir * $dlin = $res";
              });
            }
          else
            setState(() {
              resText = "Задайте параметры";
            });
        },
            child:
              const Text("Вычислить")),

        Text(resText, style: TextStyle(fontSize: 18)),

      ]))
    );
  }
}