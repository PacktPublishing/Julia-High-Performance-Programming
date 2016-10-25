using HttpServer
using WebSockets

const SDEF = "Tell me more ...";
const SBYE = "Goodbye, please let's talk again soon";

d = Dict();

d["hello"] = "Hi, my name is Eliza";
d["no"]    = "Tell me more about the detail.";
d["yes"]   = "Tell me more about the detail.";
d["you"]   = "Let's not talk about me.";
d["think"] = "Why do you think that?";
d["hate"]  = "So you hate something, tell me more.";
d["what"]  = "Why do you ask ?";
d["want"]  = "I'm here help you with what you want";
d["need"]  = "We all need many thing, is this is important?";
d["why"]   = "Remember therapy is good for you.";
d["know"]  = "How do you know that?";
d["can't"] = "Don't be negative -- be positive!";
d["never"] = "Don't be negative -- be positive!";
d["unhappy"] = "Why are you unhappy?";
d["like"]  = "Why do you like that?";
d["help"]  = "I'm here to help you.";

looping = true;

wsh = WebSocketHandler() do req,clt
  while looping
    s0 = lowercase(read(client))
    s1 = SDEF
    for k in keys(d)
      s = lowercase(k)
      if s == "bye" 
        looping = false
        s1 = SBYE
      else if contains(s0, s)
        s1 = d[k]
        break
      end  
    end
    write(clt, "ELIZA> $s1")
  end
end

