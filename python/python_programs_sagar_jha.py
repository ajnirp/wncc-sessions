### question 1
a=range(50)
from random import shuffle
shuffle(a)
print(a)

def findMin1(a):
    m=a[0]
    for x in a:
        if x < m:
            m=x
    return m

print(findMin1(a))

def findMin2(a):
    if len(a)==1:
        return a[0]
    
    else:
        k=findMin2(a[1:len(a)])
        if k < a[0]:
            return k
        else:
            return a[0]

print(findMin2(a))

### question 2
a="abcdefghijklmn opq rstuvwxyz"

def findLen(a,k=0):
    for x in a:
        k=k+1
    return k

print(findLen(a))

### question 3
def fac(n):
    return n*fac(n-1) if n != 0 else 1

print(fac(7))

a=range(30)

### question 4
def sumEven1(a):
    sum=0
    for x in a:
        if x%2==0:
            sum=sum+x
    return sum;

print(sumEven1(a))

def sumEven2(a):
    if a==[]:
        return 0
    sum=sumEven2(a[1:len(a)])
    if a[0]%2 == 0:
        return a[0]+sum
    else:
        return sum

print(sumEven2(a))

### question 5
def add():
    sum=0
    for x in range(1000):
        if (x%3)*(x%5)==0:
            sum=sum+x
    return sum

print(add())

### question 6
a='aaababbbabababbabbbababbaa'
def prefix(a):
    b=[a[:i+1] for i in range(len(a)) if a[i]!='a']
    return b

print(prefix(a))

### question 7
a=7819
def sum_digits1(a):
    if a < 10 :
        return a
    return a%10+sum_digits1(a/10)

print(sum_digits1(a))

def sum_digits2(a):
    b={}
    if a < 10 :
        b={a:a}
        return a
    b[a]=a%10+sum_digits2(a/10)
    return b[a]

print(sum_digits2(a))

### question 8
a=[1,2,3,1,5,1,2,4,3,5]
def rem_dup(a):
    a.sort()
    b=[a[0]]
    for x in a:
        if x!=b[len(b)-1]:
            b+=[x]
    a=b
    return a

print(rem_dup(a))

### question 9
def digits(a):
    if a<10:
        return [a]
    return [a%10]+digits(a/10)
    

def check_for_palin(b):
    if (len(b)==0) | (len(b)==1):
        return True
    if (b[0]!=b[len(b)-1]):
        return False
    return check_for_palin(b[1:len(b)-1])

a="12321"
def palin(a):
    a=int(a)
    b=digits(a)
    return check_for_palin(b)

print(palin(a))

### question 10
a="32947749"
def drop_alt(a):
    b=''
    for i in range(len(a)):
        if i%2==1:
            b+=a[i]
    return b

print(drop_alt(a))

### question 11
import math
a=673
def prime(a):
    for i in range(2,int(math.sqrt(a))+1):
        if a%i == 0:
            return False
    return True

print(prime(a))

### question 12
a=range(20)
def duplicate(a):
    b=[]
    for x in a:
        b+=[x]+[x]
    return b

print(duplicate(a))

### question 13
a="abcdefghijk"
def drop_alt_str(a):
    b=''
    for i in range(len(a)):
        if i%2==0:
            b+=a[i]
    return b

print(drop_alt_str(a))

### question 14
a=[1,3,2,5,1,3,5,6,2,6,7,65]
def rearrange(a):
    b=a[:len(a)/2]
    c=a[len(a)/2:]
    b.sort(reverse=True)
    c.sort()
    return b+c

print(rearrange(a))

### question 15
a="*sdad*f*lpqr*"
def flush(a):
    b=""
    if (a[0]!='*') & (a[1]!='*'):
        b+=a[0]
    for i in range(1,len(a)-1):
        if (a[i]!='*') & (a[i-1]!='*') & (a[i+1]!='*'):
            b+=a[i]
    if (a[len(a)-1]!='*') & (a[len(a)-2]!='*'):
        b+=a[len(a)-1]
    return b

print(flush(a))

### question 16
a='abcd'
def permute(a):
    b=[]
    if len(a)==1:
        return a
    else:
        c=permute(a[1:len(a)])
        for x in c:
            for i in range(len(a)):
                y=x[:i]
                y+=a[0]
                y+=x[i:len(x)]
                b+=[y]
    return b

print(permute(a))

### question 17
from random import shuffle
a=0.1567
def gen_rand_str(a):
    k=int(a*1000)
    b=range(1000)
    shuffle(b)
    c=''
    for x in b:
        if x < k:
            c+='1'
        else:
            c+='0'
    return c

print(gen_rand_str(a))
