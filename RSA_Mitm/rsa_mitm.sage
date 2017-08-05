

def rsa_setup():
  p = 23
  q = 19
  e = 17
  
  N = p*q
  phi_N = (p-1)*(q-1)
  
  print "gcd(e,phi_N) = ", gcd(e,phi_N)
  
  d = power_mod(e,-1,phi_N)
  
  return [N,e,d]
  

def rsa_exp(inp, exp, N):
  return power_mod(Integer(inp),Integer(exp),Integer(N))



def mitm(d,c):
  B = d
  A = ceil(sqrt(B))
  print "A: ", A
  
  d0 = []
  
  for i in range(0, A):
    d0.append( power_mod(c, A*i, N)  )
    
  d0.sort()
  print d0
  
  for j in range(0, A):
    #tmp = power_mod(c, -1, N)
    #tmp = power_mod(tmp, j, N)
    tmp = mod(m * power_mod(c, -j, N),N)
    
    print tmp, tmp in d0
    
    if(tmp in d0):
      d0_index = d0.index(tmp)
      print "d0_index: ", d0_index
      d1_index = j
      print "d1_index: ", d1_index
      
      restored_d = d0_index * A + d1_index
      print "restored_d: ", restored_d

  

params = rsa_setup()
N = params[0]
e = params[1]
d = params[2]

print "key d : " , d

m = 24
c = rsa_exp(m,e,N)

print "Cipher c: ", c

m_new = rsa_exp(c,d,N)

print "Plain m_new: ", m


mitm(d,c)



