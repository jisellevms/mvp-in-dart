import 'package:mvp/mvp.dart';
import 'package:mvp_example/mainModel.dart';
import 'mainView.dart';

class MainPresenter extends MvpPresenter<MainModel, MainScreenState>{
  @override
  void initializeViewModel() {
    viewModel = MainModel();
  }

  void incrementButtonClick(){
    viewModel.counter++;
    callback(viewModel);
  }
  
}
