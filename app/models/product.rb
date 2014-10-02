class Product < ActiveRecord::Base

	validates :name, presence: true
	validates :price, presence: true,
                    format: { with: /\d{1,},\d{2}/,
                      message: "Digite o valor, incluindo os centavos" }
end
