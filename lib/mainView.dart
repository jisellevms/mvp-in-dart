import 'package:flutter/material.dart';
import 'package:mvp/mvp.dart';
import 'package:mvp_example/mainModel.dart';
import 'package:mvp_example/mainPresenter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainScreen(title: 'MVP Demo'),
    );
  }
}

class MainScreen extends StatefulWidget {
  final presenter = MainPresenter();

  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends MvpScreen<MainScreen, MainModel> {
  @override
  void initializeViewModel() {
    viewModel = MainModel();
  }

  @override
  void initState() {
    super.initState();
    widget.presenter.bind(applyState, this);
  }

  @override
  void dispose() {
    super.dispose();
    widget.presenter.unbind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Você clicou no botão essa quantidade de vezes:',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            Text(
              "${viewModel.counter}",
              style: TextStyle(fontSize: 50, fontStyle: FontStyle.normal),
            ),
            Center(
              child: RaisedButton(
                child: Icon(
                  Icons.add,
                  color: Colors.pink,
                ),
                onPressed: () {
                  widget.presenter.incrementButtonClick();
                },
                splashColor: Colors.pink,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
