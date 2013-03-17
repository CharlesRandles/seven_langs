(ns barber)

;;Things we're keeping track of.
(def num-chairs 3)
(def haircut-time 20)
(def chairs-filled (ref 0))
(def haircuts (ref 0))
(def turned-away (ref 0))
(def barber-chair (ref :empty))
(def barber (agent "Barber"))
(def shop (agent "Shop"))

;;A few helpers
(defn plus[a b] (+ a b))
(defn minus[a b] (- a b))
(defn swap-state[state]
  (if (= state :empty)
      :occupied
    :empty))
(defn empty-chair[chair-ref]
  (= :empty @chair-ref))
(defn status[]
  (println (format "Chair state%s" @barber-chair))  
  (println (format "%d Haircuts competed" @haircuts))
  (println (format "%d people waiting" @chairs-filled))
  (println (format "%d people turned away" @turned-away)))

(defn cut-hair[barber]
  ;;Empty a waiting chair
  (dosync (alter chairs-filled minus 1))
  (dosync (alter barber-chair swap-state))
     ;;Cut the hair
  (Thread/sleep haircut-time)
  (dosync (alter haircuts plus 1))
  (dosync (alter barber-chair swap-state)))

(defn customer-arrive[shop]
  ;;A customer turns up
  (if (< @chairs-filled num-chairs)
      ;;Sit down
      (dosync (alter chairs-filled plus 1))
    ;;No space - go elsewhere
    (dosync (alter turned-away plus 1))))

(defn run-barber[seconds]
  (dotimes [n (+ seconds 1)]
	   (println (format "Run for %d seconds." n))
	   (status) ;report every second
	   (let [start-time (System/currentTimeMillis)]
		(while (< (System/currentTimeMillis) (+ start-time 1000))
		  (let [delay (+ 10 (rand-int 20))]
		       (Thread/sleep delay))
		  (customer-arrive shop)
		  (if (and (empty-chair barber-chair)
			   (> @chairs-filled 0))
		      (send barber cut-hair))))))

(let [run-time 10]
     (println "Running a barbershop.")
     (run-barber run-time)
     (shutdown-agents)
     (println (format "Ran for %d seconds" run-time)))
(status)