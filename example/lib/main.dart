import 'package:flutter/material.dart';
import 'package:smiley_rating_dialog/smiley_rating_dialog.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) => SmileyRatingDialog(
                    title: Text('Smiley Dialog'),
                    starColor: Colors.red,
                    isRoundedButtons: true,
                    positiveButtonText: 'Ok',
                    negativeButtonText: 'Cancel',
                    positiveButtonColor: Colors.amber,
                    negativeButtonColor: Colors.amber,
                    onCancelPressed: () => Navigator.pop(context),
                    onSubmitPressed: (rating) {},
                  ));
        },
        child: Text('Show Dialog'),
      ),
    );
  }
}
