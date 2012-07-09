class RunTimeEnvironment

  PRODUCTION = "production"
  DEVELOPMENT = "development"
  STAGING = "staging"
  TEST = "test"

  def self.get_runtime_environment
    environment =   ENV['RAILS_ENV']

    return environment
  end

  def self.is_production?
       return ENV['RAILS_ENV'] == PRODUCTION
  end

def self.is_development?
  return ENV['RAILS_ENV'] == DEVELOPMENT
end

  def self.is_staging?
    return ENV['RAILS_ENV'] == STAGING
  end

  def self.is_test?
    return ENV['RAILS_ENV'] == TEST
  end

  def self.log_runtime_environment
    puts  "---- Rails Env: " + ENV['RAILS_ENV']
  end

end