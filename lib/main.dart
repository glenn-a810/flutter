import 'package:flutter/material.dart';

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
  var a = 1; // StatefulWidget으로 바꾸면 state로 인식
  var name = ['루이','오드','하루'];
  var like = [0,0,0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: const Text('+'),
              onPressed: (){
                // print(context.findAncestorWidgetOfExactType<MaterialApp>());
                showDialog(context: context, builder: (context){
                  return const Dialog(
                    child: Text('Dialog 활성'),
                  );
                });
                // a++;
                // setState(() {
                //   a++;
                // });
              },
            );
          }
        ),
        appBar: AppBar(title: const Text('오구월드'),),
        body: ListView.builder(
          itemCount: 3, // 몇 번 반복할지
          itemBuilder: (context,i){ // 첫번째 파라메터 context, 두번째 파라메터 반복때마다 증가되는 정수 i++같은거
            // print(i); // 콘솔창에 나타남
            return ListTile(
              // leading: const Icon(Icons.account_circle, size: 40,),
              leading: Text(like[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(
                // color: Colors.blue,
                onPressed: (){
                  setState(() {
                    like[i]++;
                  });
                },
                child: const Text('좋아요',style: TextStyle(color: Colors.white),),
              ),
            );
          },
          // children: const [
          //   ListTile(
          //     leading: Icon(Icons.account_circle, size: 40,),
          //     title: Text('루이'),
          //   ),
          //   ListTile(
          //     leading: Icon(Icons.account_circle, size: 40,),
          //     title: Text('오드'),
          //   ),
          //   ListTile(
          //     leading: Icon(Icons.account_circle, size: 40,),
          //     title: Text('하루'),
          //   ),
          // ],
          // children: [
          //   Row(
          //     children: const [
          //       Icon(Icons.account_circle,size: 30,),
          //       Text('루이'),
          //     ],
          //   ),
          //   Row(
          //     children: const [
          //       Icon(Icons.account_circle,size: 30,),
          //       Text('오드'),
          //     ],
          //   ),
          //   Row(
          //     children: const [
          //       Icon(Icons.account_circle,size: 30,),
          //       Text('하루'),
          //     ],
          //   ),
          // ],
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

