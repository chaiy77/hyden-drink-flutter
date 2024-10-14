String createCustomerGraphQL =
    '''mutation createCustomer(\$input: customerInfoInput) {
      createCustomer (input:\$input) {
        id
        name
        address
        province
        zipcode
        contactPerson
        telephone
        remark
      }
    }''';
String getCustomerListGraphQL =
    '''query getCustomerList(\$workplaceId : String!){
  getCustomerList(workplaceId:\$workplaceId){
    id
    name
    province
  }
}
''';

String getCustomerInfoGraphQL =
    '''query getCustomerInfo(\$workplaceId: String!, \$id: String!){
  getCustomerInfo(workplaceId:\$workplaceId, id:\$id){
    id
    name
    address
    province
    zipcode
    contactPerson
    telephone
    remark
  }
}
''';
