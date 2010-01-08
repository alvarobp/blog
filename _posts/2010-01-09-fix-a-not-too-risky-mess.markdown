--- 
layout: post
title: Fix a not too risky mess
description: Fix the last commit in a git repository
keywords: git commit fix amend
---
First of all, what I describe in this post was done in a concrete non critical situation. This worked fine for me but you should be careful.

What I needed to fix was just a typo and I didn't want to add another commit to my repository just to change one character, so I looked for a [possible solution](http://blog.jacius.info/2008/6/22/git-tip-fix-a-mistake-in-a-previous-commit/) and I used a reduced version consisting of the following steps:

1. Edit the files and make the correction. That is in case you want to fix your last commit. If you have more recent commits you will have to previously use `git rebase` as explained in the post linked earlier.
2. Run `git commit --amend` and save the file. At this point the commit is fixed up.
3. Once my local repository was as I wanted it to be I found that I could not push to the public repository. Then was when I reached the risky part. I did what is not recommended in [this comment](http://stackoverflow.com/questions/253055/how-do-i-push-amended-commit-to-the-remote-git-repo/253726#253726):

        $ git push origin +master:master
    
    Note: I guess this command is just a shortcut for `git push -f origin master`
