# 1. Write a minitest assertion that will fail if the value.odd? is not true.
assert(value.odd?, "Value is not odd") # Error message added after book solution
assert_equal(true, value.odd?) # this is to test not truthy, but actually true

# 2. Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
assert_equal('xyz', value.downcase)

# 3. Write a minitest assertion that will fail if value is not nil.
assert_nil(value, "Value is not nil")

# 4. Write a minitest assertion that will fail if the Array list is not empty.
assert_empty(list, "Array is not empty")

# 5. Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
assert_includes(list, 'xyz')

# 6. Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
assert_raises(NoExperienceError) { employee.hire }

# 7. Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
assert_instance_of(Numeric, value)

# 8. Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).
assert_kind_of(Numeric, value)

# 9. Write a test that will fail if list and the return value of list.process are different objects.
assert_same(list, list.process)

# 10. (Refutation) Write a test that will fail if 'xyz' is one of the elements in the Array list:
refute_includes(list, 'xyz')
