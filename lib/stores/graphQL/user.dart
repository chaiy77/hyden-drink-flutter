String getUserGraphQL = '''query getUser(\$userId: String!) {
      getUser(userId:\$userId) {
        id
        email
        mobile
        type
        status
        registerDate
        workplaceId
        workplaceName
        error
      }
    }''';
