import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            a++;
          },
        ),
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3, // 몇 번 반복할지
          itemBuilder: (context,i){ // 첫번째 파라메터 context, 두번째 파라메터 반복때마다 증가되는 정수 i++같은거
            print(i); // 콘솔창에 나타남
            return const ListTile(
              leading: Icon(Icons.account_circle, size: 40,),
              title: Text('루이'),
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
      ),
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

