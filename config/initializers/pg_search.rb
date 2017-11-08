# Returns results where any word is matched
PgSearch.multisearch_options = {
  using: { tsearch: { any_word: true } }
}