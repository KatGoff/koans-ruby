# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  if (a | b | c) <= 0
    raise TriangleError, "triangle sides cannot have lengths less than or equal to 0"
  end

  a,b,c = [a,b,c].sort
  if a + b <= c
    raise TriangleError, "the longest side should be less than the sum of the other sides"
  end

  if a == b && b == c then
    :equilateral
  elsif a == b || a == c || b == c then
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
