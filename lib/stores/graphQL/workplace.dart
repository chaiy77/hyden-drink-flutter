String saveWorkplaceGraphQL =
    '''mutation saveWorkplace(\$input: saveWorkplaceInput) {
    saveWorkplace(input:\$input){
        id
        name
        address
        zipcode
        error
      }
    }''';
