<!-- Andrea A -->
# Github API Warmup

Run file with environment key

Replace ```<username> ``` with your github username

```
API_KEY=xxxxxx pry

load 'github.rb'

runner = Github.new

runner.repo_list
runner.commits_by_repo("<username>")

```
