# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = '1@1.com'
u.password = '123456'
u.password_confirmation = '123456'
u.is_admin = true
u.save
products_info = [
    { title: '赣南脐橙', description: '朋友产地直销的，吃过真心不错，不打保鲜剂的推荐给大家 16楼2单元团圆爸爸推荐，家里还有两箱，欢迎晚上过来品尝。', image: 'https://ws3.sinaimg.cn/large/006tNc79gy1fgbcdhps28j307n053747.jpg' },
    { title: '凤凰岭樱桃', description: '5月28号去采摘过，个大甜，有两个品种，老板给每斤25元算合适，11号楼3单元甜甜妈推荐', image: 'https://ws2.sinaimg.cn/large/006tNc79gy1fgbcmaa302j307p0523yl.jpg' }

]

products_info.each do |info|
    Product.create!(
        title: info[:title],
        description: info[:description],
        quantity: rand(5..6),
        price: rand(5..6) * 10,
        image: open(info[:image])
    )
end
