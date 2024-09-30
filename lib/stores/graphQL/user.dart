String getUserGraphQL = '''query getUser(\$userID: String!) {
      getUser(userID:\$userID) {
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
