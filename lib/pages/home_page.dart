import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/pages/stats_page.dart';
import 'package:todoapp_bloc/pages/todos_page.dart';

import '../blocs/todo_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  bool isHomePage = true;

  @override
  Widget build(BuildContext context) {
    ToDoBloc toDoBloc = context.read<ToDoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla example'),
        actions: [
          isHomePage
              ? PopupMenuButton(
                  icon: const Icon(Icons.filter_list_rounded),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      child: const Text('Show All'),
                      onTap: () => toDoBloc.getToDos(),
                    ),
                    PopupMenuItem<int>(
                      child: const Text('Show Active'),
                      onTap: () => toDoBloc.showActive(),
                    ),
                    PopupMenuItem<int>(
                      child: const Text('Show Completed'),
                      onTap: () => toDoBloc.showCompleted(),
                    ),
                  ],
                )
              : const SizedBox(),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                child: const Text('Mark all complete'),
                onTap: () => toDoBloc.markAllComplete(),
              ),
              PopupMenuItem<int>(
                child: const Text('Clear completed'),
                onTap: () => toDoBloc.clearAllCompleted(),
              ),
            ],
          ),
        ],
      ),
      body: pageSelect(_pageIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black38,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.toc),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Stats',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
            isHomePage = !isHomePage;
          });
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget pageSelect(int index) {
    if (index == 0) {
      return ToDosPage();
    } else {
      return StatsPage();
    }
  }
}
