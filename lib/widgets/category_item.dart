import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  CategoryItem(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Set a fixed width to avoid layout issues
      margin: EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 45,
          ),
          SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}




