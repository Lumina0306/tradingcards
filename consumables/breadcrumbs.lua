local item = {}

function item.run(uj,ujf,message,mt)
  if not uj.conspt then uj.conspt = "none" end
  if uj.conspt == "none" then
    uj.consumables.breadcrumbs = uj.consumables.breadcrumbs - 1
    if uj.consumables.breadcrumbs == 0 then
      uj.consumables.breadcrumbs = nil
    end
    
    uj.conspt = "deluxebirdseed"
    dpf.savejson(ujf,uj)
    message.channel:send("You eat the **Breadcrumbs.**")
  else
    message.channel:send("You already have a pull affecting item in use! The **Breadcrumbs** were not eaten.")
  end
  
  
  
end
return item