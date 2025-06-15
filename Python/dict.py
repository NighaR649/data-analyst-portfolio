#store word meanings inpython dictionary
dict = {
    "table" : ["a piece of furniture","list of facts and figures"],
    "cat" : "a small animal"
}
print(dict)
#Wap to enter marks of 3 subjects from user and store them in a dictionary.Start with an empty dictionary and add one by one.Use subject name as key and marks as values.
sub1 = int(input("enter the marks of maths :"))
sub2 = int(input("enter the marks of science :"))
sub3 = int(input("enter the marks of english :"))
mark = {}
mark.update({"maths":sub1})
mark.update({"science":sub2})
mark.update({"english":sub3})
print(mark)