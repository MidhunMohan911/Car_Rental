import 'package:car_rental/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 330,
              child: TextField(
                decoration: InputDecoration(hintText: 'Type the message..'),
              ),
            ),
            FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 36, 36, 36),
              onPressed: () {},
              child: const Icon(CupertinoIcons.paperplane),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Chat'),
          centerTitle: true,
          backgroundColor: chatClr,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox15,
              Row(
                children: [
                  SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/HDqDHRM4_400x400.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: 180,
                    decoration: BoxDecoration(
                        color: chatClr,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hai Midhun Mohan Iam Abella . your Personal Chat Assistant.',
                        style: TextStyle(color: kwhite, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                      color: chatClr, borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'What is your problem?',
                    style: TextStyle(color: kwhite, fontSize: 18),
                  ),
                ),
              ),
              sizedBox15,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'How Can I Book A Car',
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assets/images/profile-photo_GREYDARK-scaled.jpg'),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 370,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/HDqDHRM4_400x400.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 360,
                    width: 180,
                    decoration: BoxDecoration(
                        color: chatClr,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'First login to your Account If You Have One , Next Select Your car , Click Book Now Then You Will Redirect To the Cars Page,There You Can Schedule The Date , After Scheduling Press Book Now Then You Will Redirect to Payment Page There You Can Pay Your Amount After That YOu will Get A Mail',
                        style: TextStyle(color: kwhite, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              sizedBox10,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      color: chatClr, borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'I have a personal complaint',
                    style: TextStyle(color: kwhite, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                      color: chatClr, borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'How can i check my Booking History',
                    style: TextStyle(color: kwhite, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
