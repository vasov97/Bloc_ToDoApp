import 'package:flutter/material.dart';
import 'package:todoapp_bloc/pages/stats_page.dart';
import 'package:todoapp_bloc/pages/todos_page.dart';

import 'add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = const [ToDosPage(), StatsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vanilla example'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_list_rounded),
            onSelected: (int item) => onSelected(context, item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Settings'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Share'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Share'),
              ),
            ],
          ),
          PopupMenuButton(
            onSelected: (int item) => onSelected(context, item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Settings'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Share'),
              ),
            ],
          ),
        ],
      ),
      body: _pages[_pageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddToDo())),
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
          });
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Mark all complete');
        break;
      case 1:
        print('Clear completed');
        break;
      case 2:
        print('Clear completed');
        break;
    }
  }
}
