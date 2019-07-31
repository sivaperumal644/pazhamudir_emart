String getAllOrderQuery = '''
query GetAllOrders{
  getAllOrders{
    orders{
      id,
      orderNo,
      address,
      cartItems,
      staff {
        id
        name
        phoneNumber
        address
        token
        isActive
        status
        accountType
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
