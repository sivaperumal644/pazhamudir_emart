String getAllOrderQuery = '''
query GetAllOrders{
  getAllOrders{
    orders{
      id,
      orderNo,
      address,
      cartItems{
        id,
        name,
        category,
        price,
        quantity,
        perUnitPrice
      }
      status,
      datePlaced,
      updatedDate,
    }
    error{
      message
    }
  }
}
''';