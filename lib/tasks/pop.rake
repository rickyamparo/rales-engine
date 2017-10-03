namespace :pop do

  desc "populate merchants table from CSV to postgresql table"
  task :merchants => :environment do
    puts "You are running rake task in #{Rails.env} environment"
    Merchant.copy_from "db/data/merchants.csv",
    :map => {
      'id' => 'id',
      'name' => 'name',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'}
  end

  desc "populate customers table from CSV to postgresql table"
  task :customers => :environment do
  puts "You are running rake task in #{Rails.env} environment"
    Customer.copy_from "db/data/customers.csv",
    :map => {
      'id' => 'id',
      'first_name' => 'first_name',
      'last_name' => 'last_name',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'}
  end

  desc "populate items table from CSV to postgresql table"
  task :items => :environment do
  puts "You are running rake task in #{Rails.env} environment"
    Customer.copy_from "db/data/items.csv",
    :map => {
      'id' => 'id',
      'name' => 'name',
      'description' => 'description',
      'unit_price' => 'unit_price',
      'merchant_id' => 'merchant_id',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'}
  end

  desc "populate all tables"
  task :all => [:merchants, :customers]
end
