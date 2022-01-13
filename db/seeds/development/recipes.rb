names = ["マルゲリータ", "クワトロチーズ", "コーンマヨ", "明太チーズ", "シーフード", "照り焼きチキン"]
0.upto(5) do |idx|
  Recipe.create(
    mainmenu_id: idx + 1,
    name: names[idx]
  )
end
