def valid_word?(word)
  # Populate this array with some words of your choosing.
  dictionary = ["cat", "cats","running", "run", "trance", "publish", "pub"]
  dictionary.include?(word)
  # Return true if your dictionary contains `word`
  # or false if it does not.
end

 # RETURNS dictionary Array as a String
def available_dictionary
  dictionary = ["cat", "cats","running", "run", "trance", "publish", "pub"]
  return dictionary.join(", ")
end