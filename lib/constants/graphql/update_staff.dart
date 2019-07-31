String updateStaffMutation = '''
mutation UpdateStaffAccount(\$name:String, \$phoneNumber:String, \$token:String, \$accountType:String, \$isActive:Boolean, \$status:String, \$staffId:String){
  updateStaffAccount(name:\$name, phoneNumber:\$phoneNumber, token:\$token, accountType:\$accountType, isActive:\$isActive, status:\$status, staffId:\$staffId){
    user{
      id,
      name,
      phoneNumber,
      address,
      token,
      isActive,
      status,
      accountType
    }
    error{
      path,
      message
    }
    jwtToken
  }
}
''';