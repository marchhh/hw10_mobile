import 'package:flutter/material.dart';
import 'Valo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Check',
      theme: ThemeData(
        primarySwatch: Colors.red,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);


  final List<Valo> ValoList = [
       Valo(profileuser: 'assets/images/jett1.png', img: 'assets/images/jett2.jpg',
           userpost: 'I love Jett', comments: [Comments(user: 'Ohm', comment: "เราชอบเอา Jett ไปลง Rank มันเป็นตัว Duelist ตัวแบกเลยแหละ"),Comments(user: 'March', comment: 'เราก็เหมือนกันเลือกตัวนี้ไปทีไร Rank ขึ้นทุกที')],
            content: "มีใครเล่น Valorant แล้วเลือก Jett ไปแบกคนอื่นบ้างงงงงง \n"),
       Valo(profileuser: 'assets/images/kj1.png', img: 'assets/images/kj2.jpg',
          userpost: 'I love KillJoy', comments: [Comments(user: 'Oat', comment: "เราชอบเล่น Neon เพราะตัวมันพริ้วจัดๆเล่นทีไรต้องแบกคนอื่นตลอดเลย"),Comments(user: 'March', comment: 'เราโคตรชอบเล่นตัวนี้เลยอะ เล่นทีไรเพื่อนในทีมชมทุกรอบ')],
          content: "เราว่า KillJoy เป็นตัวกันที่ดีมากกกก อีกฝั่งบุกเข้ามาแทบไม่ได้เลยโคตรดี \n"),
       Valo(profileuser: 'assets/images/sova1.png', img: 'assets/images/sova2.jpg',
        userpost: 'I love Sova', comments: [Comments(user: 'March', comment: "เราเทพ Sova ทุกด่านเราจำการเล่นได้ทุกแมพเลยถ้าอยากรู้ทักมาถามได้"),Comments(user: 'Stamp', comment: 'เราว่า Omen ตัวดำดีนะคิดเหมือนกันปะ')],
        content: "ใครที่เล่น Sova เก่งๆบ้างมาสอนทริกการใช้ Skill ของมันหน่อยยยยยยยย T^T \n"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(title: Text('Valorant Check',style: TextStyle(fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,))),
    body: ListView.builder(
        itemCount: ValoList.length,
      itemBuilder: (context, index) => 
            MyCard(valo : ValoList[index])),
    );
  }
}

class MyCard extends StatefulWidget {
  final Valo valo;
  
  const MyCard({Key? key,
  required this.valo,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.valo.profileuser}'),
                ),
                SizedBox(width: 10.0,),
                Expanded(child: Text('${widget.valo.userpost}')),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.valo.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text('${widget.valo.content}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.valo.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.valo.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.valo.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  )
              ],
            ),
          ),

          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.pink,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.valo.comments.add(Comments(user: 'User', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )
          
        ],
      ),
    );
  }
}


