String newInventoryMutation = """
  mutation AddNewInventory(\$name:String, \$perUnit:Float, \$price:Float, \$unit:String, \$category:String, \$inStock:Float, \$imageString:String){
  addNewInventory(name:\$name, perUnit:\$perUnit, price:\$price, unit:\$unit, category:\$category, inStock:\$inStock, imageString: \$imageString)
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
