import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          child: Text(
            'Oops !! No Data Found',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
        ),
        color: Colors.grey,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
