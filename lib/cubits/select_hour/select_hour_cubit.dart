import 'package:bloc/bloc.dart';

class SelectHourCubit extends Cubit<int> {
  SelectHourCubit() : super(0);

  void selectHour(int index) => emit(index);
}
