import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('오구월드'),
          // backgroundColor: const Color(0xffffffff),
          actions: const [
            Icon(Icons.search),
            Icon(Icons.apps),
            Icon(Icons.notifications),
          ],
        ),
        // body: ListView(
        //   children: <Widget>[
        //     ListTile(
        //       title: const Text('캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)'),
        //       subtitle: const Text('성동구 청담동 끌올 10분 전'),
        //       leading: Image.asset('assets/ogu.gif'),
        //     )
        //   ]
        // )
        body: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset('assets/ogu.gif', width: 70,),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('캐논 DSLR 100D (단렌즈,충전기 16기가 SD포함)', style: TextStyle(fontWeight: FontWeight.bold),),
                    const Text('성동구 청담동 끌올 10분 전'),
                    const Text('680,000원'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.favorite),
                        Text('4'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
