names = ["マルゲリータ", "クワトロチーズ", "コーンマヨ", "明太チーズ", "シーフード", "照り焼きチキン"]
prices = [800, 1000, 750, 850, 1100, 1050]
0.upto(5) do |idx|
  Mainmenu.create(
    name: names[idx],
    price: prices[idx],
    size: 1,
    recommend: 0
  )
end
