# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Setting up logentries
Rails.logger = Le.new('d35c551d-f062-475f-a2ad-3ef80fbe1a40', :debug => true, :local => true)