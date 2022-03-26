// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Article extends DataClass implements Insertable<Article> {
  final String title;
  final String? author;
  final String description;
  final String urlImage;
  Article(
      {required this.title,
      this.author,
      required this.description,
      required this.urlImage});
  factory Article.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Article(
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      urlImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url_image'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String?>(author);
    }
    map['description'] = Variable<String>(description);
    map['url_image'] = Variable<String>(urlImage);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      title: Value(title),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      description: Value(description),
      urlImage: Value(urlImage),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String?>(json['author']),
      description: serializer.fromJson<String>(json['description']),
      urlImage: serializer.fromJson<String>(json['urlImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String?>(author),
      'description': serializer.toJson<String>(description),
      'urlImage': serializer.toJson<String>(urlImage),
    };
  }

  Article copyWith(
          {String? title,
          String? author,
          String? description,
          String? urlImage}) =>
      Article(
        title: title ?? this.title,
        author: author ?? this.author,
        description: description ?? this.description,
        urlImage: urlImage ?? this.urlImage,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('urlImage: $urlImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, author, description, urlImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.title == this.title &&
          other.author == this.author &&
          other.description == this.description &&
          other.urlImage == this.urlImage);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<String> title;
  final Value<String?> author;
  final Value<String> description;
  final Value<String> urlImage;
  const ArticlesCompanion({
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.urlImage = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required String title,
    this.author = const Value.absent(),
    required String description,
    required String urlImage,
  })  : title = Value(title),
        description = Value(description),
        urlImage = Value(urlImage);
  static Insertable<Article> custom({
    Expression<String>? title,
    Expression<String?>? author,
    Expression<String>? description,
    Expression<String>? urlImage,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (description != null) 'description': description,
      if (urlImage != null) 'url_image': urlImage,
    });
  }

  ArticlesCompanion copyWith(
      {Value<String>? title,
      Value<String?>? author,
      Value<String>? description,
      Value<String>? urlImage}) {
    return ArticlesCompanion(
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      urlImage: urlImage ?? this.urlImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String?>(author.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('urlImage: $urlImage')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 350),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _urlImageMeta = const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String?> urlImage = GeneratedColumn<String?>(
      'url_image', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 350),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [title, author, description, urlImage];
  @override
  String get aliasedName => _alias ?? 'articles';
  @override
  String get actualTableName => 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    } else if (isInserting) {
      context.missing(_urlImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {title};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Article.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ArticlesTable articles = $ArticlesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articles];
}
