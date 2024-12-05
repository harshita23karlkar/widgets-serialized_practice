import 'package:flutter/material.dart';
import 'package:my_app/api_service.dart';
import 'package:my_app/myCircle.dart';
import 'package:my_app/todo_details_page.dart';
import 'package:my_app/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  // List<Todo> list = [];
  // @override
  // void initState() {
  //   apiService.fetchpost().then((val) {
  //     list = val;
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: apiService.fetchpost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.data == null) {
                return Text(snapshot.error.toString());
              }
              return Expanded(
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Todo todo = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return TodoDetailsPage(todo: todo);
                          },
                        ));
                      },
                      child: MyCircle(todo: todo

                          // src:
                          //     "https://docs.flutter.dev/assets/images/docs/widget-catalog/material-list-tile.png",
                          ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
