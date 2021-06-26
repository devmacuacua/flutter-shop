import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget{

  DrawerTile({required this.iconData, required this.title});

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){

      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                  iconData,
                size: 32,
                color: Colors.grey[700],
              ),
            ),
            Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
            )
          ],
        ),
      ),
    );
  }
}