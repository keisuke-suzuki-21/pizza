names = ["ピザ大好き", "佐藤博貴", "田中チーズ"]
0.upto(2) do |idx|
  Administrator.create(
    password: "pizzakannri",
    password_confirmation: "pizzakannri",
    name: names[idx]
  )
end
