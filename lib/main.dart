import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getPermission() async {
    var status = await Permission.contacts.status;
    if(status.isGranted) {
      print('허락됨');
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }

  var total = 3; // StatefulWidget으로 바꾸면 state로 인식
  var name = ['루이','오드','하루'];
  var like = [0,0,0];

  addCat(inputData) {
    setState(() {
      // name = [...inputData];
      name.add(inputData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: const Text('+'),
              onPressed: (){
                // print(context.findAncestorWidgetOfExactType<MaterialApp>());
                showDialog(
                  context: context,
                  builder: (context){
                    return DialogUI(addCat : addCat);
                  }
                );
              },
            );
          }
        ),
        appBar: AppBar(
          title: const Text('오구월드'),
          actions: [
            IconButton(
                onPressed: () { getPermission(); },
                icon: const Icon(Icons.contacts))
          ],
        ),
        body: ListView.builder(
          itemCount: name.length, // 몇 번 반복할지
          itemBuilder: (context,i){ // 첫번째 파라메터 context, 두번째 파라메터 반복때마다 증가되는 정수 i++같은거
            // print(i); // 콘솔창에 나타남
            return ListTile(
              leading: const Icon(Icons.account_circle, size: 40,),
              // leading: Text(like[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(
                // color: Colors.blue,
                onPressed: (){
                  setState(() {
                    // like[i]++;
                    name.remove(name[i]);
                  });
                },
                child: const Text('삭제 ',style: TextStyle(color: Colors.white),),
              ),
            );
          },
        ),
        bottomNavigationBar: const BottomNav(),
      );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.phone),
          Icon(Icons.message),
          Icon(Icons.contact_page),
        ],
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addCat}) : super(key: key);

  final addCat;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New cat'),
      content: TextFormField(
        controller: inputData,
        // onChanged: (){},
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'add Cat',
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: (){
            addCat(inputData.text);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}


