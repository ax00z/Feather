import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              margin: const EdgeInsets.only(top: 75, right: 150, left: 20),
              child: TextField(
                style: const TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w500),
                cursorWidth: 1.5,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search for a city',
                  filled: true,
                  hintStyle: TextStyle(
                    color: CupertinoColors.inactiveGray,
                    wordSpacing: 1.15,
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  fillColor: CupertinoColors.darkBackgroundGray,
                ),
                onChanged: (value) => cityName = value,
              ),
            ),
            Row(children: [
              Container(
                  margin: EdgeInsets.only(left: 300, bottom: 0),
                  color: Colors.red,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          CupertinoColors.darkBackgroundGray,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      )))
            ])
          ],
        ),
      ),
    );
  }
}
