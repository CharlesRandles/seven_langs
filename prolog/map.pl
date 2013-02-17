different(red, green).
different(red, blue).
different(green, red).
different(green, blue).
different(blue, red).
different(blue, green).

colouring(QLD, NT, WA, SA, VIC, NSW, TAS, ACT):-
  different(QLD, NT),
  different(QLD, SA),
  different(QLD, NSW),
  different(NT, WA),
  different(NT, SA),
  different(WA, SA),
  different(SA, NSW),
  different(SA, VIC),
  different(VIC, NSW),
  different(VIC, TAS),
  different(NSW, ACT).



