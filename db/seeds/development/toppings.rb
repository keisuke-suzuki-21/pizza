names = ["チーズ", "Wチーズ", "トマト", "サラミ", "明太子", "コーン", "チキン"]
prices = [100, 150, 100, 200, 150, 100, 250]
0.upto(6) do |idx|
  Topping.create(
    name: names[idx],
    price: prices[idx],
    stock: 5,
    mainmenu_id: idx
  )
end
