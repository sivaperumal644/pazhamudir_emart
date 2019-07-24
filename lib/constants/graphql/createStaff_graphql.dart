String createStaffMutation = '''
mutation CreateStaff(\$name:String, \$phoneNumber:String, \$token:String, \$accountType:String){
  createStaff(name:\$name, phoneNumber:\$phoneNumber, token:\$token, accountType: \$accountType){
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