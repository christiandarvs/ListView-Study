import 'dart:ui';

import 'package:day_ten_study/information.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentCreatorList extends StatefulWidget {
  const ContentCreatorList({super.key});

  @override
  State<ContentCreatorList> createState() => _ContentCreatorListState();
}

class _ContentCreatorListState extends State<ContentCreatorList> {
  List<Information> information = [
    Information('Bryl Lim', false),
    Information('Darla David', false),
    Information('Christian Darvin', false),
    Information('Erwan', false),
    Information('Chaan Biz', false),
    Information('CatDev', false),
    Information('Wreckzone', false),
    Information('Lexus', false),
    Information('NaniLemons', false),
    Information('ThoughtsonTechbyAlbert', false),
    Information('Inspect27', false),
    Information('Sam', false),
    Information('Jayem', false)
  ];

  List<Information> selectedInfo = [];

  final category = 'TikTok Content Creator';

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: information.length,
                itemBuilder: ((context, index) {
                  return Item(information[index].name,
                      information[index].isSelected, index);
                }),
              ),
            ),
            selectedInfo.length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget Item(String name, bool isSelected, int index) {
    return Card(
      child: ListTile(
        title: Text(
          information[index].name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(category),
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Text(
            information[index].name[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
        onTap: () {
          setState(() {
            information[index].isSelected = !information[index].isSelected;
            if (!isSelected) {
              const snackbar = SnackBar(
                content: Text('Followed'),
                duration: Duration(milliseconds: 500),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else {
              const snackbar = SnackBar(
                content: Text('Unfollowed'),
                duration: Duration(milliseconds: 500),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          });
        },
      ),
    );
  }
}
