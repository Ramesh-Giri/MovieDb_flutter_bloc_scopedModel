import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildLoadingScreen() {
  return ListView.separated(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey,
          child: ListTile(
            onTap: () {},
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white70,
            ),
            title: Container(
              height: 10.0,
              color: Colors.white70,
            ),
            subtitle: Container(
              height: 10.0,
              width: 100.0,
              color: Colors.white70,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 8.0,
          color: Colors.transparent,
        );
      },
      itemCount: 10);
}
