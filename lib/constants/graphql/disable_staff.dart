String disableStaffMutation = '''
mutation DisableAccount(\$staffId:String){
  disableAccount(staffId:\$staffId){
    user{
      id
    }
    error{
      path
      message
    }
  }
}
''';