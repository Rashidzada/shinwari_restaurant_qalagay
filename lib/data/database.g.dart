// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _restaurantNameMeta = const VerificationMeta(
    'restaurantName',
  );
  @override
  late final GeneratedColumn<String> restaurantName = GeneratedColumn<String>(
    'restaurant_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Shinwari Restaurant Qalagay'),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerNameMeta = const VerificationMeta(
    'ownerName',
  );
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
    'owner_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerCnicMeta = const VerificationMeta(
    'ownerCnic',
  );
  @override
  late final GeneratedColumn<String> ownerCnic = GeneratedColumn<String>(
    'owner_cnic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerContactMeta = const VerificationMeta(
    'ownerContact',
  );
  @override
  late final GeneratedColumn<String> ownerContact = GeneratedColumn<String>(
    'owner_contact',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerSignatureMeta = const VerificationMeta(
    'ownerSignature',
  );
  @override
  late final GeneratedColumn<String> ownerSignature = GeneratedColumn<String>(
    'owner_signature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerPhotoPathMeta = const VerificationMeta(
    'ownerPhotoPath',
  );
  @override
  late final GeneratedColumn<String> ownerPhotoPath = GeneratedColumn<String>(
    'owner_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paperSizeMeta = const VerificationMeta(
    'paperSize',
  );
  @override
  late final GeneratedColumn<String> paperSize = GeneratedColumn<String>(
    'paper_size',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('58mm'),
  );
  static const VerificationMeta _footerNoteMeta = const VerificationMeta(
    'footerNote',
  );
  @override
  late final GeneratedColumn<String> footerNote = GeneratedColumn<String>(
    'footer_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adminPinMeta = const VerificationMeta(
    'adminPin',
  );
  @override
  late final GeneratedColumn<String> adminPin = GeneratedColumn<String>(
    'admin_pin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('1234'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    restaurantName,
    address,
    phone,
    ownerName,
    ownerCnic,
    ownerContact,
    ownerSignature,
    logoPath,
    ownerPhotoPath,
    paperSize,
    footerNote,
    adminPin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('restaurant_name')) {
      context.handle(
        _restaurantNameMeta,
        restaurantName.isAcceptableOrUnknown(
          data['restaurant_name']!,
          _restaurantNameMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    }
    if (data.containsKey('owner_cnic')) {
      context.handle(
        _ownerCnicMeta,
        ownerCnic.isAcceptableOrUnknown(data['owner_cnic']!, _ownerCnicMeta),
      );
    }
    if (data.containsKey('owner_contact')) {
      context.handle(
        _ownerContactMeta,
        ownerContact.isAcceptableOrUnknown(
          data['owner_contact']!,
          _ownerContactMeta,
        ),
      );
    }
    if (data.containsKey('owner_signature')) {
      context.handle(
        _ownerSignatureMeta,
        ownerSignature.isAcceptableOrUnknown(
          data['owner_signature']!,
          _ownerSignatureMeta,
        ),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('owner_photo_path')) {
      context.handle(
        _ownerPhotoPathMeta,
        ownerPhotoPath.isAcceptableOrUnknown(
          data['owner_photo_path']!,
          _ownerPhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('paper_size')) {
      context.handle(
        _paperSizeMeta,
        paperSize.isAcceptableOrUnknown(data['paper_size']!, _paperSizeMeta),
      );
    }
    if (data.containsKey('footer_note')) {
      context.handle(
        _footerNoteMeta,
        footerNote.isAcceptableOrUnknown(data['footer_note']!, _footerNoteMeta),
      );
    }
    if (data.containsKey('admin_pin')) {
      context.handle(
        _adminPinMeta,
        adminPin.isAcceptableOrUnknown(data['admin_pin']!, _adminPinMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      restaurantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}restaurant_name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      ),
      ownerCnic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_cnic'],
      ),
      ownerContact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_contact'],
      ),
      ownerSignature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_signature'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      ownerPhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_photo_path'],
      ),
      paperSize: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paper_size'],
      )!,
      footerNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}footer_note'],
      ),
      adminPin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_pin'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final String restaurantName;
  final String? address;
  final String? phone;
  final String? ownerName;
  final String? ownerCnic;
  final String? ownerContact;
  final String? ownerSignature;
  final String? logoPath;
  final String? ownerPhotoPath;
  final String paperSize;
  final String? footerNote;
  final String adminPin;
  const Setting({
    required this.id,
    required this.restaurantName,
    this.address,
    this.phone,
    this.ownerName,
    this.ownerCnic,
    this.ownerContact,
    this.ownerSignature,
    this.logoPath,
    this.ownerPhotoPath,
    required this.paperSize,
    this.footerNote,
    required this.adminPin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['restaurant_name'] = Variable<String>(restaurantName);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || ownerName != null) {
      map['owner_name'] = Variable<String>(ownerName);
    }
    if (!nullToAbsent || ownerCnic != null) {
      map['owner_cnic'] = Variable<String>(ownerCnic);
    }
    if (!nullToAbsent || ownerContact != null) {
      map['owner_contact'] = Variable<String>(ownerContact);
    }
    if (!nullToAbsent || ownerSignature != null) {
      map['owner_signature'] = Variable<String>(ownerSignature);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    if (!nullToAbsent || ownerPhotoPath != null) {
      map['owner_photo_path'] = Variable<String>(ownerPhotoPath);
    }
    map['paper_size'] = Variable<String>(paperSize);
    if (!nullToAbsent || footerNote != null) {
      map['footer_note'] = Variable<String>(footerNote);
    }
    map['admin_pin'] = Variable<String>(adminPin);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      restaurantName: Value(restaurantName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      ownerName: ownerName == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerName),
      ownerCnic: ownerCnic == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerCnic),
      ownerContact: ownerContact == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerContact),
      ownerSignature: ownerSignature == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerSignature),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      ownerPhotoPath: ownerPhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerPhotoPath),
      paperSize: Value(paperSize),
      footerNote: footerNote == null && nullToAbsent
          ? const Value.absent()
          : Value(footerNote),
      adminPin: Value(adminPin),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      restaurantName: serializer.fromJson<String>(json['restaurantName']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      ownerName: serializer.fromJson<String?>(json['ownerName']),
      ownerCnic: serializer.fromJson<String?>(json['ownerCnic']),
      ownerContact: serializer.fromJson<String?>(json['ownerContact']),
      ownerSignature: serializer.fromJson<String?>(json['ownerSignature']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      ownerPhotoPath: serializer.fromJson<String?>(json['ownerPhotoPath']),
      paperSize: serializer.fromJson<String>(json['paperSize']),
      footerNote: serializer.fromJson<String?>(json['footerNote']),
      adminPin: serializer.fromJson<String>(json['adminPin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'restaurantName': serializer.toJson<String>(restaurantName),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'ownerName': serializer.toJson<String?>(ownerName),
      'ownerCnic': serializer.toJson<String?>(ownerCnic),
      'ownerContact': serializer.toJson<String?>(ownerContact),
      'ownerSignature': serializer.toJson<String?>(ownerSignature),
      'logoPath': serializer.toJson<String?>(logoPath),
      'ownerPhotoPath': serializer.toJson<String?>(ownerPhotoPath),
      'paperSize': serializer.toJson<String>(paperSize),
      'footerNote': serializer.toJson<String?>(footerNote),
      'adminPin': serializer.toJson<String>(adminPin),
    };
  }

  Setting copyWith({
    int? id,
    String? restaurantName,
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> ownerName = const Value.absent(),
    Value<String?> ownerCnic = const Value.absent(),
    Value<String?> ownerContact = const Value.absent(),
    Value<String?> ownerSignature = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
    Value<String?> ownerPhotoPath = const Value.absent(),
    String? paperSize,
    Value<String?> footerNote = const Value.absent(),
    String? adminPin,
  }) => Setting(
    id: id ?? this.id,
    restaurantName: restaurantName ?? this.restaurantName,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    ownerName: ownerName.present ? ownerName.value : this.ownerName,
    ownerCnic: ownerCnic.present ? ownerCnic.value : this.ownerCnic,
    ownerContact: ownerContact.present ? ownerContact.value : this.ownerContact,
    ownerSignature: ownerSignature.present
        ? ownerSignature.value
        : this.ownerSignature,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    ownerPhotoPath: ownerPhotoPath.present
        ? ownerPhotoPath.value
        : this.ownerPhotoPath,
    paperSize: paperSize ?? this.paperSize,
    footerNote: footerNote.present ? footerNote.value : this.footerNote,
    adminPin: adminPin ?? this.adminPin,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      restaurantName: data.restaurantName.present
          ? data.restaurantName.value
          : this.restaurantName,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      ownerCnic: data.ownerCnic.present ? data.ownerCnic.value : this.ownerCnic,
      ownerContact: data.ownerContact.present
          ? data.ownerContact.value
          : this.ownerContact,
      ownerSignature: data.ownerSignature.present
          ? data.ownerSignature.value
          : this.ownerSignature,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      ownerPhotoPath: data.ownerPhotoPath.present
          ? data.ownerPhotoPath.value
          : this.ownerPhotoPath,
      paperSize: data.paperSize.present ? data.paperSize.value : this.paperSize,
      footerNote: data.footerNote.present
          ? data.footerNote.value
          : this.footerNote,
      adminPin: data.adminPin.present ? data.adminPin.value : this.adminPin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('restaurantName: $restaurantName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('ownerName: $ownerName, ')
          ..write('ownerCnic: $ownerCnic, ')
          ..write('ownerContact: $ownerContact, ')
          ..write('ownerSignature: $ownerSignature, ')
          ..write('logoPath: $logoPath, ')
          ..write('ownerPhotoPath: $ownerPhotoPath, ')
          ..write('paperSize: $paperSize, ')
          ..write('footerNote: $footerNote, ')
          ..write('adminPin: $adminPin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    restaurantName,
    address,
    phone,
    ownerName,
    ownerCnic,
    ownerContact,
    ownerSignature,
    logoPath,
    ownerPhotoPath,
    paperSize,
    footerNote,
    adminPin,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.restaurantName == this.restaurantName &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.ownerName == this.ownerName &&
          other.ownerCnic == this.ownerCnic &&
          other.ownerContact == this.ownerContact &&
          other.ownerSignature == this.ownerSignature &&
          other.logoPath == this.logoPath &&
          other.ownerPhotoPath == this.ownerPhotoPath &&
          other.paperSize == this.paperSize &&
          other.footerNote == this.footerNote &&
          other.adminPin == this.adminPin);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String> restaurantName;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> ownerName;
  final Value<String?> ownerCnic;
  final Value<String?> ownerContact;
  final Value<String?> ownerSignature;
  final Value<String?> logoPath;
  final Value<String?> ownerPhotoPath;
  final Value<String> paperSize;
  final Value<String?> footerNote;
  final Value<String> adminPin;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.restaurantName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.ownerCnic = const Value.absent(),
    this.ownerContact = const Value.absent(),
    this.ownerSignature = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.ownerPhotoPath = const Value.absent(),
    this.paperSize = const Value.absent(),
    this.footerNote = const Value.absent(),
    this.adminPin = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.restaurantName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.ownerCnic = const Value.absent(),
    this.ownerContact = const Value.absent(),
    this.ownerSignature = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.ownerPhotoPath = const Value.absent(),
    this.paperSize = const Value.absent(),
    this.footerNote = const Value.absent(),
    this.adminPin = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<String>? restaurantName,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? ownerName,
    Expression<String>? ownerCnic,
    Expression<String>? ownerContact,
    Expression<String>? ownerSignature,
    Expression<String>? logoPath,
    Expression<String>? ownerPhotoPath,
    Expression<String>? paperSize,
    Expression<String>? footerNote,
    Expression<String>? adminPin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (restaurantName != null) 'restaurant_name': restaurantName,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (ownerName != null) 'owner_name': ownerName,
      if (ownerCnic != null) 'owner_cnic': ownerCnic,
      if (ownerContact != null) 'owner_contact': ownerContact,
      if (ownerSignature != null) 'owner_signature': ownerSignature,
      if (logoPath != null) 'logo_path': logoPath,
      if (ownerPhotoPath != null) 'owner_photo_path': ownerPhotoPath,
      if (paperSize != null) 'paper_size': paperSize,
      if (footerNote != null) 'footer_note': footerNote,
      if (adminPin != null) 'admin_pin': adminPin,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? restaurantName,
    Value<String?>? address,
    Value<String?>? phone,
    Value<String?>? ownerName,
    Value<String?>? ownerCnic,
    Value<String?>? ownerContact,
    Value<String?>? ownerSignature,
    Value<String?>? logoPath,
    Value<String?>? ownerPhotoPath,
    Value<String>? paperSize,
    Value<String?>? footerNote,
    Value<String>? adminPin,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      restaurantName: restaurantName ?? this.restaurantName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      ownerName: ownerName ?? this.ownerName,
      ownerCnic: ownerCnic ?? this.ownerCnic,
      ownerContact: ownerContact ?? this.ownerContact,
      ownerSignature: ownerSignature ?? this.ownerSignature,
      logoPath: logoPath ?? this.logoPath,
      ownerPhotoPath: ownerPhotoPath ?? this.ownerPhotoPath,
      paperSize: paperSize ?? this.paperSize,
      footerNote: footerNote ?? this.footerNote,
      adminPin: adminPin ?? this.adminPin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (restaurantName.present) {
      map['restaurant_name'] = Variable<String>(restaurantName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (ownerCnic.present) {
      map['owner_cnic'] = Variable<String>(ownerCnic.value);
    }
    if (ownerContact.present) {
      map['owner_contact'] = Variable<String>(ownerContact.value);
    }
    if (ownerSignature.present) {
      map['owner_signature'] = Variable<String>(ownerSignature.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (ownerPhotoPath.present) {
      map['owner_photo_path'] = Variable<String>(ownerPhotoPath.value);
    }
    if (paperSize.present) {
      map['paper_size'] = Variable<String>(paperSize.value);
    }
    if (footerNote.present) {
      map['footer_note'] = Variable<String>(footerNote.value);
    }
    if (adminPin.present) {
      map['admin_pin'] = Variable<String>(adminPin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('restaurantName: $restaurantName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('ownerName: $ownerName, ')
          ..write('ownerCnic: $ownerCnic, ')
          ..write('ownerContact: $ownerContact, ')
          ..write('ownerSignature: $ownerSignature, ')
          ..write('logoPath: $logoPath, ')
          ..write('ownerPhotoPath: $ownerPhotoPath, ')
          ..write('paperSize: $paperSize, ')
          ..write('footerNote: $footerNote, ')
          ..write('adminPin: $adminPin')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  const Category({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({int? id, String? name}) =>
      Category(id: id ?? this.id, name: name ?? this.name);
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoriesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MenuItemsTable extends MenuItems
    with TableInfo<$MenuItemsTable, MenuItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salePriceMeta = const VerificationMeta(
    'salePrice',
  );
  @override
  late final GeneratedColumn<double> salePrice = GeneratedColumn<double>(
    'sale_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costPriceMeta = const VerificationMeta(
    'costPrice',
  );
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
    'cost_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAvailableMeta = const VerificationMeta(
    'isAvailable',
  );
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
    'is_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    name,
    salePrice,
    costPrice,
    isAvailable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<MenuItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sale_price')) {
      context.handle(
        _salePriceMeta,
        salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta),
      );
    } else if (isInserting) {
      context.missing(_salePriceMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(
        _costPriceMeta,
        costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta),
      );
    }
    if (data.containsKey('is_available')) {
      context.handle(
        _isAvailableMeta,
        isAvailable.isAcceptableOrUnknown(
          data['is_available']!,
          _isAvailableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      salePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sale_price'],
      )!,
      costPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_price'],
      ),
      isAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_available'],
      )!,
    );
  }

  @override
  $MenuItemsTable createAlias(String alias) {
    return $MenuItemsTable(attachedDatabase, alias);
  }
}

class MenuItem extends DataClass implements Insertable<MenuItem> {
  final int id;
  final int categoryId;
  final String name;
  final double salePrice;
  final double? costPrice;
  final bool isAvailable;
  const MenuItem({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.salePrice,
    this.costPrice,
    required this.isAvailable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    map['sale_price'] = Variable<double>(salePrice);
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    return map;
  }

  MenuItemsCompanion toCompanion(bool nullToAbsent) {
    return MenuItemsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      salePrice: Value(salePrice),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      isAvailable: Value(isAvailable),
    );
  }

  factory MenuItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuItem(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      costPrice: serializer.fromJson<double?>(json['costPrice']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'salePrice': serializer.toJson<double>(salePrice),
      'costPrice': serializer.toJson<double?>(costPrice),
      'isAvailable': serializer.toJson<bool>(isAvailable),
    };
  }

  MenuItem copyWith({
    int? id,
    int? categoryId,
    String? name,
    double? salePrice,
    Value<double?> costPrice = const Value.absent(),
    bool? isAvailable,
  }) => MenuItem(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    salePrice: salePrice ?? this.salePrice,
    costPrice: costPrice.present ? costPrice.value : this.costPrice,
    isAvailable: isAvailable ?? this.isAvailable,
  );
  MenuItem copyWithCompanion(MenuItemsCompanion data) {
    return MenuItem(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      isAvailable: data.isAvailable.present
          ? data.isAvailable.value
          : this.isAvailable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuItem(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('salePrice: $salePrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('isAvailable: $isAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, name, salePrice, costPrice, isAvailable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuItem &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.salePrice == this.salePrice &&
          other.costPrice == this.costPrice &&
          other.isAvailable == this.isAvailable);
}

class MenuItemsCompanion extends UpdateCompanion<MenuItem> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<double> salePrice;
  final Value<double?> costPrice;
  final Value<bool> isAvailable;
  const MenuItemsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.isAvailable = const Value.absent(),
  });
  MenuItemsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String name,
    required double salePrice,
    this.costPrice = const Value.absent(),
    this.isAvailable = const Value.absent(),
  }) : categoryId = Value(categoryId),
       name = Value(name),
       salePrice = Value(salePrice);
  static Insertable<MenuItem> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<double>? salePrice,
    Expression<double>? costPrice,
    Expression<bool>? isAvailable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (salePrice != null) 'sale_price': salePrice,
      if (costPrice != null) 'cost_price': costPrice,
      if (isAvailable != null) 'is_available': isAvailable,
    });
  }

  MenuItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<String>? name,
    Value<double>? salePrice,
    Value<double?>? costPrice,
    Value<bool>? isAvailable,
  }) {
    return MenuItemsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      salePrice: salePrice ?? this.salePrice,
      costPrice: costPrice ?? this.costPrice,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<double>(salePrice.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('salePrice: $salePrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('isAvailable: $isAvailable')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
    'invoice_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderTypeMeta = const VerificationMeta(
    'orderType',
  );
  @override
  late final GeneratedColumn<String> orderType = GeneratedColumn<String>(
    'order_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Dine-in'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PAID'),
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _grandTotalMeta = const VerificationMeta(
    'grandTotal',
  );
  @override
  late final GeneratedColumn<double> grandTotal = GeneratedColumn<double>(
    'grand_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receivedAmountMeta = const VerificationMeta(
    'receivedAmount',
  );
  @override
  late final GeneratedColumn<double> receivedAmount = GeneratedColumn<double>(
    'received_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceAmountMeta = const VerificationMeta(
    'balanceAmount',
  );
  @override
  late final GeneratedColumn<double> balanceAmount = GeneratedColumn<double>(
    'balance_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pdfPathMeta = const VerificationMeta(
    'pdfPath',
  );
  @override
  late final GeneratedColumn<String> pdfPath = GeneratedColumn<String>(
    'pdf_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNumber,
    date,
    customerName,
    orderType,
    status,
    subtotal,
    discount,
    grandTotal,
    receivedAmount,
    balanceAmount,
    pdfPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    }
    if (data.containsKey('order_type')) {
      context.handle(
        _orderTypeMeta,
        orderType.isAcceptableOrUnknown(data['order_type']!, _orderTypeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('grand_total')) {
      context.handle(
        _grandTotalMeta,
        grandTotal.isAcceptableOrUnknown(data['grand_total']!, _grandTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_grandTotalMeta);
    }
    if (data.containsKey('received_amount')) {
      context.handle(
        _receivedAmountMeta,
        receivedAmount.isAcceptableOrUnknown(
          data['received_amount']!,
          _receivedAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_receivedAmountMeta);
    }
    if (data.containsKey('balance_amount')) {
      context.handle(
        _balanceAmountMeta,
        balanceAmount.isAcceptableOrUnknown(
          data['balance_amount']!,
          _balanceAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_balanceAmountMeta);
    }
    if (data.containsKey('pdf_path')) {
      context.handle(
        _pdfPathMeta,
        pdfPath.isAcceptableOrUnknown(data['pdf_path']!, _pdfPathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_number'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      ),
      orderType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      )!,
      grandTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grand_total'],
      )!,
      receivedAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}received_amount'],
      )!,
      balanceAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balance_amount'],
      )!,
      pdfPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pdf_path'],
      ),
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final int id;
  final String invoiceNumber;
  final DateTime date;
  final String? customerName;
  final String orderType;
  final String status;
  final double subtotal;
  final double discount;
  final double grandTotal;
  final double receivedAmount;
  final double balanceAmount;
  final String? pdfPath;
  const Invoice({
    required this.id,
    required this.invoiceNumber,
    required this.date,
    this.customerName,
    required this.orderType,
    required this.status,
    required this.subtotal,
    required this.discount,
    required this.grandTotal,
    required this.receivedAmount,
    required this.balanceAmount,
    this.pdfPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    map['order_type'] = Variable<String>(orderType);
    map['status'] = Variable<String>(status);
    map['subtotal'] = Variable<double>(subtotal);
    map['discount'] = Variable<double>(discount);
    map['grand_total'] = Variable<double>(grandTotal);
    map['received_amount'] = Variable<double>(receivedAmount);
    map['balance_amount'] = Variable<double>(balanceAmount);
    if (!nullToAbsent || pdfPath != null) {
      map['pdf_path'] = Variable<String>(pdfPath);
    }
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      invoiceNumber: Value(invoiceNumber),
      date: Value(date),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      orderType: Value(orderType),
      status: Value(status),
      subtotal: Value(subtotal),
      discount: Value(discount),
      grandTotal: Value(grandTotal),
      receivedAmount: Value(receivedAmount),
      balanceAmount: Value(balanceAmount),
      pdfPath: pdfPath == null && nullToAbsent
          ? const Value.absent()
          : Value(pdfPath),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<int>(json['id']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      date: serializer.fromJson<DateTime>(json['date']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      orderType: serializer.fromJson<String>(json['orderType']),
      status: serializer.fromJson<String>(json['status']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discount: serializer.fromJson<double>(json['discount']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      receivedAmount: serializer.fromJson<double>(json['receivedAmount']),
      balanceAmount: serializer.fromJson<double>(json['balanceAmount']),
      pdfPath: serializer.fromJson<String?>(json['pdfPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'date': serializer.toJson<DateTime>(date),
      'customerName': serializer.toJson<String?>(customerName),
      'orderType': serializer.toJson<String>(orderType),
      'status': serializer.toJson<String>(status),
      'subtotal': serializer.toJson<double>(subtotal),
      'discount': serializer.toJson<double>(discount),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'receivedAmount': serializer.toJson<double>(receivedAmount),
      'balanceAmount': serializer.toJson<double>(balanceAmount),
      'pdfPath': serializer.toJson<String?>(pdfPath),
    };
  }

  Invoice copyWith({
    int? id,
    String? invoiceNumber,
    DateTime? date,
    Value<String?> customerName = const Value.absent(),
    String? orderType,
    String? status,
    double? subtotal,
    double? discount,
    double? grandTotal,
    double? receivedAmount,
    double? balanceAmount,
    Value<String?> pdfPath = const Value.absent(),
  }) => Invoice(
    id: id ?? this.id,
    invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    date: date ?? this.date,
    customerName: customerName.present ? customerName.value : this.customerName,
    orderType: orderType ?? this.orderType,
    status: status ?? this.status,
    subtotal: subtotal ?? this.subtotal,
    discount: discount ?? this.discount,
    grandTotal: grandTotal ?? this.grandTotal,
    receivedAmount: receivedAmount ?? this.receivedAmount,
    balanceAmount: balanceAmount ?? this.balanceAmount,
    pdfPath: pdfPath.present ? pdfPath.value : this.pdfPath,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      date: data.date.present ? data.date.value : this.date,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      status: data.status.present ? data.status.value : this.status,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      grandTotal: data.grandTotal.present
          ? data.grandTotal.value
          : this.grandTotal,
      receivedAmount: data.receivedAmount.present
          ? data.receivedAmount.value
          : this.receivedAmount,
      balanceAmount: data.balanceAmount.present
          ? data.balanceAmount.value
          : this.balanceAmount,
      pdfPath: data.pdfPath.present ? data.pdfPath.value : this.pdfPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('date: $date, ')
          ..write('customerName: $customerName, ')
          ..write('orderType: $orderType, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('receivedAmount: $receivedAmount, ')
          ..write('balanceAmount: $balanceAmount, ')
          ..write('pdfPath: $pdfPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceNumber,
    date,
    customerName,
    orderType,
    status,
    subtotal,
    discount,
    grandTotal,
    receivedAmount,
    balanceAmount,
    pdfPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.invoiceNumber == this.invoiceNumber &&
          other.date == this.date &&
          other.customerName == this.customerName &&
          other.orderType == this.orderType &&
          other.status == this.status &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.grandTotal == this.grandTotal &&
          other.receivedAmount == this.receivedAmount &&
          other.balanceAmount == this.balanceAmount &&
          other.pdfPath == this.pdfPath);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<int> id;
  final Value<String> invoiceNumber;
  final Value<DateTime> date;
  final Value<String?> customerName;
  final Value<String> orderType;
  final Value<String> status;
  final Value<double> subtotal;
  final Value<double> discount;
  final Value<double> grandTotal;
  final Value<double> receivedAmount;
  final Value<double> balanceAmount;
  final Value<String?> pdfPath;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.date = const Value.absent(),
    this.customerName = const Value.absent(),
    this.orderType = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.receivedAmount = const Value.absent(),
    this.balanceAmount = const Value.absent(),
    this.pdfPath = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceNumber,
    required DateTime date,
    this.customerName = const Value.absent(),
    this.orderType = const Value.absent(),
    this.status = const Value.absent(),
    required double subtotal,
    this.discount = const Value.absent(),
    required double grandTotal,
    required double receivedAmount,
    required double balanceAmount,
    this.pdfPath = const Value.absent(),
  }) : invoiceNumber = Value(invoiceNumber),
       date = Value(date),
       subtotal = Value(subtotal),
       grandTotal = Value(grandTotal),
       receivedAmount = Value(receivedAmount),
       balanceAmount = Value(balanceAmount);
  static Insertable<Invoice> custom({
    Expression<int>? id,
    Expression<String>? invoiceNumber,
    Expression<DateTime>? date,
    Expression<String>? customerName,
    Expression<String>? orderType,
    Expression<String>? status,
    Expression<double>? subtotal,
    Expression<double>? discount,
    Expression<double>? grandTotal,
    Expression<double>? receivedAmount,
    Expression<double>? balanceAmount,
    Expression<String>? pdfPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (date != null) 'date': date,
      if (customerName != null) 'customer_name': customerName,
      if (orderType != null) 'order_type': orderType,
      if (status != null) 'status': status,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (receivedAmount != null) 'received_amount': receivedAmount,
      if (balanceAmount != null) 'balance_amount': balanceAmount,
      if (pdfPath != null) 'pdf_path': pdfPath,
    });
  }

  InvoicesCompanion copyWith({
    Value<int>? id,
    Value<String>? invoiceNumber,
    Value<DateTime>? date,
    Value<String?>? customerName,
    Value<String>? orderType,
    Value<String>? status,
    Value<double>? subtotal,
    Value<double>? discount,
    Value<double>? grandTotal,
    Value<double>? receivedAmount,
    Value<double>? balanceAmount,
    Value<String?>? pdfPath,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      date: date ?? this.date,
      customerName: customerName ?? this.customerName,
      orderType: orderType ?? this.orderType,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      grandTotal: grandTotal ?? this.grandTotal,
      receivedAmount: receivedAmount ?? this.receivedAmount,
      balanceAmount: balanceAmount ?? this.balanceAmount,
      pdfPath: pdfPath ?? this.pdfPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (receivedAmount.present) {
      map['received_amount'] = Variable<double>(receivedAmount.value);
    }
    if (balanceAmount.present) {
      map['balance_amount'] = Variable<double>(balanceAmount.value);
    }
    if (pdfPath.present) {
      map['pdf_path'] = Variable<String>(pdfPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('date: $date, ')
          ..write('customerName: $customerName, ')
          ..write('orderType: $orderType, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('receivedAmount: $receivedAmount, ')
          ..write('balanceAmount: $balanceAmount, ')
          ..write('pdfPath: $pdfPath')
          ..write(')'))
        .toString();
  }
}

class $InvoiceItemsTable extends InvoiceItems
    with TableInfo<$InvoiceItemsTable, InvoiceItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id)',
    ),
  );
  static const VerificationMeta _menuItemIdMeta = const VerificationMeta(
    'menuItemId',
  );
  @override
  late final GeneratedColumn<int> menuItemId = GeneratedColumn<int>(
    'menu_item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES menu_items (id)',
    ),
  );
  static const VerificationMeta _itemNameMeta = const VerificationMeta(
    'itemName',
  );
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
    'item_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    menuItemId,
    itemName,
    quantity,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('menu_item_id')) {
      context.handle(
        _menuItemIdMeta,
        menuItemId.isAcceptableOrUnknown(
          data['menu_item_id']!,
          _menuItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_menuItemIdMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(
        _itemNameMeta,
        itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta),
      );
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      menuItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}menu_item_id'],
      )!,
      itemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
    );
  }

  @override
  $InvoiceItemsTable createAlias(String alias) {
    return $InvoiceItemsTable(attachedDatabase, alias);
  }
}

class InvoiceItem extends DataClass implements Insertable<InvoiceItem> {
  final int id;
  final int invoiceId;
  final int menuItemId;
  final String itemName;
  final int quantity;
  final double price;
  const InvoiceItem({
    required this.id,
    required this.invoiceId,
    required this.menuItemId,
    required this.itemName,
    required this.quantity,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['menu_item_id'] = Variable<int>(menuItemId);
    map['item_name'] = Variable<String>(itemName);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    return map;
  }

  InvoiceItemsCompanion toCompanion(bool nullToAbsent) {
    return InvoiceItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      menuItemId: Value(menuItemId),
      itemName: Value(itemName),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory InvoiceItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceItem(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      menuItemId: serializer.fromJson<int>(json['menuItemId']),
      itemName: serializer.fromJson<String>(json['itemName']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'menuItemId': serializer.toJson<int>(menuItemId),
      'itemName': serializer.toJson<String>(itemName),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
    };
  }

  InvoiceItem copyWith({
    int? id,
    int? invoiceId,
    int? menuItemId,
    String? itemName,
    int? quantity,
    double? price,
  }) => InvoiceItem(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    menuItemId: menuItemId ?? this.menuItemId,
    itemName: itemName ?? this.itemName,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
  );
  InvoiceItem copyWithCompanion(InvoiceItemsCompanion data) {
    return InvoiceItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      menuItemId: data.menuItemId.present
          ? data.menuItemId.value
          : this.menuItemId,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, invoiceId, menuItemId, itemName, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.menuItemId == this.menuItemId &&
          other.itemName == this.itemName &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class InvoiceItemsCompanion extends UpdateCompanion<InvoiceItem> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<int> menuItemId;
  final Value<String> itemName;
  final Value<int> quantity;
  final Value<double> price;
  const InvoiceItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.menuItemId = const Value.absent(),
    this.itemName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  InvoiceItemsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required int menuItemId,
    required String itemName,
    required int quantity,
    required double price,
  }) : invoiceId = Value(invoiceId),
       menuItemId = Value(menuItemId),
       itemName = Value(itemName),
       quantity = Value(quantity),
       price = Value(price);
  static Insertable<InvoiceItem> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? menuItemId,
    Expression<String>? itemName,
    Expression<int>? quantity,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (menuItemId != null) 'menu_item_id': menuItemId,
      if (itemName != null) 'item_name': itemName,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  InvoiceItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<int>? menuItemId,
    Value<String>? itemName,
    Value<int>? quantity,
    Value<double>? price,
  }) {
    return InvoiceItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      menuItemId: menuItemId ?? this.menuItemId,
      itemName: itemName ?? this.itemName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (menuItemId.present) {
      map['menu_item_id'] = Variable<int>(menuItemId.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, category, amount, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final DateTime date;
  final String category;
  final double amount;
  final String? notes;
  const Expense({
    required this.id,
    required this.date,
    required this.category,
    required this.amount,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      date: Value(date),
      category: Value(category),
      amount: Value(amount),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<double>(amount),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Expense copyWith({
    int? id,
    DateTime? date,
    String? category,
    double? amount,
    Value<String?> notes = const Value.absent(),
  }) => Expense(
    id: id ?? this.id,
    date: date ?? this.date,
    category: category ?? this.category,
    amount: amount ?? this.amount,
    notes: notes.present ? notes.value : this.notes,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, category, amount, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.notes == this.notes);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> category;
  final Value<double> amount;
  final Value<String?> notes;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String category,
    required double amount,
    this.notes = const Value.absent(),
  }) : date = Value(date),
       category = Value(category),
       amount = Value(amount);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (notes != null) 'notes': notes,
    });
  }

  ExpensesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? category,
    Value<double>? amount,
    Value<String?>? notes,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $StaffTable extends Staff with TableInfo<$StaffTable, StaffData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<double> salary = GeneratedColumn<double>(
    'salary',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, role, salary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff';
  @override
  VerificationContext validateIntegrity(
    Insertable<StaffData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('salary')) {
      context.handle(
        _salaryMeta,
        salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta),
      );
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      salary: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salary'],
      )!,
    );
  }

  @override
  $StaffTable createAlias(String alias) {
    return $StaffTable(attachedDatabase, alias);
  }
}

class StaffData extends DataClass implements Insertable<StaffData> {
  final int id;
  final String name;
  final String phone;
  final String role;
  final double salary;
  const StaffData({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.salary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['role'] = Variable<String>(role);
    map['salary'] = Variable<double>(salary);
    return map;
  }

  StaffCompanion toCompanion(bool nullToAbsent) {
    return StaffCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      role: Value(role),
      salary: Value(salary),
    );
  }

  factory StaffData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      role: serializer.fromJson<String>(json['role']),
      salary: serializer.fromJson<double>(json['salary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'role': serializer.toJson<String>(role),
      'salary': serializer.toJson<double>(salary),
    };
  }

  StaffData copyWith({
    int? id,
    String? name,
    String? phone,
    String? role,
    double? salary,
  }) => StaffData(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    role: role ?? this.role,
    salary: salary ?? this.salary,
  );
  StaffData copyWithCompanion(StaffCompanion data) {
    return StaffData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      role: data.role.present ? data.role.value : this.role,
      salary: data.salary.present ? data.salary.value : this.salary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('salary: $salary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, role, salary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.role == this.role &&
          other.salary == this.salary);
}

class StaffCompanion extends UpdateCompanion<StaffData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> role;
  final Value<double> salary;
  const StaffCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.role = const Value.absent(),
    this.salary = const Value.absent(),
  });
  StaffCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
    required String role,
    required double salary,
  }) : name = Value(name),
       phone = Value(phone),
       role = Value(role),
       salary = Value(salary);
  static Insertable<StaffData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? role,
    Expression<double>? salary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (role != null) 'role': role,
      if (salary != null) 'salary': salary,
    });
  }

  StaffCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? role,
    Value<double>? salary,
  }) {
    return StaffCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      salary: salary ?? this.salary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (salary.present) {
      map['salary'] = Variable<double>(salary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('salary: $salary')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTable extends Attendance
    with TableInfo<$AttendanceTable, AttendanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _staffIdMeta = const VerificationMeta(
    'staffId',
  );
  @override
  late final GeneratedColumn<int> staffId = GeneratedColumn<int>(
    'staff_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES staff (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, staffId, date, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('staff_id')) {
      context.handle(
        _staffIdMeta,
        staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta),
      );
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      staffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}staff_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $AttendanceTable createAlias(String alias) {
    return $AttendanceTable(attachedDatabase, alias);
  }
}

class AttendanceData extends DataClass implements Insertable<AttendanceData> {
  final int id;
  final int staffId;
  final DateTime date;
  final String status;
  const AttendanceData({
    required this.id,
    required this.staffId,
    required this.date,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['staff_id'] = Variable<int>(staffId);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    return map;
  }

  AttendanceCompanion toCompanion(bool nullToAbsent) {
    return AttendanceCompanion(
      id: Value(id),
      staffId: Value(staffId),
      date: Value(date),
      status: Value(status),
    );
  }

  factory AttendanceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceData(
      id: serializer.fromJson<int>(json['id']),
      staffId: serializer.fromJson<int>(json['staffId']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'staffId': serializer.toJson<int>(staffId),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
    };
  }

  AttendanceData copyWith({
    int? id,
    int? staffId,
    DateTime? date,
    String? status,
  }) => AttendanceData(
    id: id ?? this.id,
    staffId: staffId ?? this.staffId,
    date: date ?? this.date,
    status: status ?? this.status,
  );
  AttendanceData copyWithCompanion(AttendanceCompanion data) {
    return AttendanceData(
      id: data.id.present ? data.id.value : this.id,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceData(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, staffId, date, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceData &&
          other.id == this.id &&
          other.staffId == this.staffId &&
          other.date == this.date &&
          other.status == this.status);
}

class AttendanceCompanion extends UpdateCompanion<AttendanceData> {
  final Value<int> id;
  final Value<int> staffId;
  final Value<DateTime> date;
  final Value<String> status;
  const AttendanceCompanion({
    this.id = const Value.absent(),
    this.staffId = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
  });
  AttendanceCompanion.insert({
    this.id = const Value.absent(),
    required int staffId,
    required DateTime date,
    required String status,
  }) : staffId = Value(staffId),
       date = Value(date),
       status = Value(status);
  static Insertable<AttendanceData> custom({
    Expression<int>? id,
    Expression<int>? staffId,
    Expression<DateTime>? date,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (staffId != null) 'staff_id': staffId,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
    });
  }

  AttendanceCompanion copyWith({
    Value<int>? id,
    Value<int>? staffId,
    Value<DateTime>? date,
    Value<String>? status,
  }) {
    return AttendanceCompanion(
      id: id ?? this.id,
      staffId: staffId ?? this.staffId,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<int>(staffId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceCompanion(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $SalariesTable extends Salaries with TableInfo<$SalariesTable, Salary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _staffIdMeta = const VerificationMeta(
    'staffId',
  );
  @override
  late final GeneratedColumn<int> staffId = GeneratedColumn<int>(
    'staff_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES staff (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PAID'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, staffId, date, amount, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'salaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Salary> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('staff_id')) {
      context.handle(
        _staffIdMeta,
        staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta),
      );
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Salary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Salary(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      staffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}staff_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $SalariesTable createAlias(String alias) {
    return $SalariesTable(attachedDatabase, alias);
  }
}

class Salary extends DataClass implements Insertable<Salary> {
  final int id;
  final int staffId;
  final DateTime date;
  final double amount;
  final String status;
  const Salary({
    required this.id,
    required this.staffId,
    required this.date,
    required this.amount,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['staff_id'] = Variable<int>(staffId);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    map['status'] = Variable<String>(status);
    return map;
  }

  SalariesCompanion toCompanion(bool nullToAbsent) {
    return SalariesCompanion(
      id: Value(id),
      staffId: Value(staffId),
      date: Value(date),
      amount: Value(amount),
      status: Value(status),
    );
  }

  factory Salary.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Salary(
      id: serializer.fromJson<int>(json['id']),
      staffId: serializer.fromJson<int>(json['staffId']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'staffId': serializer.toJson<int>(staffId),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
      'status': serializer.toJson<String>(status),
    };
  }

  Salary copyWith({
    int? id,
    int? staffId,
    DateTime? date,
    double? amount,
    String? status,
  }) => Salary(
    id: id ?? this.id,
    staffId: staffId ?? this.staffId,
    date: date ?? this.date,
    amount: amount ?? this.amount,
    status: status ?? this.status,
  );
  Salary copyWithCompanion(SalariesCompanion data) {
    return Salary(
      id: data.id.present ? data.id.value : this.id,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Salary(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, staffId, date, amount, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Salary &&
          other.id == this.id &&
          other.staffId == this.staffId &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.status == this.status);
}

class SalariesCompanion extends UpdateCompanion<Salary> {
  final Value<int> id;
  final Value<int> staffId;
  final Value<DateTime> date;
  final Value<double> amount;
  final Value<String> status;
  const SalariesCompanion({
    this.id = const Value.absent(),
    this.staffId = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.status = const Value.absent(),
  });
  SalariesCompanion.insert({
    this.id = const Value.absent(),
    required int staffId,
    required DateTime date,
    required double amount,
    this.status = const Value.absent(),
  }) : staffId = Value(staffId),
       date = Value(date),
       amount = Value(amount);
  static Insertable<Salary> custom({
    Expression<int>? id,
    Expression<int>? staffId,
    Expression<DateTime>? date,
    Expression<double>? amount,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (staffId != null) 'staff_id': staffId,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (status != null) 'status': status,
    });
  }

  SalariesCompanion copyWith({
    Value<int>? id,
    Value<int>? staffId,
    Value<DateTime>? date,
    Value<double>? amount,
    Value<String>? status,
  }) {
    return SalariesCompanion(
      id: id ?? this.id,
      staffId: staffId ?? this.staffId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<int>(staffId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalariesCompanion(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, Supplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Supplier> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Supplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplier(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class Supplier extends DataClass implements Insertable<Supplier> {
  final int id;
  final String name;
  final String phone;
  final String? address;
  const Supplier({
    required this.id,
    required this.name,
    required this.phone,
    this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory Supplier.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supplier(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String?>(address),
    };
  }

  Supplier copyWith({
    int? id,
    String? name,
    String? phone,
    Value<String?> address = const Value.absent(),
  }) => Supplier(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    address: address.present ? address.value : this.address,
  );
  Supplier copyWithCompanion(SuppliersCompanion data) {
    return Supplier(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Supplier(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplier &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address);
}

class SuppliersCompanion extends UpdateCompanion<Supplier> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String?> address;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
    this.address = const Value.absent(),
  }) : name = Value(name),
       phone = Value(phone);
  static Insertable<Supplier> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
    });
  }

  SuppliersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String?>? address,
  }) {
    return SuppliersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $SupplierItemsTable extends SupplierItems
    with TableInfo<$SupplierItemsTable, SupplierItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES suppliers (id)',
    ),
  );
  static const VerificationMeta _itemNameMeta = const VerificationMeta(
    'itemName',
  );
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
    'item_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierId,
    itemName,
    purchasePrice,
    unit,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(
        _itemNameMeta,
        itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta),
      );
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      )!,
      itemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_price'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
    );
  }

  @override
  $SupplierItemsTable createAlias(String alias) {
    return $SupplierItemsTable(attachedDatabase, alias);
  }
}

class SupplierItem extends DataClass implements Insertable<SupplierItem> {
  final int id;
  final int supplierId;
  final String itemName;
  final double purchasePrice;
  final String unit;
  const SupplierItem({
    required this.id,
    required this.supplierId,
    required this.itemName,
    required this.purchasePrice,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['item_name'] = Variable<String>(itemName);
    map['purchase_price'] = Variable<double>(purchasePrice);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  SupplierItemsCompanion toCompanion(bool nullToAbsent) {
    return SupplierItemsCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      itemName: Value(itemName),
      purchasePrice: Value(purchasePrice),
      unit: Value(unit),
    );
  }

  factory SupplierItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierItem(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      itemName: serializer.fromJson<String>(json['itemName']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'itemName': serializer.toJson<String>(itemName),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'unit': serializer.toJson<String>(unit),
    };
  }

  SupplierItem copyWith({
    int? id,
    int? supplierId,
    String? itemName,
    double? purchasePrice,
    String? unit,
  }) => SupplierItem(
    id: id ?? this.id,
    supplierId: supplierId ?? this.supplierId,
    itemName: itemName ?? this.itemName,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    unit: unit ?? this.unit,
  );
  SupplierItem copyWithCompanion(SupplierItemsCompanion data) {
    return SupplierItem(
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierItem(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('itemName: $itemName, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, supplierId, itemName, purchasePrice, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierItem &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.itemName == this.itemName &&
          other.purchasePrice == this.purchasePrice &&
          other.unit == this.unit);
}

class SupplierItemsCompanion extends UpdateCompanion<SupplierItem> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<String> itemName;
  final Value<double> purchasePrice;
  final Value<String> unit;
  const SupplierItemsCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.itemName = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.unit = const Value.absent(),
  });
  SupplierItemsCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    required String itemName,
    required double purchasePrice,
    required String unit,
  }) : supplierId = Value(supplierId),
       itemName = Value(itemName),
       purchasePrice = Value(purchasePrice),
       unit = Value(unit);
  static Insertable<SupplierItem> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<String>? itemName,
    Expression<double>? purchasePrice,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (itemName != null) 'item_name': itemName,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (unit != null) 'unit': unit,
    });
  }

  SupplierItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? supplierId,
    Value<String>? itemName,
    Value<double>? purchasePrice,
    Value<String>? unit,
  }) {
    return SupplierItemsCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      itemName: itemName ?? this.itemName,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierItemsCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('itemName: $itemName, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $MenuItemsTable menuItems = $MenuItemsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceItemsTable invoiceItems = $InvoiceItemsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $StaffTable staff = $StaffTable(this);
  late final $AttendanceTable attendance = $AttendanceTable(this);
  late final $SalariesTable salaries = $SalariesTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $SupplierItemsTable supplierItems = $SupplierItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    settings,
    categories,
    menuItems,
    invoices,
    invoiceItems,
    expenses,
    staff,
    attendance,
    salaries,
    suppliers,
    supplierItems,
  ];
}

typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<String> restaurantName,
      Value<String?> address,
      Value<String?> phone,
      Value<String?> ownerName,
      Value<String?> ownerCnic,
      Value<String?> ownerContact,
      Value<String?> ownerSignature,
      Value<String?> logoPath,
      Value<String?> ownerPhotoPath,
      Value<String> paperSize,
      Value<String?> footerNote,
      Value<String> adminPin,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<String> restaurantName,
      Value<String?> address,
      Value<String?> phone,
      Value<String?> ownerName,
      Value<String?> ownerCnic,
      Value<String?> ownerContact,
      Value<String?> ownerSignature,
      Value<String?> logoPath,
      Value<String?> ownerPhotoPath,
      Value<String> paperSize,
      Value<String?> footerNote,
      Value<String> adminPin,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get restaurantName => $composableBuilder(
    column: $table.restaurantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerCnic => $composableBuilder(
    column: $table.ownerCnic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerContact => $composableBuilder(
    column: $table.ownerContact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerSignature => $composableBuilder(
    column: $table.ownerSignature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerPhotoPath => $composableBuilder(
    column: $table.ownerPhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paperSize => $composableBuilder(
    column: $table.paperSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get footerNote => $composableBuilder(
    column: $table.footerNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adminPin => $composableBuilder(
    column: $table.adminPin,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get restaurantName => $composableBuilder(
    column: $table.restaurantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerCnic => $composableBuilder(
    column: $table.ownerCnic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerContact => $composableBuilder(
    column: $table.ownerContact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerSignature => $composableBuilder(
    column: $table.ownerSignature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerPhotoPath => $composableBuilder(
    column: $table.ownerPhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paperSize => $composableBuilder(
    column: $table.paperSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get footerNote => $composableBuilder(
    column: $table.footerNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adminPin => $composableBuilder(
    column: $table.adminPin,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get restaurantName => $composableBuilder(
    column: $table.restaurantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  GeneratedColumn<String> get ownerCnic =>
      $composableBuilder(column: $table.ownerCnic, builder: (column) => column);

  GeneratedColumn<String> get ownerContact => $composableBuilder(
    column: $table.ownerContact,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerSignature => $composableBuilder(
    column: $table.ownerSignature,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<String> get ownerPhotoPath => $composableBuilder(
    column: $table.ownerPhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paperSize =>
      $composableBuilder(column: $table.paperSize, builder: (column) => column);

  GeneratedColumn<String> get footerNote => $composableBuilder(
    column: $table.footerNote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get adminPin =>
      $composableBuilder(column: $table.adminPin, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> restaurantName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> ownerName = const Value.absent(),
                Value<String?> ownerCnic = const Value.absent(),
                Value<String?> ownerContact = const Value.absent(),
                Value<String?> ownerSignature = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String?> ownerPhotoPath = const Value.absent(),
                Value<String> paperSize = const Value.absent(),
                Value<String?> footerNote = const Value.absent(),
                Value<String> adminPin = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                restaurantName: restaurantName,
                address: address,
                phone: phone,
                ownerName: ownerName,
                ownerCnic: ownerCnic,
                ownerContact: ownerContact,
                ownerSignature: ownerSignature,
                logoPath: logoPath,
                ownerPhotoPath: ownerPhotoPath,
                paperSize: paperSize,
                footerNote: footerNote,
                adminPin: adminPin,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> restaurantName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> ownerName = const Value.absent(),
                Value<String?> ownerCnic = const Value.absent(),
                Value<String?> ownerContact = const Value.absent(),
                Value<String?> ownerSignature = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String?> ownerPhotoPath = const Value.absent(),
                Value<String> paperSize = const Value.absent(),
                Value<String?> footerNote = const Value.absent(),
                Value<String> adminPin = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                restaurantName: restaurantName,
                address: address,
                phone: phone,
                ownerName: ownerName,
                ownerCnic: ownerCnic,
                ownerContact: ownerContact,
                ownerSignature: ownerSignature,
                logoPath: logoPath,
                ownerPhotoPath: ownerPhotoPath,
                paperSize: paperSize,
                footerNote: footerNote,
                adminPin: adminPin,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({Value<int> id, required String name});
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({Value<int> id, Value<String> name});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MenuItemsTable, List<MenuItem>>
  _menuItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.menuItems,
    aliasName: $_aliasNameGenerator(db.categories.id, db.menuItems.categoryId),
  );

  $$MenuItemsTableProcessedTableManager get menuItemsRefs {
    final manager = $$MenuItemsTableTableManager(
      $_db,
      $_db.menuItems,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_menuItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> menuItemsRefs(
    Expression<bool> Function($$MenuItemsTableFilterComposer f) f,
  ) {
    final $$MenuItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.menuItems,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MenuItemsTableFilterComposer(
            $db: $db,
            $table: $db.menuItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> menuItemsRefs<T extends Object>(
    Expression<T> Function($$MenuItemsTableAnnotationComposer a) f,
  ) {
    final $$MenuItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.menuItems,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MenuItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.menuItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool menuItemsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => CategoriesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  CategoriesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({menuItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (menuItemsRefs) db.menuItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (menuItemsRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      MenuItem
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._menuItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).menuItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool menuItemsRefs})
    >;
typedef $$MenuItemsTableCreateCompanionBuilder =
    MenuItemsCompanion Function({
      Value<int> id,
      required int categoryId,
      required String name,
      required double salePrice,
      Value<double?> costPrice,
      Value<bool> isAvailable,
    });
typedef $$MenuItemsTableUpdateCompanionBuilder =
    MenuItemsCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<String> name,
      Value<double> salePrice,
      Value<double?> costPrice,
      Value<bool> isAvailable,
    });

final class $$MenuItemsTableReferences
    extends BaseReferences<_$AppDatabase, $MenuItemsTable, MenuItem> {
  $$MenuItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.menuItems.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoiceItemsTable, List<InvoiceItem>>
  _invoiceItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoiceItems,
    aliasName: $_aliasNameGenerator(
      db.menuItems.id,
      db.invoiceItems.menuItemId,
    ),
  );

  $$InvoiceItemsTableProcessedTableManager get invoiceItemsRefs {
    final manager = $$InvoiceItemsTableTableManager(
      $_db,
      $_db.invoiceItems,
    ).filter((f) => f.menuItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MenuItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceItemsRefs(
    Expression<bool> Function($$InvoiceItemsTableFilterComposer f) f,
  ) {
    final $$InvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.menuItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MenuItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MenuItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceItemsRefs<T extends Object>(
    Expression<T> Function($$InvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$InvoiceItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.menuItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MenuItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MenuItemsTable,
          MenuItem,
          $$MenuItemsTableFilterComposer,
          $$MenuItemsTableOrderingComposer,
          $$MenuItemsTableAnnotationComposer,
          $$MenuItemsTableCreateCompanionBuilder,
          $$MenuItemsTableUpdateCompanionBuilder,
          (MenuItem, $$MenuItemsTableReferences),
          MenuItem,
          PrefetchHooks Function({bool categoryId, bool invoiceItemsRefs})
        > {
  $$MenuItemsTableTableManager(_$AppDatabase db, $MenuItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> salePrice = const Value.absent(),
                Value<double?> costPrice = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
              }) => MenuItemsCompanion(
                id: id,
                categoryId: categoryId,
                name: name,
                salePrice: salePrice,
                costPrice: costPrice,
                isAvailable: isAvailable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                required String name,
                required double salePrice,
                Value<double?> costPrice = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
              }) => MenuItemsCompanion.insert(
                id: id,
                categoryId: categoryId,
                name: name,
                salePrice: salePrice,
                costPrice: costPrice,
                isAvailable: isAvailable,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MenuItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryId = false, invoiceItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoiceItemsRefs) db.invoiceItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable: $$MenuItemsTableReferences
                                        ._categoryIdTable(db),
                                    referencedColumn: $$MenuItemsTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoiceItemsRefs)
                        await $_getPrefetchedData<
                          MenuItem,
                          $MenuItemsTable,
                          InvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$MenuItemsTableReferences
                              ._invoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MenuItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).invoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.menuItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MenuItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MenuItemsTable,
      MenuItem,
      $$MenuItemsTableFilterComposer,
      $$MenuItemsTableOrderingComposer,
      $$MenuItemsTableAnnotationComposer,
      $$MenuItemsTableCreateCompanionBuilder,
      $$MenuItemsTableUpdateCompanionBuilder,
      (MenuItem, $$MenuItemsTableReferences),
      MenuItem,
      PrefetchHooks Function({bool categoryId, bool invoiceItemsRefs})
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      required String invoiceNumber,
      required DateTime date,
      Value<String?> customerName,
      Value<String> orderType,
      Value<String> status,
      required double subtotal,
      Value<double> discount,
      required double grandTotal,
      required double receivedAmount,
      required double balanceAmount,
      Value<String?> pdfPath,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      Value<String> invoiceNumber,
      Value<DateTime> date,
      Value<String?> customerName,
      Value<String> orderType,
      Value<String> status,
      Value<double> subtotal,
      Value<double> discount,
      Value<double> grandTotal,
      Value<double> receivedAmount,
      Value<double> balanceAmount,
      Value<String?> pdfPath,
    });

final class $$InvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $InvoicesTable, Invoice> {
  $$InvoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoiceItemsTable, List<InvoiceItem>>
  _invoiceItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoiceItems,
    aliasName: $_aliasNameGenerator(db.invoices.id, db.invoiceItems.invoiceId),
  );

  $$InvoiceItemsTableProcessedTableManager get invoiceItemsRefs {
    final manager = $$InvoiceItemsTableTableManager(
      $_db,
      $_db.invoiceItems,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get receivedAmount => $composableBuilder(
    column: $table.receivedAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balanceAmount => $composableBuilder(
    column: $table.balanceAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pdfPath => $composableBuilder(
    column: $table.pdfPath,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> invoiceItemsRefs(
    Expression<bool> Function($$InvoiceItemsTableFilterComposer f) f,
  ) {
    final $$InvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get receivedAmount => $composableBuilder(
    column: $table.receivedAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balanceAmount => $composableBuilder(
    column: $table.balanceAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pdfPath => $composableBuilder(
    column: $table.pdfPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderType =>
      $composableBuilder(column: $table.orderType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get receivedAmount => $composableBuilder(
    column: $table.receivedAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get balanceAmount => $composableBuilder(
    column: $table.balanceAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pdfPath =>
      $composableBuilder(column: $table.pdfPath, builder: (column) => column);

  Expression<T> invoiceItemsRefs<T extends Object>(
    Expression<T> Function($$InvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$InvoiceItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, $$InvoicesTableReferences),
          Invoice,
          PrefetchHooks Function({bool invoiceItemsRefs})
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> invoiceNumber = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> customerName = const Value.absent(),
                Value<String> orderType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<double> receivedAmount = const Value.absent(),
                Value<double> balanceAmount = const Value.absent(),
                Value<String?> pdfPath = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                invoiceNumber: invoiceNumber,
                date: date,
                customerName: customerName,
                orderType: orderType,
                status: status,
                subtotal: subtotal,
                discount: discount,
                grandTotal: grandTotal,
                receivedAmount: receivedAmount,
                balanceAmount: balanceAmount,
                pdfPath: pdfPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String invoiceNumber,
                required DateTime date,
                Value<String?> customerName = const Value.absent(),
                Value<String> orderType = const Value.absent(),
                Value<String> status = const Value.absent(),
                required double subtotal,
                Value<double> discount = const Value.absent(),
                required double grandTotal,
                required double receivedAmount,
                required double balanceAmount,
                Value<String?> pdfPath = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                invoiceNumber: invoiceNumber,
                date: date,
                customerName: customerName,
                orderType: orderType,
                status: status,
                subtotal: subtotal,
                discount: discount,
                grandTotal: grandTotal,
                receivedAmount: receivedAmount,
                balanceAmount: balanceAmount,
                pdfPath: pdfPath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoiceItemsRefs) db.invoiceItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoiceItemsRefs)
                    await $_getPrefetchedData<
                      Invoice,
                      $InvoicesTable,
                      InvoiceItem
                    >(
                      currentTable: table,
                      referencedTable: $$InvoicesTableReferences
                          ._invoiceItemsRefsTable(db),
                      managerFromTypedResult: (p0) => $$InvoicesTableReferences(
                        db,
                        table,
                        p0,
                      ).invoiceItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.invoiceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, $$InvoicesTableReferences),
      Invoice,
      PrefetchHooks Function({bool invoiceItemsRefs})
    >;
typedef $$InvoiceItemsTableCreateCompanionBuilder =
    InvoiceItemsCompanion Function({
      Value<int> id,
      required int invoiceId,
      required int menuItemId,
      required String itemName,
      required int quantity,
      required double price,
    });
typedef $$InvoiceItemsTableUpdateCompanionBuilder =
    InvoiceItemsCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<int> menuItemId,
      Value<String> itemName,
      Value<int> quantity,
      Value<double> price,
    });

final class $$InvoiceItemsTableReferences
    extends BaseReferences<_$AppDatabase, $InvoiceItemsTable, InvoiceItem> {
  $$InvoiceItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias(
        $_aliasNameGenerator(db.invoiceItems.invoiceId, db.invoices.id),
      );

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MenuItemsTable _menuItemIdTable(_$AppDatabase db) =>
      db.menuItems.createAlias(
        $_aliasNameGenerator(db.invoiceItems.menuItemId, db.menuItems.id),
      );

  $$MenuItemsTableProcessedTableManager get menuItemId {
    final $_column = $_itemColumn<int>('menu_item_id')!;

    final manager = $$MenuItemsTableTableManager(
      $_db,
      $_db.menuItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_menuItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoiceItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MenuItemsTableFilterComposer get menuItemId {
    final $$MenuItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.menuItemId,
      referencedTable: $db.menuItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MenuItemsTableFilterComposer(
            $db: $db,
            $table: $db.menuItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MenuItemsTableOrderingComposer get menuItemId {
    final $$MenuItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.menuItemId,
      referencedTable: $db.menuItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MenuItemsTableOrderingComposer(
            $db: $db,
            $table: $db.menuItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MenuItemsTableAnnotationComposer get menuItemId {
    final $$MenuItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.menuItemId,
      referencedTable: $db.menuItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MenuItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.menuItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceItemsTable,
          InvoiceItem,
          $$InvoiceItemsTableFilterComposer,
          $$InvoiceItemsTableOrderingComposer,
          $$InvoiceItemsTableAnnotationComposer,
          $$InvoiceItemsTableCreateCompanionBuilder,
          $$InvoiceItemsTableUpdateCompanionBuilder,
          (InvoiceItem, $$InvoiceItemsTableReferences),
          InvoiceItem,
          PrefetchHooks Function({bool invoiceId, bool menuItemId})
        > {
  $$InvoiceItemsTableTableManager(_$AppDatabase db, $InvoiceItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int> menuItemId = const Value.absent(),
                Value<String> itemName = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> price = const Value.absent(),
              }) => InvoiceItemsCompanion(
                id: id,
                invoiceId: invoiceId,
                menuItemId: menuItemId,
                itemName: itemName,
                quantity: quantity,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                required int menuItemId,
                required String itemName,
                required int quantity,
                required double price,
              }) => InvoiceItemsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                menuItemId: menuItemId,
                itemName: itemName,
                quantity: quantity,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoiceItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceId = false, menuItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (invoiceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoiceId,
                                referencedTable: $$InvoiceItemsTableReferences
                                    ._invoiceIdTable(db),
                                referencedColumn: $$InvoiceItemsTableReferences
                                    ._invoiceIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (menuItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.menuItemId,
                                referencedTable: $$InvoiceItemsTableReferences
                                    ._menuItemIdTable(db),
                                referencedColumn: $$InvoiceItemsTableReferences
                                    ._menuItemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoiceItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceItemsTable,
      InvoiceItem,
      $$InvoiceItemsTableFilterComposer,
      $$InvoiceItemsTableOrderingComposer,
      $$InvoiceItemsTableAnnotationComposer,
      $$InvoiceItemsTableCreateCompanionBuilder,
      $$InvoiceItemsTableUpdateCompanionBuilder,
      (InvoiceItem, $$InvoiceItemsTableReferences),
      InvoiceItem,
      PrefetchHooks Function({bool invoiceId, bool menuItemId})
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      Value<int> id,
      required DateTime date,
      required String category,
      required double amount,
      Value<String?> notes,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String> category,
      Value<double> amount,
      Value<String?> notes,
    });

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                date: date,
                category: category,
                amount: amount,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String category,
                required double amount,
                Value<String?> notes = const Value.absent(),
              }) => ExpensesCompanion.insert(
                id: id,
                date: date,
                category: category,
                amount: amount,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$StaffTableCreateCompanionBuilder =
    StaffCompanion Function({
      Value<int> id,
      required String name,
      required String phone,
      required String role,
      required double salary,
    });
typedef $$StaffTableUpdateCompanionBuilder =
    StaffCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> phone,
      Value<String> role,
      Value<double> salary,
    });

final class $$StaffTableReferences
    extends BaseReferences<_$AppDatabase, $StaffTable, StaffData> {
  $$StaffTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AttendanceTable, List<AttendanceData>>
  _attendanceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attendance,
    aliasName: $_aliasNameGenerator(db.staff.id, db.attendance.staffId),
  );

  $$AttendanceTableProcessedTableManager get attendanceRefs {
    final manager = $$AttendanceTableTableManager(
      $_db,
      $_db.attendance,
    ).filter((f) => f.staffId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attendanceRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SalariesTable, List<Salary>> _salariesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.salaries,
    aliasName: $_aliasNameGenerator(db.staff.id, db.salaries.staffId),
  );

  $$SalariesTableProcessedTableManager get salariesRefs {
    final manager = $$SalariesTableTableManager(
      $_db,
      $_db.salaries,
    ).filter((f) => f.staffId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_salariesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StaffTableFilterComposer extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salary => $composableBuilder(
    column: $table.salary,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> attendanceRefs(
    Expression<bool> Function($$AttendanceTableFilterComposer f) f,
  ) {
    final $$AttendanceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendance,
      getReferencedColumn: (t) => t.staffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableFilterComposer(
            $db: $db,
            $table: $db.attendance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> salariesRefs(
    Expression<bool> Function($$SalariesTableFilterComposer f) f,
  ) {
    final $$SalariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salaries,
      getReferencedColumn: (t) => t.staffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalariesTableFilterComposer(
            $db: $db,
            $table: $db.salaries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StaffTableOrderingComposer
    extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salary => $composableBuilder(
    column: $table.salary,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StaffTableAnnotationComposer
    extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<double> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  Expression<T> attendanceRefs<T extends Object>(
    Expression<T> Function($$AttendanceTableAnnotationComposer a) f,
  ) {
    final $$AttendanceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendance,
      getReferencedColumn: (t) => t.staffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableAnnotationComposer(
            $db: $db,
            $table: $db.attendance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> salariesRefs<T extends Object>(
    Expression<T> Function($$SalariesTableAnnotationComposer a) f,
  ) {
    final $$SalariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salaries,
      getReferencedColumn: (t) => t.staffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalariesTableAnnotationComposer(
            $db: $db,
            $table: $db.salaries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StaffTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StaffTable,
          StaffData,
          $$StaffTableFilterComposer,
          $$StaffTableOrderingComposer,
          $$StaffTableAnnotationComposer,
          $$StaffTableCreateCompanionBuilder,
          $$StaffTableUpdateCompanionBuilder,
          (StaffData, $$StaffTableReferences),
          StaffData,
          PrefetchHooks Function({bool attendanceRefs, bool salariesRefs})
        > {
  $$StaffTableTableManager(_$AppDatabase db, $StaffTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<double> salary = const Value.absent(),
              }) => StaffCompanion(
                id: id,
                name: name,
                phone: phone,
                role: role,
                salary: salary,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String phone,
                required String role,
                required double salary,
              }) => StaffCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                role: role,
                salary: salary,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StaffTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({attendanceRefs = false, salariesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (attendanceRefs) db.attendance,
                    if (salariesRefs) db.salaries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendanceRefs)
                        await $_getPrefetchedData<
                          StaffData,
                          $StaffTable,
                          AttendanceData
                        >(
                          currentTable: table,
                          referencedTable: $$StaffTableReferences
                              ._attendanceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StaffTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.staffId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (salariesRefs)
                        await $_getPrefetchedData<
                          StaffData,
                          $StaffTable,
                          Salary
                        >(
                          currentTable: table,
                          referencedTable: $$StaffTableReferences
                              ._salariesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StaffTableReferences(
                                db,
                                table,
                                p0,
                              ).salariesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.staffId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StaffTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StaffTable,
      StaffData,
      $$StaffTableFilterComposer,
      $$StaffTableOrderingComposer,
      $$StaffTableAnnotationComposer,
      $$StaffTableCreateCompanionBuilder,
      $$StaffTableUpdateCompanionBuilder,
      (StaffData, $$StaffTableReferences),
      StaffData,
      PrefetchHooks Function({bool attendanceRefs, bool salariesRefs})
    >;
typedef $$AttendanceTableCreateCompanionBuilder =
    AttendanceCompanion Function({
      Value<int> id,
      required int staffId,
      required DateTime date,
      required String status,
    });
typedef $$AttendanceTableUpdateCompanionBuilder =
    AttendanceCompanion Function({
      Value<int> id,
      Value<int> staffId,
      Value<DateTime> date,
      Value<String> status,
    });

final class $$AttendanceTableReferences
    extends BaseReferences<_$AppDatabase, $AttendanceTable, AttendanceData> {
  $$AttendanceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StaffTable _staffIdTable(_$AppDatabase db) => db.staff.createAlias(
    $_aliasNameGenerator(db.attendance.staffId, db.staff.id),
  );

  $$StaffTableProcessedTableManager get staffId {
    final $_column = $_itemColumn<int>('staff_id')!;

    final manager = $$StaffTableTableManager(
      $_db,
      $_db.staff,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_staffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendanceTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceTable> {
  $$AttendanceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$StaffTableFilterComposer get staffId {
    final $$StaffTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableFilterComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceTable> {
  $$AttendanceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$StaffTableOrderingComposer get staffId {
    final $$StaffTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableOrderingComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceTable> {
  $$AttendanceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$StaffTableAnnotationComposer get staffId {
    final $$StaffTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableAnnotationComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendanceTable,
          AttendanceData,
          $$AttendanceTableFilterComposer,
          $$AttendanceTableOrderingComposer,
          $$AttendanceTableAnnotationComposer,
          $$AttendanceTableCreateCompanionBuilder,
          $$AttendanceTableUpdateCompanionBuilder,
          (AttendanceData, $$AttendanceTableReferences),
          AttendanceData,
          PrefetchHooks Function({bool staffId})
        > {
  $$AttendanceTableTableManager(_$AppDatabase db, $AttendanceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> staffId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => AttendanceCompanion(
                id: id,
                staffId: staffId,
                date: date,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int staffId,
                required DateTime date,
                required String status,
              }) => AttendanceCompanion.insert(
                id: id,
                staffId: staffId,
                date: date,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendanceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({staffId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (staffId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.staffId,
                                referencedTable: $$AttendanceTableReferences
                                    ._staffIdTable(db),
                                referencedColumn: $$AttendanceTableReferences
                                    ._staffIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendanceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendanceTable,
      AttendanceData,
      $$AttendanceTableFilterComposer,
      $$AttendanceTableOrderingComposer,
      $$AttendanceTableAnnotationComposer,
      $$AttendanceTableCreateCompanionBuilder,
      $$AttendanceTableUpdateCompanionBuilder,
      (AttendanceData, $$AttendanceTableReferences),
      AttendanceData,
      PrefetchHooks Function({bool staffId})
    >;
typedef $$SalariesTableCreateCompanionBuilder =
    SalariesCompanion Function({
      Value<int> id,
      required int staffId,
      required DateTime date,
      required double amount,
      Value<String> status,
    });
typedef $$SalariesTableUpdateCompanionBuilder =
    SalariesCompanion Function({
      Value<int> id,
      Value<int> staffId,
      Value<DateTime> date,
      Value<double> amount,
      Value<String> status,
    });

final class $$SalariesTableReferences
    extends BaseReferences<_$AppDatabase, $SalariesTable, Salary> {
  $$SalariesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StaffTable _staffIdTable(_$AppDatabase db) => db.staff.createAlias(
    $_aliasNameGenerator(db.salaries.staffId, db.staff.id),
  );

  $$StaffTableProcessedTableManager get staffId {
    final $_column = $_itemColumn<int>('staff_id')!;

    final manager = $$StaffTableTableManager(
      $_db,
      $_db.staff,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_staffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SalariesTableFilterComposer
    extends Composer<_$AppDatabase, $SalariesTable> {
  $$SalariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$StaffTableFilterComposer get staffId {
    final $$StaffTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableFilterComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalariesTableOrderingComposer
    extends Composer<_$AppDatabase, $SalariesTable> {
  $$SalariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$StaffTableOrderingComposer get staffId {
    final $$StaffTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableOrderingComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalariesTable> {
  $$SalariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$StaffTableAnnotationComposer get staffId {
    final $$StaffTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableAnnotationComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalariesTable,
          Salary,
          $$SalariesTableFilterComposer,
          $$SalariesTableOrderingComposer,
          $$SalariesTableAnnotationComposer,
          $$SalariesTableCreateCompanionBuilder,
          $$SalariesTableUpdateCompanionBuilder,
          (Salary, $$SalariesTableReferences),
          Salary,
          PrefetchHooks Function({bool staffId})
        > {
  $$SalariesTableTableManager(_$AppDatabase db, $SalariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> staffId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => SalariesCompanion(
                id: id,
                staffId: staffId,
                date: date,
                amount: amount,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int staffId,
                required DateTime date,
                required double amount,
                Value<String> status = const Value.absent(),
              }) => SalariesCompanion.insert(
                id: id,
                staffId: staffId,
                date: date,
                amount: amount,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SalariesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({staffId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (staffId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.staffId,
                                referencedTable: $$SalariesTableReferences
                                    ._staffIdTable(db),
                                referencedColumn: $$SalariesTableReferences
                                    ._staffIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SalariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalariesTable,
      Salary,
      $$SalariesTableFilterComposer,
      $$SalariesTableOrderingComposer,
      $$SalariesTableAnnotationComposer,
      $$SalariesTableCreateCompanionBuilder,
      $$SalariesTableUpdateCompanionBuilder,
      (Salary, $$SalariesTableReferences),
      Salary,
      PrefetchHooks Function({bool staffId})
    >;
typedef $$SuppliersTableCreateCompanionBuilder =
    SuppliersCompanion Function({
      Value<int> id,
      required String name,
      required String phone,
      Value<String?> address,
    });
typedef $$SuppliersTableUpdateCompanionBuilder =
    SuppliersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> phone,
      Value<String?> address,
    });

final class $$SuppliersTableReferences
    extends BaseReferences<_$AppDatabase, $SuppliersTable, Supplier> {
  $$SuppliersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SupplierItemsTable, List<SupplierItem>>
  _supplierItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.supplierItems,
    aliasName: $_aliasNameGenerator(
      db.suppliers.id,
      db.supplierItems.supplierId,
    ),
  );

  $$SupplierItemsTableProcessedTableManager get supplierItemsRefs {
    final manager = $$SupplierItemsTableTableManager(
      $_db,
      $_db.supplierItems,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_supplierItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> supplierItemsRefs(
    Expression<bool> Function($$SupplierItemsTableFilterComposer f) f,
  ) {
    final $$SupplierItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.supplierItems,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierItemsTableFilterComposer(
            $db: $db,
            $table: $db.supplierItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  Expression<T> supplierItemsRefs<T extends Object>(
    Expression<T> Function($$SupplierItemsTableAnnotationComposer a) f,
  ) {
    final $$SupplierItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.supplierItems,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.supplierItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SuppliersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SuppliersTable,
          Supplier,
          $$SuppliersTableFilterComposer,
          $$SuppliersTableOrderingComposer,
          $$SuppliersTableAnnotationComposer,
          $$SuppliersTableCreateCompanionBuilder,
          $$SuppliersTableUpdateCompanionBuilder,
          (Supplier, $$SuppliersTableReferences),
          Supplier,
          PrefetchHooks Function({bool supplierItemsRefs})
        > {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
              }) => SuppliersCompanion(
                id: id,
                name: name,
                phone: phone,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String phone,
                Value<String?> address = const Value.absent(),
              }) => SuppliersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SuppliersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (supplierItemsRefs) db.supplierItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (supplierItemsRefs)
                    await $_getPrefetchedData<
                      Supplier,
                      $SuppliersTable,
                      SupplierItem
                    >(
                      currentTable: table,
                      referencedTable: $$SuppliersTableReferences
                          ._supplierItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SuppliersTableReferences(
                            db,
                            table,
                            p0,
                          ).supplierItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.supplierId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SuppliersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SuppliersTable,
      Supplier,
      $$SuppliersTableFilterComposer,
      $$SuppliersTableOrderingComposer,
      $$SuppliersTableAnnotationComposer,
      $$SuppliersTableCreateCompanionBuilder,
      $$SuppliersTableUpdateCompanionBuilder,
      (Supplier, $$SuppliersTableReferences),
      Supplier,
      PrefetchHooks Function({bool supplierItemsRefs})
    >;
typedef $$SupplierItemsTableCreateCompanionBuilder =
    SupplierItemsCompanion Function({
      Value<int> id,
      required int supplierId,
      required String itemName,
      required double purchasePrice,
      required String unit,
    });
typedef $$SupplierItemsTableUpdateCompanionBuilder =
    SupplierItemsCompanion Function({
      Value<int> id,
      Value<int> supplierId,
      Value<String> itemName,
      Value<double> purchasePrice,
      Value<String> unit,
    });

final class $$SupplierItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SupplierItemsTable, SupplierItem> {
  $$SupplierItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SuppliersTable _supplierIdTable(_$AppDatabase db) =>
      db.suppliers.createAlias(
        $_aliasNameGenerator(db.supplierItems.supplierId, db.suppliers.id),
      );

  $$SuppliersTableProcessedTableManager get supplierId {
    final $_column = $_itemColumn<int>('supplier_id')!;

    final manager = $$SuppliersTableTableManager(
      $_db,
      $_db.suppliers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplierItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierItemsTable> {
  $$SupplierItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  $$SuppliersTableFilterComposer get supplierId {
    final $$SuppliersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableFilterComposer(
            $db: $db,
            $table: $db.suppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierItemsTable> {
  $$SupplierItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  $$SuppliersTableOrderingComposer get supplierId {
    final $$SuppliersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableOrderingComposer(
            $db: $db,
            $table: $db.suppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierItemsTable> {
  $$SupplierItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  $$SuppliersTableAnnotationComposer get supplierId {
    final $$SuppliersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableAnnotationComposer(
            $db: $db,
            $table: $db.suppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplierItemsTable,
          SupplierItem,
          $$SupplierItemsTableFilterComposer,
          $$SupplierItemsTableOrderingComposer,
          $$SupplierItemsTableAnnotationComposer,
          $$SupplierItemsTableCreateCompanionBuilder,
          $$SupplierItemsTableUpdateCompanionBuilder,
          (SupplierItem, $$SupplierItemsTableReferences),
          SupplierItem,
          PrefetchHooks Function({bool supplierId})
        > {
  $$SupplierItemsTableTableManager(_$AppDatabase db, $SupplierItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supplierId = const Value.absent(),
                Value<String> itemName = const Value.absent(),
                Value<double> purchasePrice = const Value.absent(),
                Value<String> unit = const Value.absent(),
              }) => SupplierItemsCompanion(
                id: id,
                supplierId: supplierId,
                itemName: itemName,
                purchasePrice: purchasePrice,
                unit: unit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supplierId,
                required String itemName,
                required double purchasePrice,
                required String unit,
              }) => SupplierItemsCompanion.insert(
                id: id,
                supplierId: supplierId,
                itemName: itemName,
                purchasePrice: purchasePrice,
                unit: unit,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable: $$SupplierItemsTableReferences
                                    ._supplierIdTable(db),
                                referencedColumn: $$SupplierItemsTableReferences
                                    ._supplierIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SupplierItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplierItemsTable,
      SupplierItem,
      $$SupplierItemsTableFilterComposer,
      $$SupplierItemsTableOrderingComposer,
      $$SupplierItemsTableAnnotationComposer,
      $$SupplierItemsTableCreateCompanionBuilder,
      $$SupplierItemsTableUpdateCompanionBuilder,
      (SupplierItem, $$SupplierItemsTableReferences),
      SupplierItem,
      PrefetchHooks Function({bool supplierId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$MenuItemsTableTableManager get menuItems =>
      $$MenuItemsTableTableManager(_db, _db.menuItems);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceItemsTableTableManager get invoiceItems =>
      $$InvoiceItemsTableTableManager(_db, _db.invoiceItems);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$StaffTableTableManager get staff =>
      $$StaffTableTableManager(_db, _db.staff);
  $$AttendanceTableTableManager get attendance =>
      $$AttendanceTableTableManager(_db, _db.attendance);
  $$SalariesTableTableManager get salaries =>
      $$SalariesTableTableManager(_db, _db.salaries);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$SupplierItemsTableTableManager get supplierItems =>
      $$SupplierItemsTableTableManager(_db, _db.supplierItems);
}
