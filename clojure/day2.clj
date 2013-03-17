;;;;Day2 exercises
(ns day2)
(use 'clojure.test)

;Implement an unless with an else condition using macros.
(defmacro unless[test unless-clause  else-clause]
  `(if (not ~test) 
       ~unless-clause
     ~else-clause))

(deftest unless-tests
  (let [big 5]
       (is (= (unless (> 3 big) :small :big) :small))
       (is (= (unless (> 7 big) :small :big) :big))))

(run-tests 'day2)

;Write a type using defrecord that implements a protocol.
(defprotocol Vehicle
  "A model of a vehicle"
  (count-wheels [this] "Returns number of wheels")
  (move [this distance] "Tells you how it moves a specified distance"))

(defrecord Bike [type]
  Vehicle
  (count-wheels [this] 2)
  (move [this distance]
	(format "%s pedaled %d metres." type distance)))

(defrecord Airliner [type]
  Vehicle
  (count-wheels [this] "many")
  (move [this distance]
	(format "%s has flown hundreds of passengers %d thousand kilometers" type distance)))

(def roadie (Bike. "Road bike"))
(println (format "Bike has %s wheels." (str (count-wheels roadie))))
(println (move roadie 400))

(def airbus380 (Airliner. "Airbus 380"))
(println (format "Airliner has %s wheels." (count-wheels airbus380)))
(println (move airbus380 8))

