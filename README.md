<!-- Andrea A -->
# Github API Warmup

Run file with environment key

Replace ```<username> ``` with your github username
API_KEY is a token that can be generated by doing the following.

1. In Github, click the "Personal access tokens" tab in your settings.

2. Generate a new access token with permissions for "public repo", "repo status", and "notifications".

3. Make a note of the token.

```
API_KEY=xxxxxx pry

load 'github.rb'

runner = Github.new

runner.repo_list
runner.commits_by_repo("<username>")

```
