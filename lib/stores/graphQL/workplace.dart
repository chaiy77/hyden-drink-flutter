String getWorkplaceByUserIdGraphQL =
    '''query getWorkplaceByUserId(\$userId: String!) {
      getWorkplaceByUserId(userId:\$userId) {
        id
        name
        address
        zipcode
        telephone
        lastAutoSku
        error
      }
    }''';

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

String updateWorkplaceGraphQL =
    '''mutation updateWorkplace(\$input: saveWorkplaceInput) {
    updateWorkplace(input:\$input){
        id
        name
        address
        zipcode
        error
      }
    }''';
