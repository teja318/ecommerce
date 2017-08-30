require 'faker'

10.times do 
	category = Category.new({"name" => Faker::Commerce.department(1)})
 category.save
end	

50.times do
	product = Product.new({"name" => Faker::Commerce.product_name, "price" => Faker::Commerce.price(50..10000), "description" => Faker::Lorem.sentence, "category_id" => Category.all.sample.id, "available" => Faker::Boolean.boolean})
product.save


end	

