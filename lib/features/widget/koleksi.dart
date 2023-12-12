import 'package:flutter/material.dart';
import 'package:ikea/model/model.dart';

class KoleksiWidget extends StatelessWidget {
  const KoleksiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...koleksiList.map(
            (list) => list,
          )
        ],
      ),
    );
  }
}
