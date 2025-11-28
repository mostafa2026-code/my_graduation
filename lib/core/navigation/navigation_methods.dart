import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mypush(BuildContext context, String route, Object? data) {
  context.push(route, extra: data);
}

mypushReplace(BuildContext context, String route, Object? data) {
  context.pushReplacement(route, extra: data);
}

mygo(BuildContext context, String route, Object? data) {
  context.go(route, extra: data);
}

mypop(BuildContext context) {
  context.pop();
}
