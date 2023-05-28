import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/themes.dart';
import 'package:opencontrol/widgets/list_element.dart';

class Inspector {
  String name;
  int id;
  String picUrl;
  int nadzorId;
  String token;
  String rating;

  Inspector(
      {required this.id,
      required this.name,
      required this.picUrl,
      required this.rating,
      required this.nadzorId,
      required this.token});

  Widget getView(BuildContext context, Function() callback) {
    return CrossListElement(
      onPressed: () {},
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.network(
              picUrl,
              width: 70,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: List.generate(int.parse(rating), (index) => index)
                      .map(
                        (e) => const Padding(
                          padding: EdgeInsets.only(right: 3),
                          child: Icon(
                            CupertinoIcons.star_fill,
                            color: primaryColor,
                            size: 16,
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
