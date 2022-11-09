import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:t01_value_notifier/home/home_controller.dart';
import 'package:t01_value_notifier/home/home_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeController = HomeController();

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clique para ver os gatinhos',
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<HomeState>(
              valueListenable: homeController.homeState,
              builder: (context, state, child) {
                if (state is HomeLoadingState) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: LinearProgressIndicator(),
                  ));
                }
                if (state is HomeErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is HomeSuccessState) {
                  return Image(
                    image: NetworkImage(state.homeModel.urlImage),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeController.getCats,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
