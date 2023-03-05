import 'package:bloc/bloc.dart';

class SelectGenderCubit extends Cubit<bool> {
  SelectGenderCubit() : super(true);
  void tryToSelectGender(bool isMale) => emit(isMale);
}
