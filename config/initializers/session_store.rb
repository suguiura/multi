# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_multi_session',
  :secret      => 'ab5073a06c698866374d404b8fb6b7c291679ebf0223be2b15588d92feaf543df40c7a8cbd128522585aaa27ffa2ff0d39135434c1a4ae593bcf7d534fa653dd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
