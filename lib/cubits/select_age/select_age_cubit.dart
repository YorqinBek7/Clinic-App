import 'package:bloc/bloc.dart';

class SelectAgeCubit extends Cubit<int> {
  SelectAgeCubit() : super(0);

  void tryToSelectAge(int age) => emit(age);
}
