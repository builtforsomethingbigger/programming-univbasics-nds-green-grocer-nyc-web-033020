def increment_count_of_item (cart, item_name)
  cart_index = 0
  while cart_index < cart.size do
    current_item = cart[cart_index]
    if ( current_item[:item] == item_name )
      current_item[:count] += 1
    end
    cart_index += 1
  end
  cart
end

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0

  while index < collection.length do
    current_item = collection[index]
    if ( current_item[:item] == name )
      return current_item
    end
    index += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  updated_cart = Array.new
  index = 0

  while index < cart.length do
    current_item = cart[index]
    if (find_item_by_name_in_collection(current_item[:item], updated_cart) == nil)
      current_item[:count] = 1
      updated_cart.push(current_item)
    else
      increment_count_of_item( updated_cart, current_item[:item] )
    end
    index += 1
  end
  updated_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0

  while index < coupons.length do
    current_coupon = coupons[index]
    applicable_for_discount = find_item_by_name_in_collection(current_coupon[:item], cart)
      if (applicable_for_discount[:count] / current_coupon[:num] >= 1)
        cart.push( {:item => "#{current_coupon[:item]} W/COUPON",
                    :price => (current_coupon[:cost] / current_coupon[:num]).round(2),
                    :clearance => applicable_for_discount[:clearance],
                    :count => applicable_for_discount[:count] - ( applicable_for_discount[:count] % current_coupon[:num])})

        applicable_for_discount[:count] %= current_coupon[:num]
      end
    index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0
  checkout_ready = Array.new

  while index < cart.length do
    current_item = cart[index]
    if (current_item[:clearance])
      current_item[:price] = current_item[:price] - (current_item[:price] * 0.20)
    end
    checkout_ready.push(current_item)
    index += 1
  end
  checkout_ready
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
