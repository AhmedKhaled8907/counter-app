part of 'counter_bloc.dart';

sealed class CounterEvent {}

class CounterIncremented extends CounterEvent {}

class CounterDecrement extends CounterEvent {}
