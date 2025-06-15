#print no from 1 to 100
num=1
while num<=100:
    print(num)
    num+=1
#print nos from 100 to 1
num = 100
while num>=1:
    print(num)  
    num-=1
#print multiplication table of a number  n
n=int(input("Enter the number:"))
i=1
while i<=10:
    print(n*i)
    i+=1
#print the elements of the list using loop(index 0<=len(list)-1)
nums=[1,4,9,16,25,36,49,64,81,100]
idx=0
while idx<=len(nums)-1:
    print(nums[idx])
    idx+=1
#Search for a number x in tuple using loop
num=(1,4,9,16,25,36,49,64,81,100)
x=64
idx=0
while idx <= len(num)-1:
    if( num[idx]==x):
        print("found at index",idx)
    else:
        print("finding...")  
    idx+=1  



