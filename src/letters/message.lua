function message()
    -- This creates a small pop-up with a single button.
       local returnTable = MessageBox(
           {
               title = "Acknowledgement",
               message = "Heads up, be sure you're referencing any\nmulti-instance fixtures by PARENT fixture ID. Also, be aware of \nflooding your command line. A fix is in the works!",
               commands = {{value = 1, name = "Confirm"}}
           }
       )
   
       -- Print the content of the returned table.
       Printf("Success = "..tostring(returnTable.success))
       Printf("Result = "..returnTable.result)
   end
   
   return message()