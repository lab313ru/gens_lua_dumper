require "binio"

local caddr, daddr, log
  os.execute("mkdir dumps_dir")
  logpath = "dumps_dir\\data.log"
  dumppath = "dumps_dir\\dump_%06X.bin"

local START_ADDR = 0xAABBCC
local END_ADDR_1 = 0xAABBCD
local END_ADDR_2 = 0xAABBCE
local END_ADDR_3 = 0xAABBCF

memory.registerexec(START_ADDR, function()
  caddr = memory.getregister("a0")
  daddr = memory.getregister("a1")
end)

memory.registerexec(END_ADDR_1, function()
local endaddr, csize, dsize, w

  csize = memory.getregister("a0") - caddr
  if (csize % 2) ~= 0 then
  csize = csize + 1
  end
  dsize = memory.getregister("a1") - daddr

  BinIO.Open(string.format(dumppath, caddr), "wb")
  w = memory.readbyterange(daddr, dsize)

  BinIO.Write(w, dsize)
  BinIO.Close()

  log = io.open (logpath, "a");
  local pr = string.format("%06X (%05d / %05d)\n", caddr,csize,dsize)
  
  log:write(pr)
  log:close()
  print(pr)
end)

memory.registerexec(END_ADDR_2, function()
local endaddr, csize, dsize, w

  csize = memory.getregister("a0") - caddr
  if (csize % 2) ~= 0 then
  csize = csize + 1
  end
  dsize = memory.getregister("a1") - daddr

  BinIO.Open(string.format(dumppath, caddr), "wb")
  w = memory.readbyterange(daddr, dsize)

  BinIO.Write(w, dsize)
  BinIO.Close()

  log = io.open (logpath, "a");
  local pr = string.format("%06X (%05d / %05d)\n", caddr,csize,dsize)
  
  log:write(pr)
  log:close()
  print(pr)
end)

memory.registerexec(END_ADDR_3, function()
local endaddr, csize, dsize, w

  csize = memory.getregister("a0") - caddr
  if (csize % 2) ~= 0 then
  csize = csize + 1
  end
  dsize = memory.getregister("a1") - daddr

  BinIO.Open(string.format(dumppath, caddr), "wb")
  w = memory.readbyterange(daddr, dsize)

  BinIO.Write(w, dsize)
  BinIO.Close()

  log = io.open (logpath, "a");
  local pr = string.format("%06X (%05d / %05d)\n", caddr,csize,dsize)
  
  log:write(pr)
  log:close()
  print(pr)
end)