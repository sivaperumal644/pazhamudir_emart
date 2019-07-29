String updateInventoryMutation = '''
mutation UpdateInventory(\$inventoryId:String, \$name:String, \$perUnit:Float, \$price:Float, \$unit:String, \$category:String, \$inStock:Float){
  updateInventory(inventoryId:\$inventoryId, name:\$name, perUnit:\$perUnit, price:\$price, unit:\$unit, category:\$category, inStock:\$inStock){
    error{
      path
      message
    }
  }
}
''';