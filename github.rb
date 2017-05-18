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

  def repo_list

    repo_list = @github.repos.list

    repo_list.each {|repo| @repo_names << repo.name}
    @repo_names.each{ |repo| puts "#{repo}"}


    sleep(0.5)
  end

  def commitsRepo

    # @repo_names.each do |repo|
    #   commits = @github.repos.commits.list("andie5", repo, sha: '...'
    # end
    commit_list = @github.repos.commits.list("andie5", "learn_ruby")

    commit_list.each {|commit| @commit_messages << commit['commit']['message']}
    @commit_messages.each{ |msg| puts "#{msg}"}

    sleep(0.5)
  end

end



