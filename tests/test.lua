-- write to external file, lua
-- Open a file for writing (if the file doesn't exist, it will be created)
local file, err = io.open("output.txt", "w")  -- "w" is write mode

-- Check if there was an error opening the file
if not file then
    print("Error opening file: " .. err)
    return
end

-- Write data to the file
file:write("Hello, world!\n")
file:write("This is Lua writing to a file.\n")

-- Close the file after writing
file:close()

print("Data has been written to output.txt.")
