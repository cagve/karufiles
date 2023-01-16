;; extends
(generic_command 
  (command_name)@a (#contains? @a "mathtt") 
  (curly_group 
	(text 
	  (word) @karu
	  )
	)
  )
