// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 0;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      tin: fields[0] as int,
      name: fields[1] as String,
      phone: fields[2] as String,
      email: fields[3] as String,
      paymentType: fields[4] as String,
      startDate: fields[5] as DateTime,
      grossSalary: fields[6] as int,
      taxableEarning: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.tin)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.paymentType)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.grossSalary)
      ..writeByte(7)
      ..write(obj.taxableEarning);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
