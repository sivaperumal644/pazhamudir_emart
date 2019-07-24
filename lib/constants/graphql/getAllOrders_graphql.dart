String getAllOrderQuery = '''
query GetAllOrders{
  getAllOrders{
    orders{
      id,
      orderNo,
      address,
      cartItems,
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