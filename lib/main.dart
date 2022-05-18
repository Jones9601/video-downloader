import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoClass(),
    );
  }
}

class DemoClass extends StatefulWidget {
  const DemoClass({Key? key}) : super(key: key);

  @override
  _DemoClassState createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {
  static const MethodChannel platform = MethodChannel('downloadChannel');
  TextEditingController userInput = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page Demo"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "TextFormField In Flutter",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: userInput,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        userInput.text = value.toString();
                      });
                    },
                    decoration: const InputDecoration(
                      focusColor: Colors.white,
                      // errorText: "Error",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10.0),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide:
                      //       const BorderSide(color: Colors.blue, width: 1.0),
                      //   borderRadius: BorderRadius.circular(10.0),
                      // ),
                      fillColor: Colors.grey,
                      hintText: "Email/Mobile",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                      labelText: 'Url',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    onSurface: Colors.red,
                  ),
                  onPressed: () async {
                    await platform.invokeMethod(
                        'downloadVideo', <String, dynamic>{
                      'filePath': 'dldjkdj'
                    }).then((dynamic value) {
                      print(value);
                    });
                  },
                  child: const Text('TextButton'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
