// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 1;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: fields[0] as String,
      title: fields[1] as String,
      amount: fields[2] as double,
      date: fields[3] as DateTime,
      note: fields[4] as String?,
      type: fields[5] as TransactionType,
      category: fields[6] as Category,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final int typeId = 4;

  @override
  TransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionType.Income;
      case 1:
        return TransactionType.Expense;
      default:
        return TransactionType.Income;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    switch (obj) {
      case TransactionType.Income:
        writer.writeByte(0);
        break;
      case TransactionType.Expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 5;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.Housing;
      case 1:
        return Category.Transportation;
      case 2:
        return Category.Food;
      case 3:
        return Category.Ultilities;
      case 4:
        return Category.Clothing;
      case 5:
        return Category.Healthcare;
      case 6:
        return Category.Insurance;
      case 7:
        return Category.Supplies;
      case 8:
        return Category.Personal;
      case 9:
        return Category.Debt;
      case 10:
        return Category.Education;
      case 11:
        return Category.Gifts;
      case 12:
        return Category.Entertainment;
      default:
        return Category.Housing;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.Housing:
        writer.writeByte(0);
        break;
      case Category.Transportation:
        writer.writeByte(1);
        break;
      case Category.Food:
        writer.writeByte(2);
        break;
      case Category.Ultilities:
        writer.writeByte(3);
        break;
      case Category.Clothing:
        writer.writeByte(4);
        break;
      case Category.Healthcare:
        writer.writeByte(5);
        break;
      case Category.Insurance:
        writer.writeByte(6);
        break;
      case Category.Supplies:
        writer.writeByte(7);
        break;
      case Category.Personal:
        writer.writeByte(8);
        break;
      case Category.Debt:
        writer.writeByte(9);
        break;
      case Category.Education:
        writer.writeByte(10);
        break;
      case Category.Gifts:
        writer.writeByte(11);
        break;
      case Category.Entertainment:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
