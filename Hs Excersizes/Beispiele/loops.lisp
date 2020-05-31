(loop for i 
      below 10
      sum i)
;=> 25
(loop for i 
      from 5
      to 10
      sum i)
;=> 45
(loop for i 
      in '( 1 2 3 4 5)
      sum i)
;=> 15
(loop for i
      below 10 
      when (oddp i) 
        sum i)
;=> 25