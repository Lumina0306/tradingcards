command = {}
function command.run(message, mt)
  print(message.author.name .. " did !show")
  if #mt == 1 then
    local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json",defaultjson)
    local request = mt[1]
    print(request)
    local curfilename = texttofn(request)
    
    print(curfilename)
    if curfilename ~= nil then
      if uj.inventory[curfilename] then
        print("user has card")
        message.channel:send {
          content = 'Here it is! Your **'.. fntoname(curfilename) .. '** card. The shorthand form is **' .. curfilename .. '**.',
          file = "card_images/" .. curfilename .. ".png"
        }
      else
        print("user doesnt have card")
        message.channel:send("Sorry, but you don't have the **" .. fntoname(curfilename) .. "** card in your inventory.")
      end
    else
      message.channel:send("Sorry, but I could not find the " .. request .. " card in the database. Make sure that you spelled it right!")
    end
  
  -- whole lotta code to display a png image lmao
  else
    message.channel:send("Sorry, but the c!show command expects 1 argument. Please see c!help for more details.")
  end
end
return command
  