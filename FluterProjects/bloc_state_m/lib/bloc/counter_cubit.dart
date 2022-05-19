
import 'package:flutter_bloc/flutter_bloc.dart';

class counter_cubit extends Cubit<int>{
  counter_cubit() : super(0);
  // or counter_cubit(int initialState) : super(initialState);
void increment(){
  emit(state+1);
}
  void decrement(){
    emit(state-1);
  }
}