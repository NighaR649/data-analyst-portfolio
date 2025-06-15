#You are given a list of subjects for students.assume one classroom is required for one subject.how many classrooms re needed by all students.
#unique subject=classroom, set length=unique value
subjects = {"python","java","C++","python","js","java","python","java","C++","C"}
print(len(subjects))
#figure out a way to store 9 and 9.0 as separate values in a set.(you can take help of built in functions )
values={9,"9.0"}
print(values)
#or by using built in functions
values = {
    ("float",9.0),
    ("int",9)
}
print(values)
