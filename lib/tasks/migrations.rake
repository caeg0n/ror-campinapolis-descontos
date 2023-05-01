require 'fileutils'
desc "criando banco"
task :migrations do
  sh('rails db:environment:set RAILS_ENV=development')
  project_path = Rails.root.to_s
  sh('rails db:create')
  sh('rails db:drop')
  sh('rails db:create')
  
  FileUtils.cp("#{project_path}/app/models/client.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/client.rb")
  FileUtils.cp("#{project_path}/app/models/organization_category.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/organization_category.rb")
  FileUtils.cp("#{project_path}/app/models/organization.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/organization.rb")
  FileUtils.cp("#{project_path}/app/models/product.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/product.rb")
  FileUtils.cp("#{project_path}/app/models/product_category.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/product_category.rb")
  FileUtils.cp("#{project_path}/app/models/coupon.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/coupon.rb")
  FileUtils.cp("#{project_path}/app/models/coupon_product.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/coupon_product.rb")
  FileUtils.cp("#{project_path}/app/models/coupon_sale.rb", "#{project_path}/app/models/backup") if File.exist?("#{project_path}/app/models/coupon_sale.rb")
  
  sh('rails d scaffold client')
  sh('rails d scaffold organization_category')
  sh('rails d scaffold organization')
  sh('rails d scaffold product_category')
  sh('rails d scaffold product')
  sh('rails d scaffold coupon')
  sh('rails d scaffold coupon_product')
  sh('rails d scaffold coupon_sale')

  sh('rails g scaffold client device_id:string')
  sh('rails g scaffold organization_category name:string')
  sh('rails g scaffold organization name:string fee:decimal category:references')
  sh('rails g scaffold product_category name:string')
  sh('rails g scaffold product organization:references product_category:references price:decimal name:string')
  #sh('rails g scaffold coupon product:references coupon_type:integer value:decimal expiration:datetime status:integer')
  sh('rails g scaffold coupon_product product:references coupon_type:integer value:decimal expiration:datetime status:integer')
  sh('rails g scaffold coupon_sale coupon_type:integer value:decimal expiration:datetime status:integer')

  FileUtils.cp("#{project_path}/app/models/backup/client.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/client.rb")
  FileUtils.cp("#{project_path}/app/models/backup/organization_category.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/organization_category.rb")
  FileUtils.cp("#{project_path}/app/models/backup/organization.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/organization.rb")
  FileUtils.cp("#{project_path}/app/models/backup/product_category.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/product_categpry.rb")
  FileUtils.cp("#{project_path}/app/models/backup/product.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/product.rb")
  #FileUtils.cp("#{project_path}/app/models/backup/coupon.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/coupon.rb")
  FileUtils.cp("#{project_path}/app/models/backup/coupon_product.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/coupon_product.rb")
  FileUtils.cp("#{project_path}/app/models/backup/coupon_sale.rb","#{project_path}/app/models") if File.exist?("#{project_path}/app/models/backup/coupon_sale.rb")
  

  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/organization_category.rb")
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/organization.rb")
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/product_category.rb")
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/product.rb")    
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/coupon.rb")
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/coupon_product.rb")
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/coupon_sale.rb")
  FileUtils.rm Dir.glob("#{project_path}/app/models/backup/client.rb")          
  #sh('rails g migration remove_id_from_classroomteachercourse_form_teacher id:integer')
  sh('rails db:migrate')
  #sh('rails db:seed')
end
