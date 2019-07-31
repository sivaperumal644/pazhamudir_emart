String signInMutation = """
mutation StaffLogin(\$token:String){
  staffLogin(token:\$token){
    user{
      id
      name
      phoneNumber
      token
      isActive
      status
      accountType 
    }
    error{
      path
      message
    }
    jwtToken
  }
}""";
