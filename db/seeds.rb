require "faker"

Post.destroy_all
User.destroy_all

10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email)
end

User.all.each do |user|
  rand(5..10).times do
    post = Post.new(
      name: Faker::Commerce.product_name,
      url: Faker::Internet.url,
      votes: (0..1000).to_a.sample
    )
    post.user = user
    post.save!
  end
end