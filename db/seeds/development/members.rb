names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
0.upto(9) do |idx|
  a = rand(9).to_s
  b = rand(9).to_s
  c = rand(9).to_s
  d = rand(9).to_s
  Member.create(
    name: names[idx],
    password: "pizzadaisuki",
    password_confirmation: "pizzadaisuki",
    adress: "神奈川県川崎市",
    phone: "080-#{b + c + d +a}-#{a + b + c +d}",
    email: "#{names[idx]}@example.com",
    point: 500,
    fullname: "#{fnames[idx % 4]} #{gnames[idx % 3]}"
  )
end
