String updateInventoryMutation = '''
mutation UpdateInventory(\$inventoryId:String, \$name:String, \$perUnit:Float, \$price:Float, \$unit:String, \$category:String, \$inStock:Float, \$imageString:String){
  updateInventory(inventoryId:\$inventoryId, name:\$name, perUnit:\$perUnit, price:\$price, unit:\$unit, category:\$category, inStock:\$inStock, imageString:\$imageString){
    error{
      path
      message
    }
  }
}
''';