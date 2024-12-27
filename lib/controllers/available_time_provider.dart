import 'package:flutter/material.dart';

import '../models/available_time_model.dart';

class AvailableTimeProvider extends ChangeNotifier{

final   List<AvailableTime> _availableTimes = [
    AvailableTime(time: "9:00 AM", isSchedule: false, isFutureSchedule: true, isCancel: true),
    AvailableTime(time: "9:30 AM", isSchedule: true, isFutureSchedule: true, isCancel: true),
    AvailableTime(time: "10:00 AM", isSchedule: false, isFutureSchedule: false, isCancel: false),
    AvailableTime(time: "10:30 AM", isSchedule: false, isFutureSchedule: true, isCancel: true),
    AvailableTime(time: "11:00 AM", isSchedule: false, isFutureSchedule: false, isCancel: true),
    AvailableTime(time: "11:30 AM", isSchedule: true, isFutureSchedule: false, isCancel: false),
    AvailableTime(time: "12:00 PM", isSchedule: true, isFutureSchedule: false, isCancel: false),
    AvailableTime(time: "12:30 PM", isSchedule: false, isFutureSchedule: true, isCancel: true),
    AvailableTime(time: "1:00 PM", isSchedule: true, isFutureSchedule: true, isCancel: false),
    AvailableTime(time: "1:30 PM", isSchedule: true, isFutureSchedule: true, isCancel: true),
    AvailableTime(time: "2:00 PM", isSchedule: false, isFutureSchedule: false, isCancel: false),
    AvailableTime(time: "2:30 PM", isSchedule: true, isFutureSchedule: false, isCancel: false),
    AvailableTime(time: "3:00 PM", isSchedule: false, isFutureSchedule: false, isCancel: false),
    AvailableTime(time: "3:30 PM", isSchedule: false, isFutureSchedule: true, isCancel: false),
    AvailableTime(time: "4:00 PM", isSchedule: true, isFutureSchedule: true, isCancel: true)
  ];
List<AvailableTime> get availableTimes=> _availableTimes;
}