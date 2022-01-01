import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/criterias.dart';
import './card_item.dart';

class PaketsList extends StatelessWidget {
  const PaketsList({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final paketData = Provider.of<Results>(context);
    final pakets = paketData.results;
    return ListView.builder(
      itemCount: pakets.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: pakets[i],
        child: const CardItem(),
      ),
      
    );
  }
}
