import 'package:flutter/material.dart';

class ClaimBottomSheet extends StatelessWidget {
  const ClaimBottomSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MyButton('ADULT', () => Navigator.pop(context)),
            MyButton('SPAM', () => Navigator.pop(context)),
            MyButton('HATE', () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}

// class MyButton extends StatelessWidget {
//   const MyButton(String text, Function onPress, {Key key})
//       : this.text = text,
//         this.onPress = onPress,
//         super(key: key);

//   final String text;
//   final Function onPress;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Container(
//         child: RaisedButton(
//           onPressed: this.onPress,
//           child: Text(this.text, style: TextStyle(fontSize: 15)),
//         ),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
//       ),
//     );
//   }
// }

class MyButton extends StatelessWidget {
  const MyButton(String text, Function onPress, {Key key})
      : this.text = text,
        this.onPress = onPress,
        super(key: key);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(text),
      ),
    );
  }
}
