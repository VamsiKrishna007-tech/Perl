# How to take user's input for an array and print elements in a reverse order

print "Enter 5 elements to the array: \n";
@Lines = <STDIN>;
print "Elements are : @Lines \n";
@reverse_array = reverse @Lines;
print "Elements are : @reverse_array \n";
print "Elements are: @reverse_array \n";