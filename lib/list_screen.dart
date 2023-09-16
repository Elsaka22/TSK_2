import 'package:flutter/material.dart';

class AFG{
  final String textf;
  final IconData iconf;

  AFG({required this.textf, required this.iconf});
}

class ListViewApp extends StatelessWidget {
  ListViewApp({super.key});

  List<AFG> myList = [
    AFG(
        textf: 'Idea',
        iconf: Icons.lightbulb,
    ),AFG(
        textf:'Food' ,
        iconf: Icons.fastfood_outlined ,
    ),AFG(
        textf:'Work',
        iconf: Icons.work,
    ),AFG(
        textf:'Sport' ,
        iconf: Icons.sports_tennis_sharp,
    ),
    AFG(
      textf: 'Music',
      iconf: Icons.music_note_outlined,
    ),

  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Chose Activity',
      routes: {
        '/detail': (context) => DetailScreen(),
      },
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Choose activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: myList.length,

                    itemBuilder: (BuildContext context, index) {
                      index += 0;
                      double price = index * 2;
                      return Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: ListTile(
                          title: Text(
                            '${myList[index].textf}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text("chick your activity"),
                          onTap: () {
                            Navigator.pushNamed(
                              arguments: myList[index],
                              context,
                              '/detail',

                            );
                          },
                          leading:  Icon(
                            myList[index].iconf,
                            color: Colors.deepPurple,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      );
                    })),
          ]),
        ),
      ),
    );
  }
}



class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AFG entires = ModalRoute.of(context)?.settings.arguments as AFG;

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                entires.textf,
                style: const TextStyle(fontSize: 30.0),
              ),
              Icon(
                entires.iconf,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
