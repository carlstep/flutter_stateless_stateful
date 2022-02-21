import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // nothing inside of this Stateless Widget will change, its immutable
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateless and Stateful'),
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Welcome to the app',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Buttons(text: 'Hello World'),
            ],
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  // this is a Stateful Widget, its mutable because there are two widgets that will change.
  const Buttons({required this.text});
  final String text;
  
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  var maleCounter = 0;
  var femaleCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Nr of males: $maleCounter',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Nr of females: $femaleCounter',
            style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyOwnButton(
              text: 'male +',
              onTap: () {
                setState(() {
                  maleCounter++;
                });
                print(widget.text);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyOwnButton(
              text: 'female +',
              onTap: () {
                setState(() {
                  femaleCounter++;
                });
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
  /*
  MaterialButton MyExtractMethodButton() { 
    // this is Extract as Method but it is preferred to Exxtract as Widget
    return MaterialButton(
            onPressed: () {
              setState(() {
                femaleCounter++;
              });
            },
            height: 50,
            minWidth: 200,
            color: Colors.blue,
            child: const Text(
              'Female +',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          );
  }
*/

class MyOwnButton extends StatelessWidget {
  const MyOwnButton({required this.onTap, required this.text});
  final VoidCallback onTap; // JJ sets this to 'Function' but flutter wants 'VoidCallBack'
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      minWidth: 200,
      color: Colors.blue,
      child: Text(
        '$text',
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.arrow_back),
            Text('Footer Widget'),
            Icon(Icons.arrow_forward),
          ],
        )
      ],
    );
  }
}
