class Topping < ApplicationRecord
  belongs_to :mainmenu, optional:true
end
