names = ["チーズ", "Wチーズ", "トマト", "エビ", "明太子", "コーン", "チキン", "帆立"]
prices = [100, 150, 100, 200, 150, 100, 250, 200]
0.upto(7) do |idx|
  Topping.create(
    name: names[idx],
    price: prices[idx],
    stock: 10
  )
end
