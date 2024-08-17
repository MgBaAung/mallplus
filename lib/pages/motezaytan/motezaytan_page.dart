import 'package:flutter/material.dart';

import '../../utils/widgets/back_widget.dart';
class MoteZayTanPage extends StatelessWidget {
  const MoteZayTanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CustomBackButton(),
        title: Text("Mote Zay Tan",style: TextStyle(fontSize: 16,fontWeight:
        FontWeight.w600),),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Mote Zay Tan Page"),
      ),
    );
  }
}
