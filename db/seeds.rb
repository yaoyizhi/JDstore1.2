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
    { title: '赣南脐橙', description: '朋友产地直销的，吃过真心不错，不打保鲜剂的推荐给大家 16楼2单元团圆爸爸推荐，家里还有两箱，欢迎晚上过来品尝。' },
    { title: '凤凰岭樱桃', description: '5月28号去采摘过，个大甜，有两个品种，老板给每斤25元算合适，11号楼3单元甜甜妈推荐' },
    { title: '手工钩针课', description: '教材如图所示，每周一次课，具体时间根据学员时间调整,7号楼邮政局楼上，联系6号楼3单元米兰妈妈' },
    { title: '小学生放学托管', description: '收4个小学生，下午3-6点，督促作业，包晚饭和水果，8号楼1单元嘟嘟家' },
    { title: '手工包子，饺子', description: '可自己准备食材，到家做，也可我们做好了，送过去，16号楼1单元美美家' }
]

products_info.each do |info|
    Product.create!(
        title: info[:title],
        description: info[:description],
        quantity: rand(5..6),
        price: rand(5..6) * 10

    )
end

infos_info = [
    { title: '找阿姨做晚饭', description: '找阿姨做晚饭，下午2:30-4:00，50块一顿' },
    { title: '儿童画本借阅互换阅读', description: '神奇校车，小熊维尼，小兔彼得' },
    { title: '业委会选举信息', description: '有你支持的吗？' },
    { title: '本周末奥森公园游', description: '有一起的吗？' }
]

infos_info.each do |info|
    Info.create!(
        title: info[:title],
        description: info[:description]
    )
end
