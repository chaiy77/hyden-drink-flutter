String createProductGraphQL =
    '''mutation createNewProduct(\$input: productInfoInput) {
      createNewProduct (input:\$input) {
        id
        sku
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
    sku
    name
    type
    price
    unit
  }
}
''';

String getProductInfoGraphQL =
    '''query getProductInfo(\$workplaceId: String!, \$id: String!){
  getProductInfo(workplaceId:\$workplaceId, id:\$id){
    id
    sku
    name
    type
    price
    unit
  }
}
''';
