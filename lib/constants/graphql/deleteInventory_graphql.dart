String deleteInventoryMutation = '''
mutation DeleteInventory(\$inventoryId:String){
  deleteInventory(inventoryId:\$inventoryId){
    error{
      path
      message
    }
    inventory{
      id,
      name,
      price,
      perUnit,
      unit,
      category,
      inStock,
    }
  }
}
''';