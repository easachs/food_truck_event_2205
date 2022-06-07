require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do

  describe "#Iteration 1" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    it "exists" do
      expect(food_truck).to be_a(FoodTruck)
    end

    it "has a name" do
      expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it "begins with empty inventory" do
      expect(food_truck.inventory).to eq({})
    end

    it "can check stock" do
      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it "can stock an item" do
      food_truck.stock(item1, 30)
      expect(food_truck.inventory).to include(item1)
      expect(food_truck.inventory[item1]).to eq(30)
      expect(food_truck.check_stock(item1)).to eq(30)
      food_truck.stock(item1, 25)
      expect(food_truck.check_stock(item1)).to eq(55)
      food_truck.stock(item2, 12)
      expect(food_truck.inventory).to include(item2)
      expect(food_truck.check_stock(item2)).to eq(12)
    end
  end

  describe "#Iteration 2" do

    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)

    it "has potential revenue" do
      expect(food_truck1.potential_revenue).to eq(148.75)
      expect(food_truck2.potential_revenue).to eq(345.00)
      expect(food_truck3.potential_revenue).to eq(243.75)
    end
  end

end
