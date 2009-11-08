# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tweetmonkey_session',
  :secret      => 'eeaa471d5b5a251cf38c59516027de27a90b2a7ef8c6659d310dcc0258ff7a44c23fb1d8764770298e7af914492d4f2fd0906968ef02d758ba6f4f69df6d5ed9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
