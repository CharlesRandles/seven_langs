;;;Clojure Day 1
(ns day1)
;;Let's have some basic unit testing
(use 'clojure.test)

;;;;Implement a function called (big st n) that returns true if a string s is longer than n characters.

(defn big[st n]
  (> (count st) n))

(deftest day1
  (is (not( big "" 1)))
  (is (big "Hello" 4))
  (is (not (big "Hello" 5))))

;;;;Write a function called (collection-type col) that returns :list, :map or :vector based on the type of collection col.

;;I have no idea how you could do this based on what we learned in day 1
;;But here's how I would do it.

(defn collection-type[col]
  (cond (list? col) :list
	(map? col) :map
	(vector? col) :vector
	(set? col) :set))

;;All the possibilities I could think of.
(deftest coltype-test
  (is ( = (collection-type '()) :list))
  (is ( = (collection-type '(1)) :list))
  (is ( = (collection-type '(1 2)) :list))
  (is ( = (collection-type {}) :map))
  (is ( = (collection-type {:a 4}) :map))
  (is ( = (collection-type {:a 4 :b 5}) :map))
  (is ( = (collection-type []) :vector))
  (is ( = (collection-type ["Hello"]) :vector))
  (is ( = (collection-type ["Hello, " "World"]) :vector))
  (is ( = (collection-type #{}) :set))
  (is ( = (collection-type #{1}) :set))
  (is ( = (collection-type #{1 2}) :set)))

;;Check the functions work
(run-tests 'day1)