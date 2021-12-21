import 'package:create_todo/create_to_do.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(""),
          ),
        ),
        title: Text('My Task'),
        actions: [
          Icon(Icons.filter_list_rounded),
          Icon(Icons.search),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xfff0f4ff),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
                )
                ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_outlined),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan a trip to Finland',
                          style:
                              TextStyle(fontSize: 18,
                               color: Colors.black),
                        ),
                        Text('planning the trip',
                            style: TextStyle(fontSize: 15))
                      ],
                    )),
                    Row(
                      children: [Icon(Icons.notifications), Text('Yesterday')],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: 5,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,vertical: 10
      ),
      child: InkWell(onTap: (){ 
        showBarModalBottomSheet(context: context, builder: ( context){
        return  ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_outlined),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan a trip to Finland',
                          style:
                              TextStyle(fontSize: 18,
                               color:Colors.black),
                        ),
                        Text('planning the trip',
                            style: TextStyle(fontSize: 15))
                      ],
                    )),
                    Row(
                      children: [Icon(Icons.notifications), Text('Yesterday')],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: 5,
      );
      }
      );
      },
        child: Card(
          color: Colors.black, 
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [ 
      
            Icon(Icons.check_circle),
            Expanded(child:Text ('Completed'),
            ),
            Text('24'),
          ],
          ),
        ),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: (){
          Navigator.push(
            context,
           MaterialPageRoute(builder: (context){ 
            return CreateToView();
          },
          )
          );
        },
      child: Icon(Icons.add),backgroundColor: Colors.black,
      ),
    
    );
  }
}
