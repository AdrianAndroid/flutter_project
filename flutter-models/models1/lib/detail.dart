import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final gallery;

  const Detail({Key key, this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasName = this.gallery != null && this.gallery["name"] != null;
    bool hasCover = this.gallery != null && this.gallery["cover"] != null;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.orange,
        child: Center(
          child: hasCover
              ? Hero(
                  tag: 'cover',
                  child: Image.network(
                    this.gallery["cover"],
                    fit: BoxFit.cover,
                  ),
                )
              : Text("cover not found"),
        ),
      ),
    );
  }
}
