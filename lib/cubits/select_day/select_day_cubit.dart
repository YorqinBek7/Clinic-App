import 'package:bloc/bloc.dart';

class SelectDayCubit extends Cubit<int> {
  SelectDayCubit() : super(0);

  void selectDay(int index) => emit(index);
}
