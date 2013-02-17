food_type(stilton, cheese).
food_type(cheddar, cheese).
food_type(steak, meat).
food_type(bacon, meat).
food_type(coke, soda).
food_type(strawberry, fruit).
food_type(mango, fruit).

flavour(sweet, fruit).
flavour(savoury, meat).
flavour(savoury, cheese).
flavour(sweet, soda).

food_flavour(X, Y) :- food_type(X, Z), flavour(Y, Z).
