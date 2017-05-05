
# Rails Starter

This is really just here to save a couple steps with using Cloud 9, Rails and Github. I like the Github Licensing and .gitignore and I like the Cloud 9 setup  otherwise. This just combines the two.

# Usage

When starting a new Cloud 9 Rails project, just add `git@github.com:olendorf/rails_starter.git` in the **Clone from Git or Mercurial URL ** box. Then Create yoru Project.

This will mean your README.md has this documentation. So delete this text and add your own. 

Then create a GitHub repository for your new project. **DO NOT** check the options to add a README, .gitignore or a LICENSE since those are already there.

In the Cloud 9 terminal run the following commands.

```
# Check the remotes, should list this repo.
$ git remote -v  

    origin  git@github.com:olendorf/rails_starter.git (fetch)
    origin  git@github.com:olendorf/rails_starter.git (push)
    
# Change the remote URL to reflect your repository
$ git remote set-url origin git@github.com:your_user_name/your_repo_name.git

# Make sure it worked. It should resolved to your project.
$ git remote -v 

    origin  git@github.com:your_user_name/your_repo_name.git (fetch)
    origin  git@github.com:your_user_name/your_repo_name.git (push)
```
