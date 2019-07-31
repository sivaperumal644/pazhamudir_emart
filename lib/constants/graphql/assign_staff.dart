String assignStaffOrderMutation = '''
mutation AssignStaffOrder(\$staffId:String, \$orderId:String){
  assignStaffOrder(staffId:\$staffId, orderId:\$orderId){
    error{
      path
      message
    }
  }
}
''';