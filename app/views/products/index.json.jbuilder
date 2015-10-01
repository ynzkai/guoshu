json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :unit, :amount
  json.url product_url(product, format: :json)
end
