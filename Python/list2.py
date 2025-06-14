#WAP to check if a list contains a palindrome of elements.
list = [1,2,3,2,1]
list1 = [1,"abc","abc",1]
list2 = [1,2,3]
listnew = list.copy()
listnew1 = list1.copy()
listnew2 = list2.copy()
listnew.reverse()
listnew1.reverse()
listnew2.reverse()

if(list == listnew):
    print("List is palindrome")
else:
    print("List is not palindrome")   
if(list1 == listnew1):
    print("List is palindrome")
else:
    print("List is not palindrome")
if(list2 == listnew2):
    print("List is palindrome")
else:
    print("List is not palindrome")        
    