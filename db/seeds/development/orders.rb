prices = [1200, 3000, 2800, 6080, 800, 2000]
0.upto(5) do |idx|
  a = rand(5).to_s
  order = Order.create(
    address: "神奈川県川崎市",
    time: "2022-12-01",
    price: prices[idx],
    case: 0, #０が発送前、１が発送済み
    cart: 0, #０がカート、１が注文表
    session: "あり",
    member_id: a,
  )
end
