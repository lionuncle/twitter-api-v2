// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/tweet_from.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = TweetFrom('me');

      expect(actual.toString(), 'from:me');
    });

    test('when negated', () {
      final actual = TweetFrom.negated('me');

      expect(actual.toString(), '-from:me');
    });

    test('when value is empty', () {
      final actual = TweetFrom('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message == 'The username must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
