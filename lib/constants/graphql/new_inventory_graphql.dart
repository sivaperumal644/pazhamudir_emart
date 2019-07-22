String newInventoryMutation = """
  mutation AddNewInventory(\$name:String, \$perUnit:Float, \$price:Float, \$unit:String, \$category:String, \$inStock:Float){
  addNewInventory(name:\$name, perUnit:\$perUnit, price:\$price, unit:\$unit, category:\$category, inStock:\$inStock)
  {
    inventory
    {
      id,
      name,
      price,
      perUnit,
      unit,
      category,
      inStock,
    }
  error{
    path,
    message
  }
  }
}
""";