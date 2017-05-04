require("rspec")
require("pg")
require("animal.rb")

require("pry")

DB = PG.connect({:dbname => "pet_shelter_test"})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM people *;")
  end
end
