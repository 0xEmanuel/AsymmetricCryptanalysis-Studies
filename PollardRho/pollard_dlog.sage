#GLOBALS

p = 17 
alpha = 5
beta = 10




def order(alpha):
  for i in range (1,p):
    if power_mod(alpha,i,p) == 1:
      print "found ord: ", i
      return i

q = order(alpha) # wenn alpha ein Generator ist dann ist ord(alpha) = p-1


def func(s,x,y):
  if 0 == mod(s, 3):
    s_new = mod(alpha*s, p)
    x_new = mod(x+1,q)
    y_new = y
    
  if 1 == mod(s, 3):
    s_new = mod(beta*s, p)
    x_new = x
    y_new = mod(y+1,q)
    
  if 2 == mod(s, 3):
    s_new = mod(s*s, p)
    x_new = mod(2*x,q)
    y_new = mod(2*y,q)

  return s_new, x_new, y_new


def pollardrho():

  K1,K2 = 1,1

  s1, x1, y1 = 1,0,0
  s2, x2, y2 = 1,0,0
  

  for i in range(1,q):
    s1,x1,y1 = func(s1,x1,y1)
    K1 = s1
    
    s2,x2,y2 = func(s2,x2,y2)
    s2,x2,y2 = func(s2,x2,y2)  
    K2 = s2
    #print "K1: ", K1, " K2: ", K2
    
    print "i: ",i ," |s1: ",s1, " x1: ",x1, " y1: ", y1, "| s2: ",s2, " x2: ",x2, " y2: ", y2 , "|" 
    
    if (K1 == K2):
      print "found K: ", K1
      print "x1: ",x1, " y1: ", y1, " x2: ",x2, " y2: ", y2 
      break

  #bruch kuerzen
  x = x1-x2
  y = y2-y1
  
  print "x: ", x, " y: ", y
   
  d = gcd(x,y)
  
  print "d: ",d
  print "q: ",q
  
  v = mod( int(x) / int(d) , q )
  w = mod( int(y) / int(d) , q )
  
  print "v: ", v, " w: ", w
  
  a =  mod( v * pow(w,-1,q)  , q)
  print "found a: ", a
  return int(a)


#MAIN#
a = pollardrho()        
restored_beta = power_mod(alpha, a, p)
print "restored_beta: ", restored_beta
