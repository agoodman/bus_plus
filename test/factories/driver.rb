Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :driver do |driver|
  driver.first_name  { "first" }
  driver.last_name { "last" }
  driver.license_number { "abc123" }
  driver.email { Factory.next :email }
end
