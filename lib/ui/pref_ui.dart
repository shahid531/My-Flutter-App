import 'package:flutter/material.dart';
import 'package:my_flutter_app/pref/pref.dart';

class PrefUi extends StatefulWidget {
  const PrefUi({super.key});

  @override
  State<PrefUi> createState() => _PrefUiState();
}

class _PrefUiState extends State<PrefUi> {
  final controller = TextEditingController();
  final pref = Pref();
  String result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'enter here',
                  isDense: true,
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder()
                ),
              ),

              Wrap(
                children: [
                  TextButton(onPressed: ()async{
                    await pref.createUser(controller.text.trim());

                  }, child: Text('CREATE')),
                  TextButton(onPressed: ()async{
                    result = (await pref.readUser())!;
                    setState(() {
                      
                    });
                  }, child: Text('READ')),
                  TextButton(onPressed: (){}, child: Text('UPDATE')),
                  TextButton(onPressed: ()async{
                    await pref.deleteUser();
                    setState(() {
                      
                    });
                  }, child: Text('DELETE')),
                ],
              ),

              Expanded(child: Align(
                alignment: Alignment.center,
                child: Text(result,style: TextStyle(fontSize: 18),)))
            ],
          ),
        ),
      ),
    );
  }
}