names = ["ポテト", "唐揚げ", "コーラ", "ジンジャーエール", "烏龍茶", "オレンジジュース"]
prices = [200, 300, 150, 150, 150, 150]
0.upto(5) do |idx|
  Sidemenu.create(
    name: names[idx],
    price: prices[idx],
    size: 1,
    recommend: 0,
    stock: 3
  )
end
