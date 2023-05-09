puts "Creating Admin User"
User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: :admin
)
puts "Admin User Created Successfully (Email: admin@example.com | Password: password)"