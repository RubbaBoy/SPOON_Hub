import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spoon_hub/scoped_model/home_model.dart';
import 'package:spoon_hub/ui/views/base_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => BaseView(
        builder: (BuildContext context, Widget? child, HomeModel model) =>
            Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                const Text('Wazzap'),
                MaterialButton(
                  onPressed: () => model.bruh(),
                  child: const Text('Press me'),
                ),
              ],
            ),
          ),
        ),
      );
}
