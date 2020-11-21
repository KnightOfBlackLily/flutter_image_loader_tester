import 'dart:convert';

import 'package:flutter/foundation.dart';

class WallhavenImage {
  final String id;
  final String url;
  final String short_url;
  final int views;
  final int favorites;
  final String source;
  final String purity;
  final String category;
  final int dimension_x;
  final int dimension_y;
  final String resolution;
  final String ratio;
  final int file_size;
  final String file_type;
  final String created_at;
  final List<String> colors;
  final String path;
  final Thumbs thumbs;
  WallhavenImage({
    this.id,
    this.url,
    this.short_url,
    this.views,
    this.favorites,
    this.source,
    this.purity,
    this.category,
    this.dimension_x,
    this.dimension_y,
    this.resolution,
    this.ratio,
    this.file_size,
    this.file_type,
    this.created_at,
    this.colors,
    this.path,
    this.thumbs,
  });

  WallhavenImage copyWith({
    String id,
    String url,
    String short_url,
    int views,
    int favorites,
    String source,
    String purity,
    String category,
    int dimension_x,
    int dimension_y,
    String resolution,
    String ratio,
    int file_size,
    String file_type,
    String created_at,
    List<String> colors,
    String path,
    Thumbs thumbs,
  }) {
    return WallhavenImage(
      id: id ?? this.id,
      url: url ?? this.url,
      short_url: short_url ?? this.short_url,
      views: views ?? this.views,
      favorites: favorites ?? this.favorites,
      source: source ?? this.source,
      purity: purity ?? this.purity,
      category: category ?? this.category,
      dimension_x: dimension_x ?? this.dimension_x,
      dimension_y: dimension_y ?? this.dimension_y,
      resolution: resolution ?? this.resolution,
      ratio: ratio ?? this.ratio,
      file_size: file_size ?? this.file_size,
      file_type: file_type ?? this.file_type,
      created_at: created_at ?? this.created_at,
      colors: colors ?? this.colors,
      path: path ?? this.path,
      thumbs: thumbs ?? this.thumbs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'short_url': short_url,
      'views': views,
      'favorites': favorites,
      'source': source,
      'purity': purity,
      'category': category,
      'dimension_x': dimension_x,
      'dimension_y': dimension_y,
      'resolution': resolution,
      'ratio': ratio,
      'file_size': file_size,
      'file_type': file_type,
      'created_at': created_at,
      'colors': colors,
      'path': path,
      'thumbs': thumbs?.toMap(),
    };
  }

  factory WallhavenImage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WallhavenImage(
      id: map['id'],
      url: map['url'],
      short_url: map['short_url'],
      views: map['views']?.toInt(),
      favorites: map['favorites']?.toInt(),
      source: map['source'],
      purity: map['purity'],
      category: map['category'],
      dimension_x: map['dimension_x']?.toInt(),
      dimension_y: map['dimension_y']?.toInt(),
      resolution: map['resolution'],
      ratio: map['ratio'],
      file_size: map['file_size']?.toInt(),
      file_type: map['file_type'],
      created_at: map['created_at'],
      colors: List<String>.from(map['colors']),
      path: map['path'],
      thumbs: Thumbs.fromMap(map['thumbs']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WallhavenImage.fromJson(String source) =>
      WallhavenImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WallhavenImage(id: $id, url: $url, short_url: $short_url, views: $views, favorites: $favorites, source: $source, purity: $purity, category: $category, dimension_x: $dimension_x, dimension_y: $dimension_y, resolution: $resolution, ratio: $ratio, file_size: $file_size, file_type: $file_type, created_at: $created_at, colors: $colors, path: $path, thumbs: $thumbs)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WallhavenImage &&
        o.id == id &&
        o.url == url &&
        o.short_url == short_url &&
        o.views == views &&
        o.favorites == favorites &&
        o.source == source &&
        o.purity == purity &&
        o.category == category &&
        o.dimension_x == dimension_x &&
        o.dimension_y == dimension_y &&
        o.resolution == resolution &&
        o.ratio == ratio &&
        o.file_size == file_size &&
        o.file_type == file_type &&
        o.created_at == created_at &&
        listEquals(o.colors, colors) &&
        o.path == path &&
        o.thumbs == thumbs;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        url.hashCode ^
        short_url.hashCode ^
        views.hashCode ^
        favorites.hashCode ^
        source.hashCode ^
        purity.hashCode ^
        category.hashCode ^
        dimension_x.hashCode ^
        dimension_y.hashCode ^
        resolution.hashCode ^
        ratio.hashCode ^
        file_size.hashCode ^
        file_type.hashCode ^
        created_at.hashCode ^
        colors.hashCode ^
        path.hashCode ^
        thumbs.hashCode;
  }
}

class Thumbs {
  final String large;
  final String original;
  final String small;
  Thumbs({
    this.large,
    this.original,
    this.small,
  });

  Thumbs copyWith({
    String large,
    String original,
    String small,
  }) {
    return Thumbs(
      large: large ?? this.large,
      original: original ?? this.original,
      small: small ?? this.small,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'original': original,
      'small': small,
    };
  }

  factory Thumbs.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Thumbs(
      large: map['large'],
      original: map['original'],
      small: map['small'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbs.fromJson(String source) => Thumbs.fromMap(json.decode(source));

  @override
  String toString() =>
      'Thumbs(large: $large, original: $original, small: $small)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Thumbs &&
        o.large == large &&
        o.original == original &&
        o.small == small;
  }

  @override
  int get hashCode => large.hashCode ^ original.hashCode ^ small.hashCode;
}
