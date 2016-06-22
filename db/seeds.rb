require 'random_data'

# Create Ads
3.times do
# #1
  Advertisement.create!(
# #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price: RandomData.random_number
  )
end
advertisements = Advertisement.all

# Create Posts
50.times do
# #1
  Post.create!(
# #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
# #4
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Advertisement.count} ads created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
