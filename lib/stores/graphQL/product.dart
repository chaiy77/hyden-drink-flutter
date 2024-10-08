String createProductGraphQL =
    '''mutation createNewProduct(\$input: productInfoInput) {
      createNewProduct (input:\$input) {
        id
        name
        type
        unit
        price
        remark
      }
    }''';

String getAllProductListGraphQL =
    '''query getProductList(\$workplaceId : String!){
  getProductList(workplaceId:\$workplaceId){
    id
    name
    type
    price
    unit
  }
}
''';

String getProductInfoGraphQL =
    '''query getProductInfo(\$workplaceId: String!, \$id: String!){
  getProductInfo(workplaceId:\$workplaceId, \$id:id){
    id
    name
    type
    price
    unit
  }
}
''';
