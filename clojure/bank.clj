(ns bank)

(defn make-bank[]
  (ref (hash-map)))

(defn add-account [bank-ref account-name]
     (dosync
      (alter bank-ref assoc-in [account-name] 0)))

(defn balance[bank-ref account-name]
  (@bank-ref account-name))

(defn print-balance [bank-ref account-name]
  (println (format "%s has a balance of $%s" 
		   account-name 
		   (str(balance bank-ref account-name)))))

(defn update-balance[bank-ref account-name amount]
  (let [current-balance (balance bank-ref account-name)]
	  (dosync (alter bank-ref assoc account-name (+ current-balance amount)))))

(defn deposit [bank-ref account-name amount]
  (update-balance bank-ref account-name amount))

(defn withdraw [bank-ref account-name amount]
  (update-balance bank-ref account-name (* -1 amount)))

(def suncorp-bank (make-bank))
(add-account suncorp-bank "Charles")
(print-balance suncorp-bank "Charles")
(deposit suncorp-bank "Charles" 100)  
(print-balance suncorp-bank "Charles")
(withdraw suncorp-bank "Charles" 25)  
(print-balance suncorp-bank "Charles")