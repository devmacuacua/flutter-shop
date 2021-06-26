import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/page_manager.dart';

class DrawerTile extends StatelessWidget{

  const DrawerTile({required this.iconData, required this.title, required this.page});

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
          context.read<PageManager>().setPage(page);
          debugPrint('toquei $page');
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