function message()
    -- This creates a small pop-up with a single button.
       local returnTable = MessageBox(
           {
               title = "Acknowledgement",
               message = "Be sure you're referencing any\nmulti-instance fixtures by parent fixture ID. The plugin will automatically\nassign values to respective subfixtures.",
               commands = {{value = 1, name = "Got it"}}
           }
       )
   
       -- Print the content of the returned table.
       Printf("Success = "..tostring(returnTable.success))
       Printf("Result = "..returnTable.result)
   end
   
   return message()