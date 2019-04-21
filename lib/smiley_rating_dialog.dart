library smiley_rating_dialog;

import 'package:flutter/material.dart';
import 'package:smiley_rating_dialog/smiley_painter.dart';

class SmileyRatingDialog extends StatefulWidget {

  // Color of star buttons
  final Color starColor;

  // Called when positive button is clicked
  final ValueSetter<int> onSubmitPressed;

  // Called when negative button is clicked
  final VoidCallback onCancelPressed;

  // Text of Positive Button
  final String positiveButtonText;

  // Text of Positive Button
  final String negativeButtonText;

  // Color of Positive Button
  final Color positiveButtonColor;

  // Color of Positive Button
  final Color negativeButtonColor;

  // Title of Dialog
  final Widget title;

  // Whether the corners of the buttons should be rounded or not
  final bool isRoundedButtons;

  SmileyRatingDialog(
      {this.starColor = Colors.yellow,
      this.title,
      @required this.onSubmitPressed,
      @required this.onCancelPressed,
      @required this.positiveButtonText,
      @required this.negativeButtonText,
      this.isRoundedButtons = true,
      this.positiveButtonColor = Colors.amber,
      this.negativeButtonColor = Colors.amber});

  @override
  _SmileyRatingDialogState createState() => _SmileyRatingDialogState();
}

class _SmileyRatingDialogState extends State<SmileyRatingDialog> {
  int _rating = 0;

  List<Widget> _starWidgets() {
    List<Widget> buttons = [];

    for (int rateValue = 1; rateValue <= 5; rateValue++) {
      final starRatingButton = IconButton(
          icon: Icon(_rating >= rateValue ? Icons.star : Icons.star_border,
              color: widget.starColor, size: 35),
          onPressed: () {
            setState(() {
              _rating = rateValue;
            });
          });
      buttons.add(starRatingButton);
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: widget.title,
      contentPadding: EdgeInsets.all(20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            child: CustomPaint(
              painter: SmileyPainter(rating: _rating),
            ),
          ),
          Row(children: _starWidgets()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        widget.isRoundedButtons ? 4.0 : 0.0)),
                color: widget.positiveButtonColor,
                onPressed: () {
                  widget.onSubmitPressed(_rating);
                },
                child: Text(widget.positiveButtonText),
              ),
              FlatButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        widget.isRoundedButtons ? 4.0 : 0.0)),
                color: widget.negativeButtonColor,
                onPressed: () {
                  widget.onCancelPressed();
                },
                child: Text(widget.negativeButtonText),
              ),
            ],
          )
        ],
      ),
    );
  }
}
