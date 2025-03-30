import 'package:flutter/material.dart';
import 'package:my_flutter_app/db/db_helper.dart';

class SqfliteUi extends StatefulWidget {
  const SqfliteUi({super.key});

  @override
  State<SqfliteUi> createState() => _SqfliteUiState();
}

class _SqfliteUiState extends State<SqfliteUi> {
  final dbHelper = DbHelper();
  final textController = TextEditingController();
  List<Map<String, Object?>> list = [];
  @override
  void dispose() {
    textController.clear();
    super.dispose();
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'enter here',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await dbHelper.addData(textController.text.trim());
                  getData();
                },
                child: Text('CREATE'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('${list[index]['name']}')),
                          GestureDetector(
                          onTap: () async{
                            await dbHelper.deleteNameById(list[index]['id'] as int);
                            setState(() {
                              
                            });
                          },
                            child: Icon(Icons.delete)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    list = await dbHelper.getUser();
    setState(() {
      
    });
  }
}
