---
---

# Public: Get a random Number in a specified interval.
#
# min - Min interval Number (inclusive).
# max - Max interval Number (exclusive).
#
# Examples:
#
#   randomBetween(1, 2)
#   # => 1
#   randomBetween(1, 2)
#   # => 2
#   randomBetween(1, 2)
#   # => 1
#
# Returns a random Number.
randomBetween = (min, max) -> Math.floor(Math.random() * (max - min + 1) + min)

# Public: Get a random number between 0 and `max` (exclusive).
#
# max - The max Number (exclusive).
#
# Examples:
#
#   random(2)
#   # => 0
#   random(2)
#   # => 1
#   random(2)
#   # => 1
#
# Returns a random Number.
random = (max) -> randomBetween(0, max - 1)

# Public: Get the matching value of a probability table.
#
# table - The probability table Hash, ie. { 10: 'white', 90: 'black' }.
# x     - The Number to look for.
#
# Examples:
#
#   lookupValue({ 1: 'white', 9: 'black' }, 0)
#   # => 'white'
#   lookupValue({ 1: 'white', 9: 'black' }, 1)
#   # => 'black'
#   lookupValue({ 1: 'white', 9: 'black' }, 4)
#   # => 'black'
#   lookupValue({ 1: 'white', 9: 'black' }, 10)
#   # => undefined
#
# Returns the matching value Object.
lookupValue = (table, x) ->
  # Assume 0 ≤ x < sumOfWeights.
  cumulativeWeight = 0

  for weight, value of table
    # Convert weight into a number.
    cumulativeWeight += Number(weight)

    if x < cumulativeWeight
      return value

# Public: Get a random value from the probability table.
# The probability table defines a list of "chances" and a value for these chances.
# For example, we could have a probability table of 10% = 'white' color,
# and 90% = 'black' color. The result is drawn according to these entries.
#
# table - The probability table Hash, ie. { 10: 'white', 90: 'black' }.
#
# Examples:
#
#   roll({ 10: 'white', 90: 'black' })
#   # => 'black'
#   roll({ 10: 'white', 90: 'black' })
#   # => 'black'
#   roll({ 10: 'white', 90: 'black' })
#   # => 'white'
#
# Returns a random value Object from the probability table Hash.
roll = (table) ->
  sumOfWeights = 0

  for weight, value of table
    # Convert weight into a number.
    sumOfWeights += Number(weight)

  # Get a random number between 0 and sumOfWeights
  # and look for the result.
  x = random(sumOfWeights)
  return lookupValue(table, x)
