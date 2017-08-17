# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1..5.times do |i|
  User.create(email: "ssr#{i}@ssr.com",
              nickname: "ssr#{i}",
              phone: "010#{i}#{i}#{i}#{i}#{i}#{i}#{i}#{i}",
              password: "123123",
              password_confirmation: "123123")
end

message_text = [
    [ "약속 지키고 살아 ㅡㅡ"  ],
    [ "당신은 약속을 어겼어여..."  ],
    [ "뭔가 잊은 약속 없나?ㅎㅎ"  ],
    [ "우리 친했잖아... 약속은 버린거니...?"],
    [ "니가 사람이냐...? 약속도 안지키고"],
    [ "그거 알아...? 너 오늘 약속 있었어..."],
    [ "약속 없어? 있는거 같은데? 진짜로 ㅎㅎ"],
    [ "약(약소한 약속이라도)속(상합니다)"],
    [ "약(약속은 까먹었니?)속(상하다)"],
    [ "약속을 까먹은 당신에 대한 신뢰도 18%"],

]

message_text.each do |country|
  Text.create( :text => country[0] )
end


