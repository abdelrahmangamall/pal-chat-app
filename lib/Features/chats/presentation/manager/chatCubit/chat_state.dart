part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatSuccess extends ChatState {}
class ChatLoading extends ChatState {}
class ChatFaluire extends ChatState {
  String errorMessage;

  ChatFaluire({required this.errorMessage});
}
