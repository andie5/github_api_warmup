require 'httparty'
require 'github_api'

class GithubAPI

  # Including their module so we have access to
  # their helper methods
  include HTTParty

  attr_accessor :github, :repo_names, :commits 


   # This is a convenience method for
  # HTTParty::ClassMethods.base_uri
  base_uri 'api.github.com'
  API_KEY = ENV["API_KEY"]


  def initialize
    @github = Github.new(oauth_token: API_KEY)
    @repo_names =[]
    @commit_messages = []
    
  end

# Display the names of 10 latest repos for the given user provided by the token id
  def repo_list

    repo_list = @github.repos.list.sort_by{|repo| repo.created_at}.reverse
    i = 0

    repo_list.each do |repo|
      @repo_names << repo.name
      i+=1
      break if i==10
    end

    @repo_names.each{ |repo| puts "#{repo}"}
    sleep(0.5)
  end


# Print the last 10 commits of each repo
  def commits_by_repo(username)
    @repo_names.each do |repo|

      # Get the commits for a repo
      commit_list = @github.repos.commits.list(username, repo).sort_by{|repo| repo.date}.reverse

      i=0
      commit_list.each do |commit| 
        puts "#{commit['commit']['message']}"
        i+=1
        break if i==10 
      end
      puts ""
      sleep(0.5)
    end
  end

end



