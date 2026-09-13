-- Caps Lock is remapped to F13 by the voxtype:caps xkb option.
if o.cmd_present("voxtype") then
  o.bind("F13", "Toggle dictation", "voxtype record toggle")
end
