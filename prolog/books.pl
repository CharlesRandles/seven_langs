book_author(century_rain, alistair_reynolds).
book_author(revelation_space, alistair_reynolds).
book_author(redemption_ark, alistair_reynolds).
book_author(excession, iain_m_banks).
book_author(surface_detail, iain_m_banks).
book_author(carpe_jugulum, terry_pratchett).

book_genre(sf, century_rain).
book_genre(sf, revelation_space).
book_genre(sf, excession).
book_genre(sf, surface_detail).
book_genre(humour, carpe_jugulum).
book_genre(fantasy, carpe_jugulum).

writes_genre(X, A, B) :- book_genre(X,B), book_author(B, A).

books_by(A, B) :- book_author(B, A).

books_by(iain_m_banks, Book).
