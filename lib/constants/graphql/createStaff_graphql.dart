String createStaffMutation = '''
mutation CreateStaff(\$name:String, \$phoneNumber:String, \$token:String){
  createStaff(name:\$name, phoneNumber:\$phoneNumber, token:\$token){
  		user{
        id,
        name,
        phoneNumber,
        address,
        token,
        isActive,
        status,
        accountType,
      }
  		error{
        path,
        message
      }
  		jwtToken
	}
}''';